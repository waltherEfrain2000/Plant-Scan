import 'package:flutter/material.dart';
import '../services/disease_encyclopedia_service.dart';

class DiseaseEncyclopediaScreen extends StatefulWidget {
  const DiseaseEncyclopediaScreen({Key? key}) : super(key: key);

  @override
  State<DiseaseEncyclopediaScreen> createState() =>
      _DiseaseEncyclopediaScreenState();
}

class _DiseaseEncyclopediaScreenState extends State<DiseaseEncyclopediaScreen>
    with SingleTickerProviderStateMixin {
  final PlantDiseaseEncyclopedia _encyclopedia = PlantDiseaseEncyclopedia();
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  List<DiseaseEntry> _filteredDiseases = [];
  String _searchQuery = '';
  DiseaseCategory? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: DiseaseCategory.values.length + 1,
      vsync: this,
    );
    _filteredDiseases = _encyclopedia.getAllDiseases();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _filterDiseases() {
    setState(() {
      if (_searchQuery.isEmpty && _selectedCategory == null) {
        _filteredDiseases = _encyclopedia.getAllDiseases();
      } else if (_selectedCategory != null && _searchQuery.isEmpty) {
        _filteredDiseases = _encyclopedia.getDiseasesByCategory(
          _selectedCategory!,
        );
      } else if (_searchQuery.isNotEmpty && _selectedCategory == null) {
        _filteredDiseases =
            _encyclopedia
                .getAllDiseases()
                .where(
                  (disease) =>
                      disease.commonName.toLowerCase().contains(
                        _searchQuery.toLowerCase(),
                      ) ||
                      disease.scientificName.toLowerCase().contains(
                        _searchQuery.toLowerCase(),
                      ) ||
                      disease.symptoms.any(
                        (symptom) => symptom.toLowerCase().contains(
                          _searchQuery.toLowerCase(),
                        ),
                      ),
                )
                .toList();
      } else {
        var categoryDiseases = _encyclopedia.getDiseasesByCategory(
          _selectedCategory!,
        );
        _filteredDiseases =
            categoryDiseases
                .where(
                  (disease) =>
                      disease.commonName.toLowerCase().contains(
                        _searchQuery.toLowerCase(),
                      ) ||
                      disease.scientificName.toLowerCase().contains(
                        _searchQuery.toLowerCase(),
                      ) ||
                      disease.symptoms.any(
                        (symptom) => symptom.toLowerCase().contains(
                          _searchQuery.toLowerCase(),
                        ),
                      ),
                )
                .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final stats = _encyclopedia.getCategoryStatistics();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Enciclopedia de Enfermedades',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF4CAF50),
        foregroundColor: Colors.white,
        elevation: 2,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.all_inclusive, size: 16),
                  const SizedBox(width: 4),
                  Text('Todas (${_encyclopedia.getTotalDiseases()})'),
                ],
              ),
            ),
            ...DiseaseCategory.values.map(
              (category) => Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(category.icon, style: const TextStyle(fontSize: 16)),
                    const SizedBox(width: 4),
                    Text('${stats[category] ?? 0}'),
                  ],
                ),
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              if (index == 0) {
                _selectedCategory = null;
              } else {
                _selectedCategory = DiseaseCategory.values[index - 1];
              }
              _filterDiseases();
            });
          },
        ),
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildStatistics(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildDiseaseList(_filteredDiseases),
                ...DiseaseCategory.values.map(
                  (category) => _buildDiseaseList(
                    _encyclopedia.getDiseasesByCategory(category),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey[50],
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Buscar enfermedades, síntomas o plantas...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon:
              _searchQuery.isNotEmpty
                  ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        _searchQuery = '';
                        _filterDiseases();
                      });
                    },
                  )
                  : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
            _filterDiseases();
          });
        },
      ),
    );
  }

  Widget _buildStatistics() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Text(
            'Total: ${_encyclopedia.getTotalDiseases()} enfermedades',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          if (_filteredDiseases.length != _encyclopedia.getTotalDiseases())
            Text(
              'Mostrando: ${_filteredDiseases.length}',
              style: const TextStyle(color: Colors.grey),
            ),
        ],
      ),
    );
  }

  Widget _buildDiseaseList(List<DiseaseEntry> diseases) {
    if (diseases.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No se encontraron enfermedades',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: diseases.length,
      itemBuilder: (context, index) {
        final disease = diseases[index];
        return _buildDiseaseCard(disease);
      },
    );
  }

  Widget _buildDiseaseCard(DiseaseEntry disease) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _showDiseaseDetail(disease),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    disease.category.icon,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          disease.commonName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          disease.scientificName,
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildSeverityBadge(disease.severity),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                disease.shortDescription,
                style: const TextStyle(fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 4,
                children:
                    disease.affectedPlants
                        .take(3)
                        .map(
                          (plant) => Chip(
                            label: Text(
                              plant,
                              style: const TextStyle(fontSize: 11),
                            ),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                          ),
                        )
                        .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSeverityBadge(SeverityLevel severity) {
    Color color;
    switch (severity) {
      case SeverityLevel.LOW:
        color = Colors.green;
        break;
      case SeverityLevel.MEDIUM:
        color = Colors.orange;
        break;
      case SeverityLevel.HIGH:
        color = Colors.red;
        break;
      case SeverityLevel.CRITICAL:
        color = Colors.red[900]!;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        severity.displayName,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _showDiseaseDetail(DiseaseEntry disease) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DiseaseDetailScreen(disease: disease),
      ),
    );
  }
}

class DiseaseDetailScreen extends StatelessWidget {
  final DiseaseEntry disease;

  const DiseaseDetailScreen({Key? key, required this.disease})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(disease.commonName),
        backgroundColor: const Color(0xFF4CAF50),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Implementar compartir información
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildDetailSection(
              'Descripción Detallada',
              disease.detailedDescription,
            ),
            _buildListSection('Síntomas', disease.symptoms, Icons.visibility),
            _buildListSection('Causas', disease.causes, Icons.warning),
            _buildListSection(
              'Métodos de Control',
              disease.controlMethods,
              Icons.medical_services,
            ),
            _buildListSection('Prevención', disease.prevention, Icons.shield),
            _buildInfoSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xFF4CAF50), const Color(0xFF45A049)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(disease.category.icon, style: const TextStyle(fontSize: 32)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      disease.commonName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      disease.scientificName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildInfoChip(disease.category.displayName, Colors.white24),
              const SizedBox(width: 8),
              _buildSeverityChip(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(String label, Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  Widget _buildSeverityChip() {
    Color color;
    switch (disease.severity) {
      case SeverityLevel.LOW:
        color = Colors.green;
        break;
      case SeverityLevel.MEDIUM:
        color = Colors.orange;
        break;
      case SeverityLevel.HIGH:
        color = Colors.red;
        break;
      case SeverityLevel.CRITICAL:
        color = Colors.red[900]!;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        'Severidad: ${disease.severity.displayName}',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDetailSection(String title, String content) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4CAF50),
            ),
          ),
          const SizedBox(height: 8),
          Text(content, style: const TextStyle(fontSize: 14, height: 1.5)),
        ],
      ),
    );
  }

  Widget _buildListSection(String title, List<String> items, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF4CAF50), size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4CAF50),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 4, left: 28),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(fontSize: 16, height: 1.5)),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(fontSize: 14, height: 1.5),
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

  Widget _buildInfoSection() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Información Adicional',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 12),
          _buildInfoRow('Plantas Afectadas', disease.affectedPlants.join(', ')),
          _buildInfoRow(
            'Distribución Geográfica',
            disease.geographicalDistribution,
          ),
          _buildInfoRow('Impacto Económico', disease.economicImpact),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          Text(value, style: const TextStyle(fontSize: 13, height: 1.3)),
        ],
      ),
    );
  }
}
