import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import '../models/plant_analysis.dart';

class PdfGeneratorService {
  static Future<String> generateAnalysisReport(
    PlantAnalysis analysis, {
    Uint8List? imageBytes,
    Map<String, double>? colorData,
  }) async {
    final pdf = pw.Document();

    // Colores del tema
    final primaryColor = PdfColors.green600;
    final secondaryColor = PdfColors.blue600;
    final accentColor = PdfColors.orange600;
    final textColor = PdfColors.grey800;

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build:
            (pw.Context context) => [
              // Header
              _buildHeader(primaryColor),

              pw.SizedBox(height: 20),

              // Información del análisis
              _buildAnalysisInfo(analysis, primaryColor, textColor),

              pw.SizedBox(height: 20),

              // Estado de salud
              _buildHealthStatus(analysis, primaryColor, textColor),

              pw.SizedBox(height: 20),

              // Imagen si está disponible
              if (imageBytes != null) ...[
                _buildImageSection(imageBytes),
                pw.SizedBox(height: 20),
              ],

              // Colores detectados
              if (colorData != null && colorData.isNotEmpty) ...[
                _buildColorAnalysisSection(
                  colorData,
                  PdfColors.purple600,
                  textColor,
                ),
                pw.SizedBox(height: 20),
              ],

              // Enfermedades detectadas
              if (analysis.diseases.isNotEmpty) ...[
                _buildDiseasesSection(
                  analysis.diseases,
                  secondaryColor,
                  textColor,
                ),
                pw.SizedBox(height: 20),
              ],

              // Deficiencias nutricionales
              if (analysis.nutrientDeficiencies.isNotEmpty) ...[
                _buildNutrientDeficienciesSection(
                  analysis.nutrientDeficiencies,
                  accentColor,
                  textColor,
                ),
                pw.SizedBox(height: 20),
              ],

              // Recomendaciones
              _buildRecommendationsSection(
                analysis.recommendation,
                primaryColor,
                textColor,
              ),

              pw.SizedBox(height: 20),

              // Fuentes
              if (analysis.sources.isNotEmpty) ...[
                _buildSourcesSection(analysis.sources, textColor),
                pw.SizedBox(height: 20),
              ],

              // Footer
              _buildFooter(),
            ],
      ),
    );

    // Guardar el PDF
    final output = await getApplicationDocumentsDirectory();
    final fileName =
        'analisis_planta_${DateTime.now().millisecondsSinceEpoch}.pdf';
    final file = File('${output.path}/$fileName');
    await file.writeAsBytes(await pdf.save());

    return file.path;
  }

  static pw.Widget _buildHeader(PdfColor primaryColor) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(16),
      decoration: pw.BoxDecoration(
        color: primaryColor,
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
      ),
      child: pw.Row(
        children: [
          pw.Text(
            '🌿',
            style: pw.TextStyle(color: PdfColors.white, fontSize: 32),
          ),
          pw.SizedBox(width: 16),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'REPORTE DE ANÁLISIS DE PLANTA',
                style: pw.TextStyle(
                  color: PdfColors.white,
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                'PlantScan - Análisis Inteligente',
                style: pw.TextStyle(color: PdfColors.white, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildAnalysisInfo(
    PlantAnalysis analysis,
    PdfColor primaryColor,
    PdfColor textColor,
  ) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(16),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: primaryColor, width: 1),
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'INFORMACIÓN DEL ANÁLISIS',
            style: pw.TextStyle(
              color: primaryColor,
              fontSize: 14,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 12),
          pw.Row(
            children: [
              pw.Text(
                'Tipo de Planta: ',
                style: pw.TextStyle(
                  color: textColor,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                analysis.plantType,
                style: pw.TextStyle(color: textColor),
              ),
            ],
          ),
          pw.SizedBox(height: 8),
          pw.Row(
            children: [
              pw.Text(
                'Fecha del Análisis: ',
                style: pw.TextStyle(
                  color: textColor,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                '${analysis.analysisDate.day}/${analysis.analysisDate.month}/${analysis.analysisDate.year} ${analysis.analysisDate.hour}:${analysis.analysisDate.minute.toString().padLeft(2, '0')}',
                style: pw.TextStyle(color: textColor),
              ),
            ],
          ),
          pw.SizedBox(height: 8),
          pw.Row(
            children: [
              pw.Text(
                'Confianza: ',
                style: pw.TextStyle(
                  color: textColor,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                '${(analysis.confidence * 100).toStringAsFixed(1)}%',
                style: pw.TextStyle(color: textColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildHealthStatus(
    PlantAnalysis analysis,
    PdfColor primaryColor,
    PdfColor textColor,
  ) {
    final statusColor =
        analysis.hasIssues ? PdfColors.orange600 : PdfColors.green600;
    final statusText = analysis.healthStatus;

    return pw.Container(
      padding: const pw.EdgeInsets.all(16),
      decoration: pw.BoxDecoration(
        color: statusColor,
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
      ),
      child: pw.Row(
        children: [
          pw.Text(
            analysis.hasIssues ? '⚠️' : '✅',
            style: pw.TextStyle(color: PdfColors.white, fontSize: 24),
          ),
          pw.SizedBox(width: 12),
          pw.Text(
            'ESTADO DE SALUD: $statusText'.toUpperCase(),
            style: pw.TextStyle(
              color: PdfColors.white,
              fontSize: 14,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildImageSection(Uint8List imageBytes) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(16),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColors.grey400, width: 1),
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'IMAGEN ANALIZADA',
            style: pw.TextStyle(
              color: PdfColors.grey800,
              fontSize: 14,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 12),
          pw.Container(
            height: 200,
            width: double.infinity,
            child: pw.Image(pw.MemoryImage(imageBytes), fit: pw.BoxFit.contain),
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildColorAnalysisSection(
    Map<String, double> colorData,
    PdfColor sectionColor,
    PdfColor textColor,
  ) {
    // Convertir nombres técnicos a nombres legibles
    String getColorDisplayName(String colorKey) {
      switch (colorKey) {
        case 'healthy_green':
          return 'Verde saludable';
        case 'yellow_bright':
          return 'Amarillo brillante';
        case 'pale_yellow':
          return 'Amarillo pálido';
        case 'brown_edges':
          return 'Bordes cafés';
        case 'purple_tint':
          return 'Tinte púrpura';
        case 'dark_spots':
          return 'Manchas oscuras';
        case 'blue_green':
          return 'Verde azulado';
        default:
          return colorKey;
      }
    }

    // Filtrar solo colores con más del 5%
    final significantColors =
        colorData.entries.where((entry) => entry.value > 5.0).toList()
          ..sort((a, b) => b.value.compareTo(a.value));

    return pw.Container(
      padding: const pw.EdgeInsets.all(16),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: sectionColor, width: 1),
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            children: [
              pw.Text(
                '🎨',
                style: pw.TextStyle(color: sectionColor, fontSize: 20),
              ),
              pw.SizedBox(width: 8),
              pw.Text(
                'ANÁLISIS DE COLORES DETECTADOS',
                style: pw.TextStyle(
                  color: sectionColor,
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 12),
          pw.Text(
            'Distribución porcentual de colores en la imagen analizada:',
            style: pw.TextStyle(color: textColor, fontSize: 11),
          ),
          pw.SizedBox(height: 8),
          ...significantColors.map(
            (entry) => pw.Container(
              margin: const pw.EdgeInsets.only(bottom: 6),
              child: pw.Row(
                children: [
                  pw.Container(
                    width: 8,
                    height: 8,
                    decoration: pw.BoxDecoration(
                      color: _getColorForDisplay(entry.key),
                      shape: pw.BoxShape.circle,
                    ),
                  ),
                  pw.SizedBox(width: 12),
                  pw.Expanded(
                    child: pw.Text(
                      '${getColorDisplayName(entry.key)}: ${entry.value.toStringAsFixed(1)}%',
                      style: pw.TextStyle(color: textColor, fontSize: 11),
                    ),
                  ),
                ],
              ),
            ),
          ),
          pw.SizedBox(height: 8),
          pw.Text(
            'Estos colores se utilizan para detectar posibles deficiencias nutricionales y problemas de salud en las plantas.',
            style: pw.TextStyle(
              color: PdfColors.grey600,
              fontSize: 10,
              fontStyle: pw.FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  static PdfColor _getColorForDisplay(String colorKey) {
    switch (colorKey) {
      case 'healthy_green':
        return PdfColors.green600;
      case 'yellow_bright':
      case 'pale_yellow':
        return PdfColors.yellow600;
      case 'brown_edges':
        return PdfColors.brown600;
      case 'purple_tint':
        return PdfColors.purple600;
      case 'dark_spots':
        return PdfColors.grey600;
      case 'blue_green':
        return PdfColors.blue600;
      default:
        return PdfColors.grey400;
    }
  }

  static pw.Widget _buildDiseasesSection(
    List<String> diseases,
    PdfColor sectionColor,
    PdfColor textColor,
  ) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(16),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: sectionColor, width: 1),
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            children: [
              pw.Text(
                '🦠',
                style: pw.TextStyle(color: sectionColor, fontSize: 20),
              ),
              pw.SizedBox(width: 8),
              pw.Text(
                'ENFERMEDADES DETECTADAS',
                style: pw.TextStyle(
                  color: sectionColor,
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 12),
          ...diseases.map(
            (disease) => pw.Container(
              margin: const pw.EdgeInsets.only(bottom: 8),
              child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Container(
                    width: 6,
                    height: 6,
                    margin: const pw.EdgeInsets.only(top: 6),
                    decoration: pw.BoxDecoration(
                      color: sectionColor,
                      shape: pw.BoxShape.circle,
                    ),
                  ),
                  pw.SizedBox(width: 12),
                  pw.Expanded(
                    child: pw.Text(
                      disease,
                      style: pw.TextStyle(color: textColor, fontSize: 11),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildNutrientDeficienciesSection(
    List<String> deficiencies,
    PdfColor sectionColor,
    PdfColor textColor,
  ) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(16),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: sectionColor, width: 1),
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            children: [
              pw.Text(
                '🌱',
                style: pw.TextStyle(color: sectionColor, fontSize: 20),
              ),
              pw.SizedBox(width: 8),
              pw.Text(
                'DEFICIENCIAS NUTRICIONALES',
                style: pw.TextStyle(
                  color: sectionColor,
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 12),
          ...deficiencies.map(
            (deficiency) => pw.Container(
              margin: const pw.EdgeInsets.only(bottom: 8),
              child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Container(
                    width: 6,
                    height: 6,
                    margin: const pw.EdgeInsets.only(top: 6),
                    decoration: pw.BoxDecoration(
                      color: sectionColor,
                      shape: pw.BoxShape.circle,
                    ),
                  ),
                  pw.SizedBox(width: 12),
                  pw.Expanded(
                    child: pw.Text(
                      deficiency,
                      style: pw.TextStyle(color: textColor, fontSize: 11),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildRecommendationsSection(
    String recommendations,
    PdfColor sectionColor,
    PdfColor textColor,
  ) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(16),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: sectionColor, width: 1),
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            children: [
              pw.Text(
                '💡',
                style: pw.TextStyle(color: sectionColor, fontSize: 20),
              ),
              pw.SizedBox(width: 8),
              pw.Text(
                'RECOMENDACIONES',
                style: pw.TextStyle(
                  color: sectionColor,
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 12),
          pw.Text(
            recommendations,
            style: pw.TextStyle(color: textColor, fontSize: 11),
            textAlign: pw.TextAlign.justify,
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildSourcesSection(
    List<String> sources,
    PdfColor textColor,
  ) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(16),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColors.grey400, width: 1),
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'FUENTES DE INFORMACIÓN',
            style: pw.TextStyle(
              color: PdfColors.grey800,
              fontSize: 14,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 12),
          ...sources.map(
            (source) => pw.Container(
              margin: const pw.EdgeInsets.only(bottom: 6),
              child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    '• ',
                    style: pw.TextStyle(color: textColor, fontSize: 11),
                  ),
                  pw.Expanded(
                    child: pw.Text(
                      source,
                      style: pw.TextStyle(color: textColor, fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildFooter() {
    return pw.Container(
      padding: const pw.EdgeInsets.all(16),
      decoration: pw.BoxDecoration(
        color: PdfColors.grey200,
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
      ),
      child: pw.Column(
        children: [
          pw.Text(
            'Este reporte fue generado automáticamente por PlantScan',
            style: pw.TextStyle(color: PdfColors.grey700, fontSize: 10),
            textAlign: pw.TextAlign.center,
          ),
          pw.SizedBox(height: 4),
          pw.Text(
            'Para más información visite: www.plantscan.app',
            style: pw.TextStyle(color: PdfColors.grey700, fontSize: 10),
            textAlign: pw.TextAlign.center,
          ),
          pw.SizedBox(height: 4),
          pw.Text(
            'Generado el ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
            style: pw.TextStyle(color: PdfColors.grey700, fontSize: 10),
            textAlign: pw.TextAlign.center,
          ),
        ],
      ),
    );
  }

  static Future<void> sharePdf(String filePath) async {
    final file = File(filePath);
    if (await file.exists()) {
      await Printing.sharePdf(
        bytes: await file.readAsBytes(),
        filename: 'analisis_planta.pdf',
      );
    }
  }
}
