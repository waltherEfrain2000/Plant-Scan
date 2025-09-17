import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/camera_screen.dart';
import 'screens/analysis_screen.dart';
import 'widgets/splash_screen.dart';

void main() {
  runApp(const PlantScanApp());
}

class PlantScanApp extends StatefulWidget {
  const PlantScanApp({super.key});

  @override
  State<PlantScanApp> createState() => _PlantScanAppState();
}

class _PlantScanAppState extends State<PlantScanApp> {
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _showSplash = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Scan - Análisis de Café',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: const Color(0xFF2E7D32),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32),
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2E7D32),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF4CAF50),
        ),
        cardTheme: CardThemeData(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        useMaterial3: true,
      ),
      home: _showSplash ? const SplashScreen() : const HomeScreen(),
      routes: {
        '/camera': (context) => const CameraScreen(),
        '/analysis': (context) => const AnalysisScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
