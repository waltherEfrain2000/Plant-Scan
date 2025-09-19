class PlantAnalysis {
  final String plantType;
  final List<String> diseases;
  final List<String> nutrientDeficiencies;
  final double confidence;
  final String recommendation;
  final DateTime analysisDate;
  final List<String> sources; // Fuentes de información

  PlantAnalysis({
    required this.plantType,
    required this.diseases,
    required this.nutrientDeficiencies,
    required this.confidence,
    required this.recommendation,
    required this.analysisDate,
    this.sources = const [],
  });

  factory PlantAnalysis.fromJson(Map<String, dynamic> json) {
    return PlantAnalysis(
      plantType: json['plant_type'] ?? 'Desconocido',
      diseases: List<String>.from(json['diseases'] ?? []),
      nutrientDeficiencies: List<String>.from(
        json['nutrient_deficiencies'] ?? [],
      ),
      confidence: (json['confidence'] ?? 0.0).toDouble(),
      recommendation:
          json['recommendation'] ?? 'Sin recomendaciones disponibles',
      analysisDate: DateTime.now(),
      sources: List<String>.from(json['sources'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'plant_type': plantType,
      'diseases': diseases,
      'nutrient_deficiencies': nutrientDeficiencies,
      'confidence': confidence,
      'recommendation': recommendation,
      'analysis_date': analysisDate.toIso8601String(),
      'sources': sources,
    };
  }

  bool get hasIssues => diseases.isNotEmpty || nutrientDeficiencies.isNotEmpty;

  String get healthStatus {
    if (!hasIssues) return 'Saludable';
    if (diseases.isNotEmpty && nutrientDeficiencies.isNotEmpty)
      return 'Múltiples problemas';
    if (diseases.isNotEmpty) return 'Enfermedad detectada';
    return 'Deficiencia nutricional';
  }
}
