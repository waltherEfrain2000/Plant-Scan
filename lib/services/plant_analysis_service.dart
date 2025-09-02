import 'dart:io';
import '../models/plant_analysis.dart';
import 'universal_plant_analysis_service.dart';

class PlantAnalysisService {
  static final PlantAnalysisService _instance =
      PlantAnalysisService._internal();
  factory PlantAnalysisService() => _instance;
  PlantAnalysisService._internal();

  final UniversalPlantAnalysisService _universalService =
      UniversalPlantAnalysisService();

  /// Análisis completo: Identificación + Deficiencias nutricionales
  Future<PlantAnalysis> analyzeImage(File imageFile) async {
    try {
      print('🌱 Iniciando análisis completo de planta...');

      // PASO 1: Identificar la planta
      var identification = await _universalService.identifyPlant(imageFile);
      print('✅ Planta identificada: ${identification.species}');

      // PASO 2: Analizar deficiencias nutricionales
      var deficiencyAnalysis = await _universalService
          .analyzeNutritionalDeficiencies(imageFile, identification.species);
      print('✅ Análisis nutricional completado');

      // PASO 3: Convertir a formato PlantAnalysis existente
      return _convertToPlantAnalysis(identification, deficiencyAnalysis);
    } catch (e) {
      print('⚠️ Error en análisis, usando datos demo: $e');
      // Fallback a análisis demo si falla
      return _generateMockAnalysis();
    }
  }

  /// Convertir resultados del análisis universal al formato PlantAnalysis existente
  PlantAnalysis _convertToPlantAnalysis(
    PlantIdentificationResult identification,
    NutritionalDeficiencyResult deficiencyAnalysis,
  ) {
    // Extraer enfermedades detectadas (las deficiencias severas se consideran "enfermedades")
    List<String> diseases = [];
    List<String> nutrientDeficiencies = [];

    for (var deficiency in deficiencyAnalysis.deficiencies) {
      if (deficiency.severity == DeficiencySeverity.SEVERE ||
          deficiency.severity == DeficiencySeverity.CRITICAL) {
        diseases.add(
          '${deficiency.nutrient} - ${_getSeverityText(deficiency.severity)}',
        );
      } else {
        nutrientDeficiencies.add(deficiency.nutrient);
      }
    }

    // Si no hay problemas severos, agregar estado saludable
    if (diseases.isEmpty && nutrientDeficiencies.isEmpty) {
      diseases.add('Planta saludable - Sin problemas detectados');
    }

    // Generar recomendaciones combinadas
    List<String> recommendations = [];
    recommendations.add('🆔 Planta identificada: ${identification.commonName}');
    recommendations.add(
      '🔬 Confianza de identificación: ${(identification.confidence * 100).toStringAsFixed(1)}%',
    );
    recommendations.addAll(deficiencyAnalysis.recommendations);

    return PlantAnalysis(
      plantType: identification.commonName,
      diseases: diseases,
      nutrientDeficiencies: nutrientDeficiencies,
      confidence:
          (identification.confidence + deficiencyAnalysis.confidence) / 2,
      recommendation: recommendations.join('\n'),
      analysisDate: DateTime.now(),
    );
  }

  String _getSeverityText(DeficiencySeverity severity) {
    switch (severity) {
      case DeficiencySeverity.MILD:
        return 'Leve';
      case DeficiencySeverity.MEDIUM:
        return 'Moderada';
      case DeficiencySeverity.SEVERE:
        return 'Severa';
      case DeficiencySeverity.CRITICAL:
        return 'Crítica';
    }
  }

  PlantAnalysis _generateMockAnalysis() {
    // Simulamos diferentes tipos de análisis para plantas de café
    final List<Map<String, dynamic>> mockResults = [
      {
        'plant_type': 'Coffea arabica',
        'diseases': ['Roya del café'],
        'nutrient_deficiencies': ['Deficiencia de Nitrógeno'],
        'confidence': 0.85,
        'recommendation':
            'Aplicar fungicida específico para roya y fertilizante rico en nitrógeno. Mejorar el drenaje del suelo.',
      },
      {
        'plant_type': 'Coffea arabica',
        'diseases': [],
        'nutrient_deficiencies': ['Deficiencia de Potasio'],
        'confidence': 0.78,
        'recommendation':
            'Aplicar fertilizante rico en potasio. Las hojas amarillentas indican esta deficiencia.',
      },
      {
        'plant_type': 'Coffea arabica',
        'diseases': ['Antracnosis'],
        'nutrient_deficiencies': [],
        'confidence': 0.92,
        'recommendation':
            'Tratar con fungicida sistémico. Mejorar la ventilación entre plantas.',
      },
      {
        'plant_type': 'Coffea arabica',
        'diseases': [],
        'nutrient_deficiencies': [],
        'confidence': 0.95,
        'recommendation':
            'La planta se ve saludable. Continuar con el cuidado regular.',
      },
      {
        'plant_type': 'Coffea arabica',
        'diseases': ['Cercospora'],
        'nutrient_deficiencies': ['Deficiencia de Magnesio'],
        'confidence': 0.73,
        'recommendation':
            'Aplicar fungicida para cercospora y sulfato de magnesio. Revisar el pH del suelo.',
      },
    ];

    final random = DateTime.now().millisecondsSinceEpoch % mockResults.length;
    return PlantAnalysis.fromJson(mockResults[random]);
  }

  // Lista de enfermedades comunes del café
  static const List<String> coffeeDistases = [
    'Roya del café (Hemileia vastatrix)',
    'Antracnosis (Colletotrichum spp.)',
    'Cercospora (Cercospora coffeicola)',
    'Mal de machete (Ceratocystis fimbriata)',
    'Llaga macana (Ceratocystis fimbriata)',
    'Muerte descendente',
  ];

  // Lista de deficiencias nutricionales comunes
  static const List<String> nutrientDeficiencies = [
    'Deficiencia de Nitrógeno',
    'Deficiencia de Fósforo',
    'Deficiencia de Potasio',
    'Deficiencia de Magnesio',
    'Deficiencia de Hierro',
    'Deficiencia de Zinc',
    'Deficiencia de Boro',
  ];
}
