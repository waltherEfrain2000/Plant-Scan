import 'dart:io';
import 'package:flutter/material.dart';
import '../services/camera_service.dart';

class ImagePickerHelper {
  static final CameraService _cameraService = CameraService();

  static Future<File?> showImageSourceDialog(BuildContext context) async {
    return await showDialog<File?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Seleccionar fuente de imagen'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.blue),
                title: const Text('Cámara'),
                subtitle: const Text('Tomar una nueva foto'),
                onTap: () async {
                  Navigator.of(context).pop(); // Cerrar diálogo
                  // Navegar a la pantalla de cámara
                  Navigator.pushNamed(context, '/camera');
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library, color: Colors.green),
                title: const Text('Galería'),
                subtitle: const Text('Seleccionar foto existente'),
                onTap: () async {
                  Navigator.of(context).pop(); // Cerrar diálogo
                  try {
                    final file = await _cameraService.pickImageFromGallery();
                    if (file != null && context.mounted) {
                      // Ir directamente a análisis con la imagen de galería
                      Navigator.pushNamed(
                        context,
                        '/analysis',
                        arguments: file,
                      );
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error: $e'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  static void showCoffeeDetectionTips(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.tips_and_updates, color: Colors.amber),
              const SizedBox(width: 8),
              const Text('Consejos para mejores resultados'),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTip(
                  icon: Icons.wb_sunny,
                  title: 'Iluminación',
                  description:
                      'Usa luz natural o iluminación brillante y uniforme',
                ),
                const SizedBox(height: 12),
                _buildTip(
                  icon: Icons.center_focus_strong,
                  title: 'Enfoque',
                  description:
                      'Asegúrate de que la hoja esté completamente enfocada',
                ),
                const SizedBox(height: 12),
                _buildTip(
                  icon: Icons.crop_landscape,
                  title: 'Encuadre',
                  description:
                      'Incluye toda la hoja en el marco, evita sombras',
                ),
                const SizedBox(height: 12),
                _buildTip(
                  icon: Icons.bug_report,
                  title: 'Síntomas',
                  description:
                      'Enfoca en áreas con síntomas visibles de enfermedades',
                ),
                const SizedBox(height: 12),
                _buildTip(
                  icon: Icons.straighten,
                  title: 'Distancia',
                  description: 'Mantén una distancia de 15-30cm de la hoja',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Entendido'),
            ),
          ],
        );
      },
    );
  }

  static Widget _buildTip({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.green),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                description,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Widget personalizado para mostrar información sobre las enfermedades
class DiseaseInfoCard extends StatelessWidget {
  final String title;
  final List<String> symptoms;
  final List<String> treatments;
  final Color color;

  const DiseaseInfoCard({
    super.key,
    required this.title,
    required this.symptoms,
    required this.treatments,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ExpansionTile(
        leading: Icon(Icons.local_hospital, color: color),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: color),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Síntomas:',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ...symptoms.map(
                  (symptom) => Padding(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('• ', style: TextStyle(color: color)),
                        Expanded(child: Text(symptom)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Tratamientos:',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ...treatments.map(
                  (treatment) => Padding(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('• ', style: TextStyle(color: color)),
                        Expanded(child: Text(treatment)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Datos de enfermedades del café
class CoffeeDiseaseData {
  static final List<Map<String, dynamic>> diseases = [
    {
      'title': 'Roya del Café',
      'symptoms': [
        'Manchas amarillas en el envés de las hojas',
        'Polvo anaranjado en las lesiones',
        'Defoliación prematura',
        'Reducción en la producción',
      ],
      'treatments': [
        'Aplicar fungicidas cúpricos',
        'Mejorar la ventilación del cultivo',
        'Eliminar hojas infectadas',
        'Controlar la humedad',
      ],
      'color': Colors.orange,
    },
    {
      'title': 'Antracnosis',
      'symptoms': [
        'Manchas oscuras circulares en hojas',
        'Lesiones hundidas en frutos',
        'Caída prematura de hojas',
        'Secamiento de ramas',
      ],
      'treatments': [
        'Fungicidas sistémicos',
        'Poda sanitaria',
        'Mejora del drenaje',
        'Fertilización balanceada',
      ],
      'color': Colors.red,
    },
    {
      'title': 'Cercospora',
      'symptoms': [
        'Manchas circulares con centro gris',
        'Bordes oscuros en las lesiones',
        'Hojas amarillentas',
        'Defoliación gradual',
      ],
      'treatments': [
        'Fungicidas preventivos',
        'Control de malezas',
        'Manejo de sombra',
        'Nutrición equilibrada',
      ],
      'color': Colors.brown,
    },
  ];

  static final List<Map<String, dynamic>> deficiencies = [
    {
      'title': 'Deficiencia de Nitrógeno',
      'symptoms': [
        'Hojas amarillentas generalizadas',
        'Crecimiento lento',
        'Hojas más pequeñas',
        'Reducción en floración',
      ],
      'treatments': [
        'Fertilizante nitrogenado',
        'Abono orgánico',
        'Urea diluida',
        'Compost rico en nitrógeno',
      ],
      'color': Colors.yellow.shade700,
    },
    {
      'title': 'Deficiencia de Potasio',
      'symptoms': [
        'Bordes quemados en hojas',
        'Manchas amarillas entre venas',
        'Frutos pequeños',
        'Resistencia reducida a enfermedades',
      ],
      'treatments': [
        'Sulfato de potasio',
        'Ceniza de madera',
        'Fertilizantes complejos',
        'Mulch orgánico',
      ],
      'color': Colors.orange.shade700,
    },
    {
      'title': 'Deficiencia de Magnesio',
      'symptoms': [
        'Clorosis entre venas (hojas viejas)',
        'Venas permanecen verdes',
        'Caída prematura de hojas',
        'Producción reducida',
      ],
      'treatments': [
        'Sulfato de magnesio',
        'Dolomita',
        'Fertilizante foliar',
        'Cal dolomítica',
      ],
      'color': Colors.green.shade700,
    },
  ];
}
