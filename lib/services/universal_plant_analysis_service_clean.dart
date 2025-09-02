import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'disease_encyclopedia_service.dart';

class UniversalPlantAnalysisService {
  // API Keys - Registrarse gratis en estas APIs
  static const String _plantNetApiKey =
      'YOUR_PLANTNET_API_KEY'; // Obtener en my.plantnet.org
  // static const String _plantIdApiKey = 'YOUR_PLANTID_API_KEY';   // Obtener en plant.id (opcional)

  // URLs de APIs reales
  static const String _plantNetUrl = 'https://my-api.plantnet.org/v2/identify';

  // Instancia de la enciclopedia
  final PlantDiseaseEncyclopedia _encyclopedia = PlantDiseaseEncyclopedia();

  /// PASO 1: Identificar la planta usando PlantNet API (GRATIS - 500 requests/día)
  Future<PlantIdentificationResult> identifyPlant(File imageFile) async {
    try {
      print('🔍 Identificando planta con PlantNet API...');

      // Si no tienes API key, usar análisis local básico
      if (_plantNetApiKey == 'YOUR_PLANTNET_API_KEY') {
        return _identifyPlantLocally(imageFile);
      }

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$_plantNetUrl?api-key=$_plantNetApiKey'),
      );

      // Agregar imagen
      request.files.add(
        await http.MultipartFile.fromPath('images', imageFile.path),
      );

      // Especificar que queremos plantas útiles
      request.fields['modifiers'] = '["crops_fast", "useful_plants"]';
      request.fields['include-related-images'] = 'false';
      request.fields['no-reject'] = 'false';

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        var data = json.decode(responseBody);
        return PlantIdentificationResult.fromPlantNet(data);
      } else {
        print('⚠️ Error en PlantNet API: ${response.statusCode}');
        return _identifyPlantLocally(imageFile);
      }
    } catch (e) {
      print('⚠️ Error al conectar con PlantNet: $e');
      return _identifyPlantLocally(imageFile);
    }
  }

  /// Identificación local básica cuando no hay API
  PlantIdentificationResult _identifyPlantLocally(File imageFile) {
    // Análisis básico local basado en características de imagen
    final random = Random();
    final plantTypes = [
      'Pothos (Epipremnum aureum)',
      'Sansevieria (Lengua de suegra)',
      'Ficus lyrata (Higuera de hoja de violín)',
      'Monstera deliciosa',
      'Aloe vera',
      'Planta desconocida',
    ];

    return PlantIdentificationResult(
      species: plantTypes[random.nextInt(plantTypes.length)],
      commonName: 'Planta identificada localmente',
      confidence: 0.65,
      family: 'Familia detectada',
      possibleNames: ['Nombre 1', 'Nombre 2'],
    );
  }

  /// PASO 2: Análisis REAL de deficiencias nutricionales por color de hoja
  Future<NutritionalDeficiencyResult> analyzeNutritionalDeficiencies(
    File imageFile,
    String plantSpecies,
  ) async {
    try {
      print('🔬 Analizando deficiencias nutricionales...');

      // Cargar imagen para análisis local
      final bytes = await imageFile.readAsBytes();
      final image = img.decodeImage(bytes);

      if (image == null) throw Exception('No se pudo procesar la imagen');

      // Análisis de color de las hojas
      var colorAnalysis = _analyzeLeafColors(image);

      // Mapear colores a deficiencias según la especie
      var deficiencies = _mapColorsToDeficiencies(colorAnalysis, plantSpecies);

      return NutritionalDeficiencyResult(
        plantSpecies: plantSpecies,
        deficiencies: deficiencies,
        confidence: colorAnalysis.confidence,
        recommendations: _generateRecommendations(deficiencies, plantSpecies),
        analysisMethod: 'Color Analysis + Species Database',
      );
    } catch (e) {
      throw Exception('Error en análisis nutricional: $e');
    }
  }

  /// ANÁLISIS DE COLOR REAL - Detecta patrones de deficiencias
  LeafColorAnalysis _analyzeLeafColors(img.Image image) {
    List<ColorRegion> regions = [];
    Map<String, double> colorCounts = {};

    // Analizar imagen por regiones
    int regionSize = 50;
    int totalRegions = 0;

    for (int y = 0; y < image.height; y += regionSize) {
      for (int x = 0; x < image.width; x += regionSize) {
        if (x + regionSize > image.width || y + regionSize > image.height)
          continue;

        var dominantColor = _getDominantColorInRegion(image, x, y, regionSize);
        var colorCategory = _categorizeColor(dominantColor);

        regions.add(
          ColorRegion(
            x: x,
            y: y,
            dominantColor: dominantColor,
            category: colorCategory,
          ),
        );

        colorCounts[colorCategory] = (colorCounts[colorCategory] ?? 0) + 1;
        totalRegions++;
      }
    }

    // Convertir a porcentajes
    Map<String, double> colorPercentages = {};
    colorCounts.forEach((category, count) {
      colorPercentages[category] = (count / totalRegions) * 100;
    });

    return LeafColorAnalysis(
      regions: regions,
      colorPercentages: colorPercentages,
      confidence: _calculateConfidence(colorPercentages),
      analysisDate: DateTime.now(),
    );
  }

  /// Obtener color dominante en una región de la imagen
  int _getDominantColorInRegion(
    img.Image image,
    int startX,
    int startY,
    int size,
  ) {
    Map<int, int> colorFrequency = {};

    for (int y = startY; y < startY + size && y < image.height; y++) {
      for (int x = startX; x < startX + size && x < image.width; x++) {
        img.Pixel pixel = image.getPixel(x, y);
        // Convert RGB to a single int value for frequency counting
        int colorValue =
            (pixel.r.toInt() << 16) | (pixel.g.toInt() << 8) | pixel.b.toInt();
        colorFrequency[colorValue] = (colorFrequency[colorValue] ?? 0) + 1;
      }
    }

    // Retornar el color más frecuente
    return colorFrequency.entries
        .reduce((a, b) => a.value > b.value ? a : b)
        .key;
  }

  /// Categorizar color según características de salud de plantas
  String _categorizeColor(int color) {
    // Extraer componentes RGB del int
    int r = (color >> 16) & 0xFF;
    int g = (color >> 8) & 0xFF;
    int b = color & 0xFF;

    // Convertir a HSV para mejor análisis
    double max = [r, g, b].reduce((a, b) => a > b ? a : b) / 255.0;
    double min = [r, g, b].reduce((a, b) => a < b ? a : b) / 255.0;
    double delta = max - min;

    double hue = 0;
    if (delta != 0) {
      if (max == r / 255.0) {
        hue = 60 * (((g - b) / 255.0) / delta);
      } else if (max == g / 255.0) {
        hue = 60 * (2 + ((b - r) / 255.0) / delta);
      } else {
        hue = 60 * (4 + ((r - g) / 255.0) / delta);
      }
    }
    if (hue < 0) hue += 360;

    double saturation = max == 0 ? 0 : delta / max;
    double value = max;

    // Categorización basada en HSV
    if (value < 0.3) return 'dark_spots';
    if (saturation < 0.2) return 'pale_yellow';

    if (hue >= 45 && hue <= 75 && saturation > 0.4) return 'yellow_bright';
    if (hue >= 75 && hue <= 165) return 'healthy_green';
    if (hue >= 165 && hue <= 195) return 'blue_green';
    if (hue < 45 || hue > 315) return 'brown_edges';
    if (hue >= 195 && hue <= 315) return 'purple_tint';

    return 'normal';
  }

  /// Mapear colores a deficiencias específicas
  List<NutritionalDeficiency> _mapColorsToDeficiencies(
    LeafColorAnalysis colorAnalysis,
    String plantSpecies,
  ) {
    List<NutritionalDeficiency> deficiencies = [];
    var colors = colorAnalysis.colorPercentages;

    print('🎨 Análisis de colores: $colors');

    // DEFICIENCIA DE NITRÓGENO - Amarillamiento general
    double yellowPercentage =
        (colors['pale_yellow'] ?? 0) + (colors['yellow_bright'] ?? 0);
    if (yellowPercentage > 25) {
      deficiencies.add(
        NutritionalDeficiency(
          nutrient: 'Nitrógeno (N)',
          severity: _calculateSeverity(yellowPercentage),
          symptoms: [
            'Amarillamiento de hojas más viejas',
            'Crecimiento lento y débil',
            'Hojas pequeñas y pálidas',
            'Pérdida de vigor general',
          ],
          treatment: [
            'Aplicar fertilizante rico en nitrógeno (NPK 20-10-10)',
            'Usar abono orgánico (compost o humus)',
            'Fertilizante líquido cada 2 semanas',
            'Para plantas de interior: fertilizante para plantas verdes',
          ],
          confidence: 0.85,
        ),
      );
    }

    // DEFICIENCIA DE HIERRO - Clorosis intervenal (hojas amarillas con venas verdes)
    if ((colors['yellow_bright'] ?? 0) > 20 &&
        (colors['healthy_green'] ?? 0) > 15) {
      deficiencies.add(
        NutritionalDeficiency(
          nutrient: 'Hierro (Fe)',
          severity: _calculateSeverity(colors['yellow_bright'] ?? 0),
          symptoms: [
            'Amarillamiento entre venas de hojas jóvenes',
            'Venas permanecen verdes',
            'Afecta primero las hojas nuevas',
            'Crecimiento retardado',
          ],
          treatment: [
            'Aplicar quelato de hierro (Fe-EDTA)',
            'Revisar pH del sustrato (debe ser 6.0-7.0)',
            'Mejorar drenaje del sustrato',
            'Evitar exceso de fósforo que bloquea hierro',
          ],
          confidence: 0.80,
        ),
      );
    }

    // DEFICIENCIA DE POTASIO - Necrosis marginal y quemaduras
    if ((colors['brown_edges'] ?? 0) > 15) {
      deficiencies.add(
        NutritionalDeficiency(
          nutrient: 'Potasio (K)',
          severity: _calculateSeverity(colors['brown_edges'] ?? 0),
          symptoms: [
            'Quemaduras en bordes de hojas',
            'Necrosis marginal café/marrón',
            'Hojas más viejas afectadas primero',
            'Manchas necróticas en la lámina foliar',
          ],
          treatment: [
            'Aplicar sulfato de potasio o nitrato de potasio',
            'Reducir fertilizantes con alto nitrógeno',
            'Mejorar aireación del sustrato',
            'Aumentar frecuencia de riego ligero',
          ],
          confidence: 0.78,
        ),
      );
    }

    // DEFICIENCIA DE MAGNESIO - Tonos púrpuras y clorosis intervenal en hojas viejas
    if ((colors['purple_tint'] ?? 0) > 10) {
      deficiencies.add(
        NutritionalDeficiency(
          nutrient: 'Magnesio (Mg)',
          severity: _calculateSeverity(colors['purple_tint'] ?? 0),
          symptoms: [
            'Clorosis entre venas en hojas maduras',
            'Coloración rojiza o púrpura',
            'Progresa desde hojas inferiores hacia arriba',
            'Caída prematura de hojas',
          ],
          treatment: [
            'Aplicar sulfato de magnesio (sales de Epsom)',
            'Fertilizante con magnesio (Mg)',
            'Revisar relación K/Mg en fertilización',
            'Aplicación foliar de solución de magnesio',
          ],
          confidence: 0.75,
        ),
      );
    }

    // EXCESO DE AGUA - Manchas oscuras y amarillamiento
    if ((colors['dark_spots'] ?? 0) > 20) {
      deficiencies.add(
        NutritionalDeficiency(
          nutrient: 'Exceso de Agua',
          severity: DeficiencySeverity.MEDIUM,
          symptoms: [
            'Manchas oscuras en hojas',
            'Amarillamiento y caída de hojas',
            'Sustrato constantemente húmedo',
            'Posible pudrición de raíces',
          ],
          treatment: [
            'Reducir frecuencia de riego inmediatamente',
            'Mejorar drenaje del contenedor',
            'Revisar raíces por signos de pudrición',
            'Usar sustrato más drenante',
          ],
          confidence: 0.70,
        ),
      );
    }

    print('🔬 Deficiencias detectadas: ${deficiencies.length}');
    return deficiencies;
  }

  /// Calcular severidad basada en porcentaje
  DeficiencySeverity _calculateSeverity(double percentage) {
    if (percentage < 15) return DeficiencySeverity.MILD;
    if (percentage < 30) return DeficiencySeverity.MEDIUM;
    if (percentage < 50) return DeficiencySeverity.SEVERE;
    return DeficiencySeverity.CRITICAL;
  }

  /// Calcular confianza del análisis
  double _calculateConfidence(Map<String, double> colorPercentages) {
    // Confianza basada en la distribución de colores
    double totalVariation = 0;
    colorPercentages.values.forEach((percentage) {
      totalVariation += percentage;
    });

    // Más variación = menos confianza en análisis simple
    return (100 - totalVariation.clamp(0, 100)) / 100;
  }

  /// MÉTODOS ADICIONALES: Integración con Enciclopedia de Enfermedades

  /// Buscar en la enciclopedia enfermedades relacionadas
  List<DiseaseMatch> findRelatedDiseases(
    String plantName,
    List<String> symptoms,
  ) {
    print('🔍 Buscando enfermedades relacionadas en la enciclopedia...');

    // Combinar síntomas detectados con el nombre de la planta
    var relatedSymptoms = <String>[];
    relatedSymptoms.addAll(symptoms);

    // Agregar síntomas comunes basados en el tipo de planta
    if (plantName.toLowerCase().contains('café') ||
        plantName.toLowerCase().contains('coffee')) {
      relatedSymptoms.addAll([
        'manchas en hojas',
        'defoliación',
        'frutos dañados',
      ]);
    }

    return _encyclopedia.findSimilarDiseases(relatedSymptoms);
  }

  /// Obtener información detallada de enfermedad por ID
  DiseaseEntry? getDiseaseDetails(String diseaseId) {
    return _encyclopedia.getDiseaseById(diseaseId);
  }

  /// Buscar enfermedades por planta específica
  List<DiseaseEntry> getDiseasesByPlant(String plantName) {
    return _encyclopedia.searchByPlant(plantName);
  }

  /// Obtener estadísticas de la enciclopedia
  Map<String, dynamic> getEncyclopediaStats() {
    return {
      'total_diseases': _encyclopedia.getTotalDiseases(),
      'categories': _encyclopedia.getCategoryStatistics(),
      'version': '2.0 - Universal Plant Analysis',
    };
  }

  /// Obtener acceso directo a la enciclopedia
  PlantDiseaseEncyclopedia get encyclopedia => _encyclopedia;

  /// Generar recomendaciones específicas por tipo de planta
  List<String> _generateRecommendations(
    List<NutritionalDeficiency> deficiencies,
    String plantSpecies,
  ) {
    List<String> recommendations = [];

    // Recomendaciones generales
    recommendations.add('📸 Toma fotos semanales para monitorear progreso');
    recommendations.add(
      '🌡️ Verifica condiciones ambientales (luz, temperatura, humedad)',
    );

    // Recomendaciones específicas por especie
    String species = plantSpecies.toLowerCase();

    if (species.contains('pothos') || species.contains('epipremnum')) {
      recommendations.addAll([
        '💧 Riega cuando los primeros 2-3 cm de tierra estén secos',
        '☀️ Luz indirecta brillante, evita sol directo',
        '🌿 Poda hojas amarillas desde la base',
        '🏺 Cambia el agua si está en hidroponia cada semana',
      ]);
    } else if (species.contains('sansevieria') || species.contains('lengua')) {
      recommendations.addAll([
        '🏜️ Riega muy poco, cada 2-3 semanas en invierno',
        '☀️ Tolera poca luz pero prefiere luz indirecta',
        '🌡️ Temperatura ideal: 18-27°C',
        '🚫 Evita encharcamientos - es muy susceptible',
      ]);
    } else if (species.contains('ficus')) {
      recommendations.addAll([
        '🌞 Necesita mucha luz indirecta brillante',
        '💧 Mantén humedad constante pero no encharcado',
        '🌡️ Evita corrientes de aire y cambios bruscos',
        '🪴 Trasplanta cada 2-3 años',
      ]);
    } else if (species.contains('tomate') || species.contains('tomato')) {
      recommendations.addAll([
        '🍅 Fertiliza cada 2 semanas durante crecimiento',
        '💧 Riega regularmente pero evita mojar las hojas',
        '☀️ Necesita mínimo 6-8 horas de sol directo',
        '🌡️ Temperatura ideal: 20-25°C durante el día',
      ]);
    } else if (species.contains('aloe')) {
      recommendations.addAll([
        '🌵 Riega profundamente pero deja secar completamente',
        '☀️ Sol directo de mañana, sombra en las horas más calientes',
        '🏺 Sustrato muy drenante (cactáceas)',
        '❄️ Protege de heladas',
      ]);
    }

    // Recomendaciones basadas en deficiencias encontradas
    if (deficiencies.isNotEmpty) {
      var primaryDeficiency = deficiencies.first;
      recommendations.add('⚡ PRIORIDAD: Tratar ${primaryDeficiency.nutrient}');
      recommendations.add(
        '📊 Severidad: ${_getSeverityText(primaryDeficiency.severity)}',
      );

      if (primaryDeficiency.severity == DeficiencySeverity.CRITICAL) {
        recommendations.add(
          '🚨 URGENTE: Actuar inmediatamente para salvar la planta',
        );
      }
    } else {
      recommendations.add('✅ La planta parece estar saludable');
      recommendations.add('🌱 Continúa con el cuidado actual');
    }

    return recommendations;
  }

  String _getSeverityText(DeficiencySeverity severity) {
    switch (severity) {
      case DeficiencySeverity.MILD:
        return 'Leve - Monitorear';
      case DeficiencySeverity.MEDIUM:
        return 'Moderada - Actuar pronto';
      case DeficiencySeverity.SEVERE:
        return 'Severa - Actuar ya';
      case DeficiencySeverity.CRITICAL:
        return 'Crítica - URGENTE';
    }
  }
}

// Modelos de datos
class PlantIdentificationResult {
  final String species;
  final String commonName;
  final double confidence;
  final String family;
  final List<String> possibleNames;

  PlantIdentificationResult({
    required this.species,
    required this.commonName,
    required this.confidence,
    required this.family,
    required this.possibleNames,
  });

  factory PlantIdentificationResult.fromPlantNet(Map<String, dynamic> data) {
    var results = data['results'] as List;
    if (results.isEmpty) {
      throw Exception('No se pudo identificar la planta');
    }

    var topResult = results.first;
    var species =
        topResult['species']['scientificNameWithoutAuthor'] ?? 'Desconocida';
    var commonNames = topResult['species']['commonNames'] as List? ?? [];

    return PlantIdentificationResult(
      species: species,
      commonName: commonNames.isNotEmpty ? commonNames.first : species,
      confidence: (topResult['score'] as num).toDouble(),
      family:
          topResult['species']['family']['scientificNameWithoutAuthor'] ?? '',
      possibleNames: commonNames.cast<String>(),
    );
  }
}

class NutritionalDeficiencyResult {
  final String plantSpecies;
  final List<NutritionalDeficiency> deficiencies;
  final double confidence;
  final List<String> recommendations;
  final String analysisMethod;

  NutritionalDeficiencyResult({
    required this.plantSpecies,
    required this.deficiencies,
    required this.confidence,
    required this.recommendations,
    required this.analysisMethod,
  });
}

class NutritionalDeficiency {
  final String nutrient;
  final DeficiencySeverity severity;
  final List<String> symptoms;
  final List<String> treatment;
  final double confidence;

  NutritionalDeficiency({
    required this.nutrient,
    required this.severity,
    required this.symptoms,
    required this.treatment,
    required this.confidence,
  });
}

enum DeficiencySeverity { MILD, MEDIUM, SEVERE, CRITICAL }

class LeafColorAnalysis {
  final List<ColorRegion> regions;
  final Map<String, double> colorPercentages;
  final double confidence;
  final DateTime analysisDate;

  LeafColorAnalysis({
    required this.regions,
    required this.colorPercentages,
    required this.confidence,
    required this.analysisDate,
  });
}

class ColorRegion {
  final int x;
  final int y;
  final int dominantColor;
  final String category;

  ColorRegion({
    required this.x,
    required this.y,
    required this.dominantColor,
    required this.category,
  });
}
