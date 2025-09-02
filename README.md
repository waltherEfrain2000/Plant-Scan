# Plant Scan - Análisis de Plantas de Café 🌱☕

Una aplicación móvil Flutter para detectar enfermedades y deficiencias nutricionales en plantas de café utilizando la cámara del dispositivo y machine learning.

## Características Principales

- 📸 **Captura de imágenes**: Toma fotos de hojas de café usando la cámara
- 🔍 **Análisis IA**: Detecta automáticamente enfermedades y deficiencias nutricionales
- 📱 **Interfaz intuitiva**: Diseño moderno y fácil de usar
- 🏥 **Diagnósticos específicos**: Identifica problemas comunes del café como:
  - Roya del café
  - Antracnosis
  - Cercospora
  - Deficiencias de nitrógeno, potasio, magnesio
- 💡 **Recomendaciones**: Sugerencias de tratamiento personalizadas

## Instalación y Configuración

### Prerrequisitos

- Flutter SDK (versión 3.7.2 o superior)
- Android Studio / VS Code
- Dispositivo Android o iOS para pruebas

### Pasos de instalación

1. **Clona el repositorio**
   ```bash
   git clone <url-del-repositorio>
   cd plant_scan
   ```

2. **Instala las dependencias**
   ```bash
   flutter pub get
   ```

3. **Configura los permisos**
   
   **Android** (ya configurado en AndroidManifest.xml):
   - Permiso de cámara
   - Acceso a almacenamiento
   - Conexión a internet

   **iOS** (editar ios/Runner/Info.plist):
   ```xml
   <key>NSCameraUsageDescription</key>
   <string>Esta app necesita acceso a la cámara para tomar fotos de plantas</string>
   <key>NSPhotoLibraryUsageDescription</key>
   <string>Esta app necesita acceso a la galería para seleccionar fotos</string>
   ```

4. **Ejecuta la aplicación**
   ```bash
   flutter run
   ```

## Estructura del Proyecto

```
lib/
├── main.dart                    # Punto de entrada de la aplicación
├── models/
│   └── plant_analysis.dart     # Modelo de datos para resultados
├── services/
│   ├── camera_service.dart     # Servicio de manejo de cámara
│   └── plant_analysis_service.dart # Servicio de análisis IA
└── screens/
    ├── home_screen.dart        # Pantalla principal
    ├── camera_screen.dart      # Pantalla de captura
    └── analysis_screen.dart    # Pantalla de resultados
```

## Uso de la Aplicación

### 1. Pantalla Principal
- Muestra información sobre las capacidades de la app
- Botones para acceder a cámara o galería
- Lista de enfermedades y deficiencias detectables

### 2. Captura de Imagen
- Vista previa de la cámara en tiempo real
- Marco de enfoque para guiar al usuario
- Instrucciones para obtener mejores resultados
- Opción de seleccionar desde galería

### 3. Análisis y Resultados
- Procesamiento automático de la imagen
- Identificación del tipo de planta
- Detección de enfermedades y deficiencias
- Nivel de confianza del diagnóstico
- Recomendaciones de tratamiento específicas

## Enfermedades y Deficiencias Detectadas

### Enfermedades Comunes del Café:
- **Roya del café** (Hemileia vastatrix)
- **Antracnosis** (Colletotrichum spp.)
- **Cercospora** (Cercospora coffeicola)
- **Mal de machete** (Ceratocystis fimbriata)

### Deficiencias Nutricionales:
- **Nitrógeno**: Hojas amarillentas, crecimiento lento
- **Potasio**: Bordes quemados en hojas
- **Magnesio**: Clorosis entre venas
- **Hierro**: Hojas jóvenes amarillas
- **Zinc**: Hojas pequeñas y deformadas

## Tecnologías Utilizadas

- **Flutter**: Framework de desarrollo multiplataforma
- **Dart**: Lenguaje de programación
- **Camera Plugin**: Acceso a cámara del dispositivo
- **Image Picker**: Selección de imágenes de galería
- **Permission Handler**: Manejo de permisos
- **TensorFlow Lite**: Para modelos de machine learning (próximamente)

## Funcionalidades Futuras

### Integración con Modelos de ML Reales
```dart
// Ejemplo de integración con API de ML
Future<PlantAnalysis> _analyzeWithRealAPI(File imageFile) async {
  var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
  request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));
  
  var response = await request.send();
  var data = json.decode(await response.stream.bytesToString());
  
  return PlantAnalysis.fromJson(data);
}
```

### Características Planificadas:
- 🔗 Integración con APIs de machine learning especializadas
- 📊 Historial de análisis y seguimiento
- 🌐 Sincronización en la nube
- 📈 Dashboard para agricultores
- 🔔 Notificaciones de seguimiento
- 📍 Geolocalización de cultivos
- 📝 Reportes detallados en PDF

## Configuración para Producción

### Variables de Entorno
Crear archivo `.env` en la raíz:
```
ML_API_URL=https://tu-api-ml.com/analyze
API_KEY=tu-clave-api
```

### Modelos de ML Locales
Para usar modelos TensorFlow Lite locales:
1. Coloca el archivo `.tflite` en `assets/models/`
2. Actualiza `pubspec.yaml`:
   ```yaml
   flutter:
     assets:
       - assets/models/plant_disease_model.tflite
   ```

## Contribución

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/amazing-feature`)
3. Commit tus cambios (`git commit -m 'Add amazing feature'`)
4. Push a la rama (`git push origin feature/amazing-feature`)
5. Abre un Pull Request

## Licencia

Este proyecto está bajo la Licencia MIT. Ver `LICENSE` para más detalles.

## Contacto y Soporte

Para preguntas, sugerencias o reportar problemas:
- 📧 Email: tu-email@ejemplo.com
- 🐛 Issues: [GitHub Issues](link-to-issues)
- 📱 WhatsApp: +XX XXX XXX XXXX

## Agradecimientos

- Comunidad Flutter por las herramientas excepcionales
- Investigadores en fitopatología del café
- Agricultores que proporcionaron datos para el entrenamiento del modelo

---

**Nota**: Actualmente la app funciona con datos simulados para demostración. Para uso en producción, integra con un modelo de machine learning real entrenado específicamente para plantas de café.
