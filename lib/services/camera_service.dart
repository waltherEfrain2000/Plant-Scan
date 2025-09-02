import 'dart:io';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraService {
  static final CameraService _instance = CameraService._internal();
  factory CameraService() => _instance;
  CameraService._internal();

  CameraController? _controller;
  List<CameraDescription>? _cameras;
  final ImagePicker _picker = ImagePicker();

  bool get isInitialized => _controller?.value.isInitialized ?? false;
  CameraController? get controller => _controller;

  Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.request();
    return status == PermissionStatus.granted;
  }

  Future<void> initializeCamera() async {
    try {
      // Verificar permisos
      final hasPermission = await requestCameraPermission();
      if (!hasPermission) {
        throw Exception('Permiso de cámara denegado');
      }

      // Obtener cámaras disponibles
      _cameras = await availableCameras();
      if (_cameras == null || _cameras!.isEmpty) {
        throw Exception('No se encontraron cámaras disponibles');
      }

      // Preferir cámara trasera para mejor calidad en el análisis de plantas
      final backCamera = _cameras!.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
        orElse: () => _cameras!.first,
      );

      // Inicializar controlador
      _controller = CameraController(
        backCamera,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await _controller!.initialize();
    } catch (e) {
      throw Exception('Error al inicializar la cámara: $e');
    }
  }

  Future<File?> takePicture() async {
    if (!isInitialized) {
      throw Exception('La cámara no está inicializada');
    }

    try {
      final XFile image = await _controller!.takePicture();
      return File(image.path);
    } catch (e) {
      throw Exception('Error al tomar la foto: $e');
    }
  }

  Future<File?> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      return image != null ? File(image.path) : null;
    } catch (e) {
      throw Exception('Error al seleccionar imagen: $e');
    }
  }

  void dispose() {
    _controller?.dispose();
    _controller = null;
  }

  Future<void> switchCamera() async {
    if (_cameras == null || _cameras!.length < 2) return;

    final currentCamera = _controller?.description;
    final newCamera = _cameras!.firstWhere(
      (camera) => camera != currentCamera,
      orElse: () => _cameras!.first,
    );

    await _controller?.dispose();
    _controller = CameraController(
      newCamera,
      ResolutionPreset.high,
      enableAudio: false,
    );
    await _controller!.initialize();
  }

  Future<void> setFlashMode(FlashMode mode) async {
    if (isInitialized) {
      await _controller!.setFlashMode(mode);
    }
  }
}
