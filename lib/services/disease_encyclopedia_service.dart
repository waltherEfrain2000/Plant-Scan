/// Servicio de Enciclopedia Expandida de Enfermedades de Plantas
class PlantDiseaseEncyclopedia {
  static final PlantDiseaseEncyclopedia _instance =
      PlantDiseaseEncyclopedia._internal();
  factory PlantDiseaseEncyclopedia() => _instance;
  PlantDiseaseEncyclopedia._internal() {
    _initializeEncyclopedia();
  }

  List<DiseaseEntry> _diseases = [];
  Map<DiseaseCategory, List<DiseaseEntry>> _categorizedDiseases = {};

  void _initializeEncyclopedia() {
    _diseases = [
      // ==================== ENFERMEDADES FÚNGICAS ====================
      // Source: Cenicafé (Centro Nacional de Investigaciones de Café), Colombia
      // Sadeghian Khalajabadi, S. (2013). Nutrición de cafetales. In: CENICAFÉ. Manual del cafetero colombiano
      DiseaseEntry(
        id: 'roya_cafe',
        scientificName: 'Hemileia vastatrix',
        commonName: 'Roya del Café',
        category: DiseaseCategory.FUNGAL_DISEASE,
        severity: SeverityLevel.CRITICAL,
        shortDescription:
            'La enfermedad más devastadora del café a nivel mundial',
        detailedDescription: '''
La roya del café es causada por Hemileia vastatrix, un hongo biotrófico obligado que infecta exclusivamente las hojas de café. Es considerada la enfermedad más importante económicamente en la caficultura mundial.

CICLO DE VIDA: Las esporas germinan en presencia de agua libre, penetran por los estomas y se desarrollan en el tejido foliar. El ciclo completo dura 4-7 semanas dependiendo de las condiciones climáticas.

CONDICIONES FAVORABLES: Temperatura 21-25°C, humedad relativa >70%, presencia de rocío por 6+ horas.
        ''',
        symptoms: [
          'Manchas amarillas circulares en el envés de las hojas',
          'Pústulas anaranjadas con masas de esporas',
          'Clorosis progresiva que avanza hacia el centro',
          'Defoliación prematura severa',
          'Debilitamiento general de la planta',
          'Reducción drástica en producción de frutos',
        ],
        causes: [
          'Alta humedad relativa (>70%)',
          'Temperaturas entre 21-25°C',
          'Períodos de humectación foliar prolongados',
          'Viento que dispersa esporas',
          'Variedades susceptibles',
          'Plantaciones muy densas',
        ],
        controlMethods: [
          'Fungicidas preventivos: cobre (oxicloruro, hidróxido)',
          'Fungicidas sistémicos: triazoles (tebuconazole, propiconazole)',
          'Estrobilurinas: azoxystrobin, pyraclostrobin',
          'Control biológico: Lecanicillium lecanii',
          'Manejo cultural: poda, control de sombra',
          'Variedades resistentes: Castillo, Colombia',
        ],
        prevention: [
          'Selección de variedades resistentes',
          'Espaciamiento adecuado entre plantas',
          'Manejo óptimo de sombra (30-40%)',
          'Fertilización balanceada (evitar exceso de N)',
          'Monitoreo climático constante',
          'Eliminación de hojas infectadas',
        ],
        affectedPlants: ['Coffea arabica', 'Coffea canephora'],
        geographicalDistribution: 'Mundial (excepto Hawái)',
        economicImpact: 'Pérdidas de hasta 80% en producción',
        imageUrls: [
          'assets/diseases/roya_cafe_1.jpg',
          'assets/diseases/roya_cafe_2.jpg',
        ],
      ),

      // Additional Coffee Diseases
      // Source: FAO - Food and Agriculture Organization of the United Nations
      // Coffee Diseases and Pests Management Guide
      DiseaseEntry(
        id: 'antracnosis_cafe',
        scientificName: 'Colletotrichum kahawae',
        commonName: 'Antracnosis del Café (CBD)',
        category: DiseaseCategory.FUNGAL_DISEASE,
        severity: SeverityLevel.HIGH,
        shortDescription:
            'Enfermedad fúngica que afecta frutos y hojas del café',
        detailedDescription: '''
La antracnosis del café es causada por Colletotrichum kahawae, específicamente adaptada al café. Es una enfermedad cuarentenaria importante en algunos países.

SÍNTOMAS CARACTERÍSTICOS: Lesiones necróticas en frutos verdes que se vuelven marrones y momificados.
        ''',
        symptoms: [
          'Manchas marrones irregulares en frutos verdes',
          'Frutos momificados que permanecen en la planta',
          'Lesiones en hojas jóvenes con halos amarillos',
          'Caída prematura de frutos afectados',
          'Puntos negros (acérvulos) en lesiones',
          'Reducción en calidad y cantidad de cosecha',
        ],
        causes: [
          'Humedad relativa alta (>80%)',
          'Temperaturas entre 20-25°C',
          'Lluvias frecuentes durante floración',
          'Variedades susceptibles',
          'Mala ventilación en plantaciones',
          'Frutos residuales infectados',
        ],
        controlMethods: [
          'Fungicidas cúpricos preventivos',
          'Triazoles sistémicos',
          'Eliminación de frutos momificados',
          'Poda sanitaria',
          'Variedades resistentes',
          'Manejo integrado de enfermedades',
        ],
        prevention: [
          'Uso de variedades resistentes',
          'Recolección sanitaria completa',
          'Mejora de ventilación',
          'Monitoreo regular',
          'Rotación de fungicidas',
          'Manejo de humedad',
        ],
        affectedPlants: ['Coffea arabica'],
        geographicalDistribution: 'África, Asia, América Latina',
        economicImpact: 'Pérdidas 30-70% en producción',
        imageUrls: [
          'assets/diseases/antracnosis_cafe_1.jpg',
          'assets/diseases/antracnosis_cafe_2.jpg',
        ],
      ),

      // Source: USDA - United States Department of Agriculture
      // Corn Disease Management Guide
      DiseaseEntry(
        id: 'roya_maiz',
        scientificName: 'Puccinia sorghi',
        commonName: 'Roya del Maíz',
        category: DiseaseCategory.FUNGAL_DISEASE,
        severity: SeverityLevel.MEDIUM,
        shortDescription: 'Enfermedad fúngica común del maíz que afecta hojas',
        detailedDescription: '''
La roya del maíz es causada por Puccinia sorghi. Produce pústulas anaranjadas en ambas caras de las hojas, reduciendo la fotosíntesis y el rendimiento.
        ''',
        symptoms: [
          'Pústulas anaranjadas en hojas',
          'Manchas cloróticas alrededor de pústulas',
          'Defoliación prematura',
          'Reducción en tamaño de mazorcas',
          'Pérdida de vigor en plantas',
          'Disminución en rendimiento',
        ],
        causes: [
          'Humedad relativa alta',
          'Temperaturas entre 15-25°C',
          'Lluvias frecuentes',
          'Variedades susceptibles',
          'Densidad de siembra alta',
          'Falta de rotación de cultivos',
        ],
        controlMethods: [
          'Fungicidas triazoles',
          'Estrobilurinas',
          'Variedades resistentes',
          'Rotación de cultivos',
          'Manejo de residuos',
          'Fertilización balanceada',
        ],
        prevention: [
          'Uso de híbridos resistentes',
          'Rotación con cultivos no hospederos',
          'Manejo adecuado de residuos',
          'Monitoreo temprano',
          'Aplicación preventiva de fungicidas',
          'Densidad de siembra óptima',
        ],
        affectedPlants: ['Zea mays (Maíz)'],
        geographicalDistribution: 'Mundial, zonas templadas y tropicales',
        economicImpact: 'Pérdidas 10-30% en rendimiento',
        imageUrls: [
          'assets/diseases/roya_maiz_1.jpg',
          'assets/diseases/roya_maiz_2.jpg',
        ],
      ),

      // Source: CIAT - Centro Internacional de Agricultura Tropical
      // Bean Disease Management
      DiseaseEntry(
        id: 'antracnosis_frijol',
        scientificName: 'Colletotrichum lindemuthianum',
        commonName: 'Antracnosis del Frijol',
        category: DiseaseCategory.FUNGAL_DISEASE,
        severity: SeverityLevel.HIGH,
        shortDescription: 'Enfermedad fúngica devastadora del frijol común',
        detailedDescription: '''
La antracnosis del frijol es causada por Colletotrichum lindemuthianum. Es una de las enfermedades más destructivas del frijol, causando pérdidas significativas en producción.
        ''',
        symptoms: [
          'Manchas irregulares en hojas',
          'Lesiones en tallos y vainas',
          'Hundimiento de lesiones en semillas',
          'Caída prematura de hojas',
          'Muerte de plantas jóvenes',
          'Reducción en germinación de semillas',
        ],
        causes: [
          'Humedad alta (>80%)',
          'Temperaturas entre 15-25°C',
          'Lluvias frecuentes',
          'Variedades susceptibles',
          'Semillas infectadas',
          'Mala rotación de cultivos',
        ],
        controlMethods: [
          'Semillas certificadas libres de patógeno',
          'Fungicidas protectantes',
          'Variedades resistentes',
          'Rotación de cultivos',
          'Manejo de residuos',
          'Aplicación de fungicidas en semilla',
        ],
        prevention: [
          'Uso de semillas certificadas',
          'Variedades resistentes',
          'Rotación de 2-3 años',
          'Manejo de residuos culturales',
          'Monitoreo regular',
          'Fertilización balanceada',
        ],
        affectedPlants: ['Phaseolus vulgaris (Frijol común)'],
        geographicalDistribution: 'Mundial, especialmente en zonas tropicales',
        economicImpact: 'Pérdidas 30-90% en producción',
        imageUrls: [
          'assets/diseases/antracnosis_frijol_1.jpg',
          'assets/diseases/antracnosis_frijol_2.jpg',
        ],
      ),

      // Source: University of California Extension
      // Tomato Disease Management
      DiseaseEntry(
        id: 'tizon_follaje_tomate',
        scientificName: 'Alternaria solani',
        commonName: 'Tizón Follaje del Tomate',
        category: DiseaseCategory.FUNGAL_DISEASE,
        severity: SeverityLevel.MEDIUM,
        shortDescription:
            'Enfermedad fúngica común que causa manchas en hojas de tomate',
        detailedDescription: '''
El tizón follaje del tomate es causado por Alternaria solani. Produce manchas características en hojas que pueden causar defoliación severa.
        ''',
        symptoms: [
          'Manchas circulares con centros oscuros',
          'Halos amarillos alrededor de manchas',
          'Lesiones en tallos y frutos',
          'Defoliación progresiva',
          'Reducción en fotosíntesis',
          'Frutos con manchas necróticas',
        ],
        causes: [
          'Humedad foliar prolongada',
          'Temperaturas entre 20-25°C',
          'Lluvias frecuentes',
          'Riego por aspersión',
          'Variedades susceptibles',
          'Densidad de siembra alta',
        ],
        controlMethods: [
          'Fungicidas protectantes (clorotalonil)',
          'Fungicidas sistémicos (azoxystrobin)',
          'Mejora de ventilación',
          'Riego dirigido al suelo',
          'Eliminación de plantas infectadas',
          'Variedades resistentes',
        ],
        prevention: [
          'Uso de variedades resistentes',
          'Rotación de cultivos',
          'Manejo de residuos',
          'Riego por goteo',
          'Espaciamiento adecuado',
          'Monitoreo regular',
        ],
        affectedPlants: ['Solanum lycopersicum (Tomate)'],
        geographicalDistribution: 'Mundial',
        economicImpact: 'Pérdidas 20-50% en producción',
        imageUrls: [
          'assets/diseases/tizon_tomate_1.jpg',
          'assets/diseases/tizon_tomate_2.jpg',
        ],
      ),

      // Source: Cornell University Extension
      // Cucumber Disease Management
      DiseaseEntry(
        id: 'oidio_pepino',
        scientificName: 'Podosphaera xanthii',
        commonName: 'Oídio del Pepino',
        category: DiseaseCategory.FUNGAL_DISEASE,
        severity: SeverityLevel.MEDIUM,
        shortDescription:
            'Enfermedad fúngica que forma polvo blanco en pepinos',
        detailedDescription: '''
El oídio del pepino es causado por Podosphaera xanthii. Produce un polvo blanco característico en hojas y tallos, reduciendo la fotosíntesis.
        ''',
        symptoms: [
          'Polvo blanco en hojas superiores',
          'Amarillamiento de hojas afectadas',
          'Deformación de hojas jóvenes',
          'Reducción en crecimiento',
          'Frutos pequeños y deformes',
          'Caída prematura de hojas',
        ],
        causes: [
          'Humedad relativa baja',
          'Temperaturas entre 20-30°C',
          'Estrés hídrico',
          'Variedades susceptibles',
          'Densidad de siembra alta',
          'Falta de ventilación',
        ],
        controlMethods: [
          'Azufre elemental',
          'Fungicidas sistémicos',
          'Aceites hortícolas',
          'Mejora de ventilación',
          'Riego adecuado',
          'Eliminación de hojas infectadas',
        ],
        prevention: [
          'Variedades resistentes',
          'Rotación de cultivos',
          'Manejo de humedad',
          'Fertilización balanceada',
          'Monitoreo regular',
          'Control preventivo',
        ],
        affectedPlants: ['Cucumis sativus (Pepino)'],
        geographicalDistribution: 'Mundial',
        economicImpact: 'Pérdidas 15-40% en rendimiento',
        imageUrls: [
          'assets/diseases/oidio_pepino_1.jpg',
          'assets/diseases/oidio_pepino_2.jpg',
        ],
      ),

      // Source: University of Minnesota Extension
      // Beet Disease Management
      DiseaseEntry(
        id: 'roya_remolacha',
        scientificName: 'Uromyces betae',
        commonName: 'Roya de la Remolacha',
        category: DiseaseCategory.FUNGAL_DISEASE,
        severity: SeverityLevel.HIGH,
        shortDescription:
            'Enfermedad fúngica que afecta severamente la remolacha',
        detailedDescription: '''
La roya de la remolacha es causada por Uromyces betae. Produce pústulas características que pueden causar pérdidas significativas en producción.
        ''',
        symptoms: [
          'Pústulas anaranjadas en hojas',
          'Manchas cloróticas alrededor',
          'Defoliación severa',
          'Reducción en crecimiento de raíces',
          'Pérdida de calidad de raíces',
          'Disminución en rendimiento',
        ],
        causes: [
          'Humedad foliar alta',
          'Temperaturas entre 15-25°C',
          'Lluvias frecuentes',
          'Variedades susceptibles',
          'Densidad de siembra alta',
          'Falta de rotación',
        ],
        controlMethods: [
          'Fungicidas triazoles',
          'Estrobilurinas',
          'Variedades resistentes',
          'Rotación de cultivos',
          'Manejo de residuos',
          'Aplicación preventiva',
        ],
        prevention: [
          'Uso de variedades resistentes',
          'Rotación con cereales',
          'Manejo de residuos',
          'Monitoreo temprano',
          'Fertilización balanceada',
          'Densidad óptima de siembra',
        ],
        affectedPlants: ['Beta vulgaris (Remolacha)'],
        geographicalDistribution: 'Zonas templadas del mundo',
        economicImpact: 'Pérdidas 20-60% en rendimiento',
        imageUrls: [
          'assets/diseases/roya_remolacha_1.jpg',
          'assets/diseases/roya_remolacha_2.jpg',
        ],
      ),

      // Source: University of California Extension
      // Lettuce Disease Management
      DiseaseEntry(
        id: 'mildiu_lechuga',
        scientificName: 'Bremia lactucae',
        commonName: 'Mildiu de la Lechuga',
        category: DiseaseCategory.FUNGAL_DISEASE,
        severity: SeverityLevel.HIGH,
        shortDescription: 'Enfermedad fúngica devastadora de la lechuga',
        detailedDescription: '''
El mildiu de la lechuga es causado por Bremia lactucae. Es una de las enfermedades más importantes de la lechuga, causando pérdidas significativas.
        ''',
        symptoms: [
          'Manchas angulares amarillas en hojas',
          'Moho gris-púrpura en el envés',
          'Defoliación progresiva',
          'Deformación de plantas',
          'Reducción en calidad',
          'Pérdida total de cosecha',
        ],
        causes: [
          'Humedad relativa alta (>90%)',
          'Temperaturas entre 10-20°C',
          'Lluvias frecuentes',
          'Rocío matutino prolongado',
          'Variedades susceptibles',
          'Densidad de siembra alta',
        ],
        controlMethods: [
          'Fungicidas sistémicos',
          'Mejora de ventilación',
          'Riego dirigido',
          'Eliminación de plantas infectadas',
          'Variedades resistentes',
          'Manejo de residuos',
        ],
        prevention: [
          'Uso de variedades resistentes',
          'Rotación de cultivos',
          'Manejo de humedad',
          'Fertilización balanceada',
          'Monitoreo regular',
          'Desinfección de suelo',
        ],
        affectedPlants: ['Lactuca sativa (Lechuga)'],
        geographicalDistribution: 'Mundial, zonas templadas',
        economicImpact: 'Pérdidas 50-100% en cosechas susceptibles',
        imageUrls: [
          'assets/diseases/mildiu_lechuga_1.jpg',
          'assets/diseases/mildiu_lechuga_2.jpg',
        ],
      ),

      // Source: University of Idaho Extension
      // Potato Disease Management
      DiseaseEntry(
        id: 'tizon_temprano_papa',
        scientificName: 'Alternaria solani',
        commonName: 'Tizón Temprano de la Papa',
        category: DiseaseCategory.FUNGAL_DISEASE,
        severity: SeverityLevel.MEDIUM,
        shortDescription:
            'Enfermedad fúngica común de la papa que afecta follaje',
        detailedDescription: '''
El tizón temprano de la papa es causado por Alternaria solani. Produce manchas características en hojas que pueden causar defoliación.
        ''',
        symptoms: [
          'Manchas circulares con centros oscuros',
          'Halos amarillos alrededor',
          'Lesiones en tallos',
          'Defoliación de hojas inferiores',
          'Manchas en tubérculos',
          'Reducción en rendimiento',
        ],
        causes: [
          'Humedad foliar alta',
          'Temperaturas entre 20-25°C',
          'Lluvias frecuentes',
          'Riego por aspersión',
          'Variedades susceptibles',
          'Densidad de siembra alta',
        ],
        controlMethods: [
          'Fungicidas protectantes',
          'Fungicidas sistémicos',
          'Mejora de ventilación',
          'Riego dirigido al suelo',
          'Eliminación de plantas infectadas',
          'Variedades resistentes',
        ],
        prevention: [
          'Uso de variedades resistentes',
          'Rotación de cultivos',
          'Manejo de residuos',
          'Riego por goteo',
          'Espaciamiento adecuado',
          'Monitoreo regular',
        ],
        affectedPlants: ['Solanum tuberosum (Papa)'],
        geographicalDistribution: 'Mundial',
        economicImpact: 'Pérdidas 15-40% en rendimiento',
        imageUrls: [
          'assets/diseases/tizon_papa_1.jpg',
          'assets/diseases/tizon_papa_2.jpg',
        ],
      ),

      DiseaseEntry(
        id: 'antracnosis',
        scientificName: 'Colletotrichum spp.',
        commonName: 'Antracnosis',
        category: DiseaseCategory.FUNGAL_DISEASE,
        severity: SeverityLevel.HIGH,
        shortDescription: 'Enfermedad fúngica que afecta frutos, hojas y ramas',
        detailedDescription: '''
La antracnosis es causada por diversas especies de Colletotrichum. Afecta principalmente los frutos en desarrollo, pero también puede atacar hojas jóvenes y ramas tiernas.

ESPECIES PRINCIPALES: C. gloeosporioides, C. acutatum, C. kahawae (específica de café)

IMPACTO: Causa pudrición de frutos, manchas foliares y muerte regresiva de ramas.
        ''',
        symptoms: [
          'Manchas circulares marrones en frutos',
          'Hundimiento de lesiones en frutos maduros',
          'Manchas necróticas con bordes definidos en hojas',
          'Muerte regresiva de puntas de ramas',
          'Exudación de masa rosada de esporas',
          'Caída prematura de frutos',
        ],
        causes: [
          'Alta humedad (>80%)',
          'Lluvias frecuentes',
          'Temperaturas cálidas (25-30°C)',
          'Heridas en frutos o tejidos',
          'Exceso de nitrógeno',
          'Mala ventilación del cultivo',
        ],
        controlMethods: [
          'Fungicidas preventivos: mancozeb, clorotalonil',
          'Fungicidas sistémicos: azoxystrobin, difenoconazole',
          'Tratamiento de semillas antes de siembra',
          'Eliminación de frutos momificados',
          'Poda sanitaria regular',
          'Control biológico: Trichoderma spp.',
        ],
        prevention: [
          'Evitar heridas durante manejo',
          'Mejorar ventilación del cultivo',
          'Recolección oportuna de frutos',
          'Fertilización balanceada',
          'Drenaje adecuado del suelo',
          'Rotación de fungicidas',
        ],
        affectedPlants: [
          'Café',
          'Tomate',
          'Pimiento',
          'Fresa',
          'Mango',
          'Aguacate',
        ],
        geographicalDistribution: 'Mundial, zonas tropicales y subtropicales',
        economicImpact: 'Pérdidas 20-50% en frutos',
        imageUrls: [
          'assets/diseases/antracnosis_1.jpg',
          'assets/diseases/antracnosis_2.jpg',
        ],
      ),

      DiseaseEntry(
        id: 'mildiu_polvoso',
        scientificName: 'Oidium spp.',
        commonName: 'Mildiu Polvoroso (Oídio)',
        category: DiseaseCategory.FUNGAL_DISEASE,
        severity: SeverityLevel.MEDIUM,
        shortDescription: 'Hongo que forma polvo blanco en hojas y tallos',
        detailedDescription: '''
El mildiu polvoroso es causado por hongos del género Oidium. Se caracteriza por la formación de un polvo blanco-grisáceo en la superficie de hojas, tallos y frutos.

CONDICIONES: Se desarrolla mejor en condiciones de humedad moderada y temperaturas templadas.
        ''',
        symptoms: [
          'Polvo blanco-grisáceo en hojas',
          'Manchas amarillas que se vuelven marrones',
          'Deformación de hojas jóvenes',
          'Reducción en fotosíntesis',
          'Caída prematura de hojas',
          'Retraso en crecimiento',
        ],
        causes: [
          'Humedad moderada (40-70%)',
          'Temperaturas templadas (20-25°C)',
          'Poca ventilación',
          'Exceso de fertilización nitrogenada',
          'Plantas estresadas',
          'Hacinamiento',
        ],
        controlMethods: [
          'Azufre elemental (preventivo)',
          'Fungicidas sistémicos: triadimenol, myclobutanil',
          'Bicarbonato de potasio (orgánico)',
          'Aceites minerales ligeros',
          'Mejora de ventilación',
          'Control biológico: Ampelomyces quisqualis',
        ],
        prevention: [
          'Espaciamiento adecuado entre plantas',
          'Poda para mejorar ventilación',
          'Riego dirigido al suelo',
          'Evitar exceso de nitrógeno',
          'Variedades resistentes',
          'Eliminación de material infectado',
        ],
        affectedPlants: [
          'Rosas',
          'Tomate',
          'Pepino',
          'Calabaza',
          'Vid',
          'Frutales',
        ],
        geographicalDistribution: 'Mundial',
        economicImpact: 'Pérdidas 10-30% en calidad',
        imageUrls: [
          'assets/diseases/oidio_1.jpg',
          'assets/diseases/oidio_2.jpg',
        ],
      ),

      DiseaseEntry(
        id: 'fusarium',
        scientificName: 'Fusarium oxysporum',
        commonName: 'Marchitez por Fusarium',
        category: DiseaseCategory.FUNGAL_DISEASE,
        severity: SeverityLevel.CRITICAL,
        shortDescription: 'Hongo del suelo que causa marchitez vascular',
        detailedDescription: '''
Fusarium oxysporum es un hongo del suelo que infecta las raíces y sistema vascular, causando marchitez y muerte de la planta.

ESPECIFICIDAD: Existen razas específicas para diferentes hospederos (f.sp. lycopersici para tomate, f.sp. cubense para banano).
        ''',
        symptoms: [
          'Marchitez progresiva de hojas inferiores',
          'Amarillamiento unilateral de foliolos',
          'Oscurecimiento vascular en tallos',
          'Enanismo y crecimiento raquítico',
          'Muerte descendente',
          'Raíces oscuras y podridas',
        ],
        causes: [
          'Suelos contaminados',
          'pH ácido (5.5-6.5)',
          'Temperaturas altas (25-32°C)',
          'Estrés hídrico',
          'Heridas en raíces',
          'Nematodos que facilitan entrada',
        ],
        controlMethods: [
          'Solarización del suelo',
          'Fungicidas sistémicos: benomyl, carbendazim',
          'Injertos en portainjertos resistentes',
          'Biocontrol: Trichoderma harzianum',
          'Ácidos húmicos y fúlvicos',
          'Rotación de cultivos',
        ],
        prevention: [
          'Uso de variedades resistentes',
          'Desinfección de suelos',
          'Control de nematodos',
          'Manejo del pH del suelo',
          'Evitar heridas en raíces',
          'Semillas certificadas',
        ],
        affectedPlants: [
          'Tomate',
          'Banano',
          'Algodón',
          'Melón',
          'Sandía',
          'Clavel',
        ],
        geographicalDistribution: 'Mundial',
        economicImpact: 'Pérdidas 50-100% en cultivos susceptibles',
        imageUrls: [
          'assets/diseases/fusarium_1.jpg',
          'assets/diseases/fusarium_2.jpg',
        ],
      ),

      // ==================== ENFERMEDADES BACTERIANAS ====================
      DiseaseEntry(
        id: 'mancha_angular',
        scientificName: 'Pseudomonas syringae',
        commonName: 'Mancha Angular Bacteriana',
        category: DiseaseCategory.BACTERIAL_DISEASE,
        severity: SeverityLevel.MEDIUM,
        shortDescription: 'Bacteria que causa manchas angulares en hojas',
        detailedDescription: '''
Pseudomonas syringae es una bacteria gram-negativa que causa manchas angulares limitadas por las venas de las hojas.

TRANSMISIÓN: Se disemina por agua de lluvia, riego por aspersión y herramientas contaminadas.
        ''',
        symptoms: [
          'Manchas angulares limitadas por venas',
          'Halos amarillos alrededor de manchas',
          'Exudado bacteriano amarillento',
          'Perforaciones en hojas al secarse',
          'Marchitez de hojas severamente afectadas',
          'Lesiones en frutos jóvenes',
        ],
        causes: [
          'Alta humedad relativa',
          'Temperaturas frescas (18-24°C)',
          'Lluvia o riego por aspersión',
          'Heridas por insectos o granizo',
          'Plantas estresadas',
          'Herramientas contaminadas',
        ],
        controlMethods: [
          'Bactericidas cúpricos: sulfato de cobre, oxicloruro',
          'Antibióticos: estreptomicina (donde esté permitido)',
          'Agentes de biocontrol: Bacillus subtilis',
          'Eliminación de material infectado',
          'Mejora de ventilación',
          'Desinfección de herramientas',
        ],
        prevention: [
          'Evitar riego por aspersión',
          'Usar semillas certificadas',
          'Rotación de cultivos',
          'Desinfección de herramientas',
          'Control de insectos vectores',
          'Variedades resistentes',
        ],
        affectedPlants: ['Frijol', 'Pepino', 'Calabaza', 'Tomate', 'Algodón'],
        geographicalDistribution: 'Mundial',
        economicImpact: 'Pérdidas 15-40% en condiciones favorables',
        imageUrls: [
          'assets/diseases/mancha_angular_1.jpg',
          'assets/diseases/mancha_angular_2.jpg',
        ],
      ),

      DiseaseEntry(
        id: 'fuego_bacteriano',
        scientificName: 'Erwinia amylovora',
        commonName: 'Fuego Bacteriano',
        category: DiseaseCategory.BACTERIAL_DISEASE,
        severity: SeverityLevel.CRITICAL,
        shortDescription: 'Bacteria que causa muerte súbita de ramas y flores',
        detailedDescription: '''
Erwinia amylovora es una bacteria que causa el fuego bacteriano, una de las enfermedades más destructivas en frutales de la familia Rosaceae.

SÍNTOMA CARACTERÍSTICO: Las ramas afectadas se ven como si hubieran sido quemadas por fuego.
        ''',
        symptoms: [
          'Muerte súbita de flores y brotes',
          'Ennegrecimiento de hojas que permanecen adheridas',
          'Curvatura de ramas afectadas en forma de gancho',
          'Exudado bacteriano lechoso',
          'Cancros en tronco y ramas principales',
          'Marchitez progresiva',
        ],
        causes: [
          'Temperaturas cálidas (24-29°C)',
          'Humedad alta durante floración',
          'Lluvia o rocío abundante',
          'Heridas por insectos, granizo o poda',
          'Variedades susceptibles',
          'Fertilización excesiva con nitrógeno',
        ],
        controlMethods: [
          'Poda sanitaria drástica (30 cm debajo de síntomas)',
          'Bactericidas cúpricos en prefloración',
          'Antibióticos: estreptomicina, oxitetraciclina',
          'Biocontrol: Pantoea agglomerans',
          'Desinfección de herramientas',
          'Eliminación total de plantas severamente afectadas',
        ],
        prevention: [
          'Variedades resistentes o tolerantes',
          'Evitar fertilización excesiva',
          'Poda en época seca',
          'Control de insectos vectores',
          'Cuarentena en zonas libres',
          'Inspección regular durante floración',
        ],
        affectedPlants: ['Manzano', 'Peral', 'Membrillo', 'Níspero', 'Espino'],
        geographicalDistribution:
            'América del Norte, Europa, algunas partes de Asia',
        economicImpact: 'Pérdidas totales en huertos susceptibles',
        imageUrls: [
          'assets/diseases/fuego_bacteriano_1.jpg',
          'assets/diseases/fuego_bacteriano_2.jpg',
        ],
      ),

      // ==================== ENFERMEDADES VIRALES ====================
      DiseaseEntry(
        id: 'mosaico_tabaco',
        scientificName: 'Tobacco mosaic virus (TMV)',
        commonName: 'Virus del Mosaico del Tabaco',
        category: DiseaseCategory.VIRAL_DISEASE,
        severity: SeverityLevel.HIGH,
        shortDescription: 'Virus que causa mosaicos y deformaciones en hojas',
        detailedDescription: '''
El virus del mosaico del tabaco (TMV) es uno de los virus de plantas más estudiados. Causa patrones de mosaico característicos en las hojas.

ESTABILIDAD: Extremadamente estable, puede sobrevivir en restos vegetales por años.
        ''',
        symptoms: [
          'Patrón de mosaico verde claro y oscuro',
          'Deformación y rizado de hojas',
          'Enanismo de la planta',
          'Reducción en producción',
          'Manchas necróticas en variedades sensibles',
          'Frutos pequeños y deformes',
        ],
        causes: [
          'Transmisión mecánica por contacto',
          'Herramientas contaminadas',
          'Manos y ropa de trabajadores',
          'Injertos con material infectado',
          'No se transmite por insectos',
          'Semillas infectadas (raro)',
        ],
        controlMethods: [
          'No existe control curativo',
          'Eliminación inmediata de plantas infectadas',
          'Desinfección rigurosa de herramientas',
          'Uso de variedades resistentes',
          'Control de malezas hospederas',
          'Cuarentena estricta',
        ],
        prevention: [
          'Semillas y plántulas certificadas',
          'Desinfección de manos y herramientas',
          'Evitar fumar cerca de cultivos',
          'Variedades resistentes (gen N)',
          'Eliminación de restos de cosecha',
          'Control de malezas Solanáceas',
        ],
        affectedPlants: [
          'Tabaco',
          'Tomate',
          'Pimiento',
          'Berenjena',
          'Petunia',
        ],
        geographicalDistribution: 'Mundial',
        economicImpact: 'Pérdidas 20-90% según variedad',
        imageUrls: ['assets/diseases/tmv_1.jpg', 'assets/diseases/tmv_2.jpg'],
      ),

      DiseaseEntry(
        id: 'enrollamiento_hojas',
        scientificName: 'Tomato yellow leaf curl virus (TYLCV)',
        commonName: 'Enrollamiento Amarillo de Hojas',
        category: DiseaseCategory.VIRAL_DISEASE,
        severity: SeverityLevel.CRITICAL,
        shortDescription:
            'Virus transmitido por mosca blanca que causa enrollamiento',
        detailedDescription: '''
El TYLCV es un begomovirus transmitido por la mosca blanca Bemisia tabaci. Causa severos daños en solanáceas.

VECTOR: Bemisia tabaci, especialmente el biotipo B (B. argentifolii).
        ''',
        symptoms: [
          'Enrollamiento hacia arriba de foliolos',
          'Amarillamiento de hojas jóvenes',
          'Enanismo severo de plantas',
          'Reducción drástica en floración',
          'Frutos pequeños y deformes',
          'Muerte de plantas jóvenes',
        ],
        causes: [
          'Transmisión por Bemisia tabaci',
          'Poblaciones altas de mosca blanca',
          'Temperaturas cálidas favorecen al vector',
          'Presencia de malezas hospederas',
          'Material de propagación infectado',
          'Migración de moscas blancas',
        ],
        controlMethods: [
          'Control del vector (mosca blanca)',
          'Insecticidas sistémicos: imidacloprid, thiamethoxam',
          'Aceites minerales y jabones',
          'Eliminación de plantas infectadas',
          'Mallas antiinsecto en semilleros',
          'Variedades resistentes',
        ],
        prevention: [
          'Variedades resistentes o tolerantes',
          'Control preventivo de mosca blanca',
          'Eliminación de malezas hospederas',
          'Barreras físicas (mallas)',
          'Plántulas certificadas libres de virus',
          'Fechas de siembra escalonadas',
        ],
        affectedPlants: ['Tomate', 'Pimiento', 'Berenjena', 'Tabaco', 'Frijol'],
        geographicalDistribution: 'Mediterráneo, Medio Oriente, América',
        economicImpact: 'Pérdidas 70-100% en variedades susceptibles',
        imageUrls: [
          'assets/diseases/tylcv_1.jpg',
          'assets/diseases/tylcv_2.jpg',
        ],
      ),

      // ==================== PLAGAS PRINCIPALES ====================
      DiseaseEntry(
        id: 'broca_cafe',
        scientificName: 'Hypothenemus hampei',
        commonName: 'Broca del Café',
        category: DiseaseCategory.INSECT_PEST,
        severity: SeverityLevel.CRITICAL,
        shortDescription: 'La plaga más importante del café a nivel mundial',
        detailedDescription: '''
La broca del café es un pequeño escarabajo (2mm) que perfora los frutos del café para alimentarse y reproducirse dentro del grano.

CICLO DE VIDA: Huevo (5-7 días), larva (15-20 días), pupa (3-5 días), adulto (35-50 días).

COMPORTAMIENTO: Solo las hembras vuelan y atacan los frutos.
        ''',
        symptoms: [
          'Perforaciones pequeñas (1mm) en frutos',
          'Polvo café en la perforación',
          'Frutos prematuramente maduros',
          'Granos perforados y dañados',
          'Caída prematura de frutos',
          'Reducción en calidad del café',
        ],
        causes: [
          'Frutos en estado de llenado (>20% materia seca)',
          'Temperaturas cálidas (22-28°C)',
          'Altitudes bajas a medias (<1400m)',
          'Frutos residuales de cosecha anterior',
          'Falta de control oportuno',
          'Variedades susceptibles',
        ],
        controlMethods: [
          'Recolección oportuna y completa',
          'Insecticidas específicos: clorpirifos, endosulfan',
          'Control biológico: Beauveria bassiana',
          'Trampas con alcohol y metanol',
          'Parasitoides: Cephalonomia stephanoderis',
          'Depulpado de frutos brocados',
        ],
        prevention: [
          'Recolección sanitaria (re-re)',
          'Eliminación de frutos residuales',
          'Monitoreo constante desde llenado',
          'Manejo integrado de plagas',
          'Variedades con frutos duros',
          'Control de malezas',
        ],
        affectedPlants: ['Coffea arabica', 'Coffea canephora'],
        geographicalDistribution: 'Zonas cafetaleras mundiales',
        economicImpact: 'Pérdidas 5-50% en producción y calidad',
        imageUrls: [
          'assets/diseases/broca_cafe_1.jpg',
          'assets/diseases/broca_cafe_2.jpg',
        ],
      ),

      DiseaseEntry(
        id: 'minador_hojas',
        scientificName: 'Liriomyza spp.',
        commonName: 'Minador de Hojas',
        category: DiseaseCategory.INSECT_PEST,
        severity: SeverityLevel.MEDIUM,
        shortDescription: 'Larvas que crean túneles característicos en hojas',
        detailedDescription: '''
Los minadores de hojas son pequeñas moscas cuyas larvas se alimentan entre las capas de las hojas, creando túneles o "minas" características.

ESPECIES PRINCIPALES: L. trifolii, L. huidobrensis, L. sativae.
        ''',
        symptoms: [
          'Túneles serpenteantes en hojas',
          'Puntos de alimentación de adultos',
          'Amarillamiento de hojas afectadas',
          'Reducción en fotosíntesis',
          'Caída prematura de hojas',
          'Retraso en crecimiento',
        ],
        causes: [
          'Temperaturas cálidas (20-30°C)',
          'Baja humedad relativa',
          'Exceso de fertilización nitrogenada',
          'Ausencia de enemigos naturales',
          'Cultivos bajo protección',
          'Monocultivos extensos',
        ],
        controlMethods: [
          'Insecticidas sistémicos: abamectina, cyromazine',
          'Control biológico: Diglyphus isaea',
          'Parasitoides: Opius spp.',
          'Trampas cromáticas amarillas',
          'Eliminación de hojas afectadas',
          'Rotación de ingredientes activos',
        ],
        prevention: [
          'Monitoreo con trampas amarillas',
          'Control preventivo de adultos',
          'Eliminación de malezas hospederas',
          'Mallas antiinsecto',
          'Fertilización balanceada',
          'Conservación de enemigos naturales',
        ],
        affectedPlants: ['Tomate', 'Lechuga', 'Apio', 'Crisantemo', 'Gerbera'],
        geographicalDistribution: 'Mundial',
        economicImpact: 'Pérdidas 10-30% en hortalizas de hoja',
        imageUrls: [
          'assets/diseases/minador_1.jpg',
          'assets/diseases/minador_2.jpg',
        ],
      ),

      DiseaseEntry(
        id: 'cochinilla_harinosa',
        scientificName: 'Planococcus citri',
        commonName: 'Cochinilla Harinosa',
        category: DiseaseCategory.INSECT_PEST,
        severity: SeverityLevel.MEDIUM,
        shortDescription: 'Insecto escama que succiona savia y excreta melaza',
        detailedDescription: '''
La cochinilla harinosa es un insecto hemíptero que se alimenta de la savia de las plantas y excreta melaza, favoreciendo el desarrollo de fumagina.

CARACTERÍSTICAS: Cuerpo blando cubierto de secreciones cerosas blancas.
        ''',
        symptoms: [
          'Insectos blancos algodonosos',
          'Amarillamiento de hojas',
          'Melaza pegajosa en hojas y frutos',
          'Fumagina (hollín) negro',
          'Deformación de brotes jóvenes',
          'Debilitamiento general',
        ],
        causes: [
          'Condiciones cálidas y húmedas',
          'Exceso de fertilización nitrogenada',
          'Plantas estresadas',
          'Falta de enemigos naturales',
          'Hormigas que las protegen',
          'Material de propagación infectado',
        ],
        controlMethods: [
          'Insecticidas sistémicos: imidacloprid, acetamiprid',
          'Aceites minerales o vegetales',
          'Jabón potásico',
          'Control biológico: Cryptolaemus montrouzieri',
          'Parasitoides: Anagyrus pseudococci',
          'Lavado con agua a presión',
        ],
        prevention: [
          'Inspección regular de plantas nuevas',
          'Control de hormigas',
          'Fertilización balanceada',
          'Aislamiento de plantas infectadas',
          'Conservación de enemigos naturales',
          'Poda de partes muy afectadas',
        ],
        affectedPlants: [
          'Cítricos',
          'Vid',
          'Café',
          'Ornamentales',
          'Cactáceas',
        ],
        geographicalDistribution: 'Mundial, zonas tropicales y subtropicales',
        economicImpact: 'Pérdidas 15-40% por daño directo e indirecto',
        imageUrls: [
          'assets/diseases/cochinilla_1.jpg',
          'assets/diseases/cochinilla_2.jpg',
        ],
      ),

      // ==================== DEFICIENCIAS NUTRICIONALES ====================
      DiseaseEntry(
        id: 'deficiencia_nitrogeno',
        scientificName: 'Nitrogen deficiency',
        commonName: 'Deficiencia de Nitrógeno',
        category: DiseaseCategory.NUTRITIONAL_DEFICIENCY,
        severity: SeverityLevel.MEDIUM,
        shortDescription: 'Falta del nutriente más importante para crecimiento',
        detailedDescription: '''
El nitrógeno es esencial para la síntesis de proteínas, clorofila y ácidos nucleicos. Su deficiencia es la más común en cultivos.

MOVILIDAD: Nutriente móvil, los síntomas aparecen primero en hojas viejas.
        ''',
        symptoms: [
          'Amarillamiento uniforme de hojas viejas',
          'Crecimiento lento y raquítico',
          'Hojas pequeñas y pálidas',
          'Tallos delgados y débiles',
          'Floración reducida',
          'Frutos pequeños',
        ],
        causes: [
          'Suelos pobres en materia orgánica',
          'Lixiviación por lluvias excesivas',
          'pH muy ácido o muy alcalino',
          'Competencia con malezas',
          'Suelos arenosos',
          'Cultivos de alta demanda',
        ],
        controlMethods: [
          'Fertilizantes nitrogenados: urea, nitrato de amonio',
          'Abonos orgánicos: compost, estiércol',
          'Fertilizantes de liberación controlada',
          'Fertilización foliar en casos severos',
          'Inoculación con bacterias fijadoras (leguminosas)',
          'Aplicación fraccionada',
        ],
        prevention: [
          'Análisis de suelo previo',
          'Incorporación de materia orgánica',
          'Fertilización según requerimientos',
          'Control de malezas',
          'Rotación con leguminosas',
          'Manejo de pH del suelo',
        ],
        affectedPlants: ['Todos los cultivos'],
        geographicalDistribution: 'Mundial',
        economicImpact: 'Pérdidas 30-70% en producción',
        imageUrls: [
          'assets/diseases/deficiencia_n_1.jpg',
          'assets/diseases/deficiencia_n_2.jpg',
        ],
      ),

      // Enhanced Nutritional Deficiencies based on Cenicafé Research
      // Source: Sadeghian Khalajabadi, S. (2013). Nutrición de cafetales.
      // In: CENICAFÉ. Manual del cafetero colombiano
      DiseaseEntry(
        id: 'deficiencia_nitrogeno',
        scientificName: 'Nitrogen deficiency',
        commonName: 'Deficiencia de Nitrógeno (N) - Móvil',
        category: DiseaseCategory.NUTRITIONAL_DEFICIENCY,
        severity: SeverityLevel.MEDIUM,
        shortDescription:
            'Falta del nutriente más importante para crecimiento - Síntomas en hojas viejas',
        detailedDescription: '''
El nitrógeno es esencial para la síntesis de proteínas, clorofila y ácidos nucleicos. Su deficiencia es la más común en cultivos.

MOVILIDAD: Nutriente móvil, los síntomas aparecen primero en hojas viejas (Cenicafé).
CONDICIONES FAVORABLES: Suelos pobres en materia orgánica, lixiviación por lluvias.

DOSIS RECOMENDADAS CAFÉ: Levante: 30 g.año⁻¹/planta, Producción: 300 kg.ha⁻¹.año⁻¹
        ''',
        symptoms: [
          'Amarillamiento uniforme de hojas más viejas (Cenicafé)',
          'Clorosis general comenzando desde hojas inferiores',
          'Crecimiento lento y raquítico',
          'Hojas pequeñas y pálidas',
          'Pérdida de vigor general',
          'Reducción en producción de frutos',
        ],
        causes: [
          'Suelos pobres en materia orgánica',
          'Lixiviación por lluvias excesivas',
          'pH muy ácido o muy alcalino',
          'Competencia con malezas',
          'Suelos arenosos',
          'Cultivos de alta demanda',
        ],
        controlMethods: [
          'Fertilizantes nitrogenados: urea, nitrato de amonio',
          'Abonos orgánicos: compost, estiércol',
          'Fertilizantes de liberación controlada',
          'Aplicación foliar en casos severos',
          'Inoculación con bacterias fijadoras (leguminosas)',
          'Aplicación fraccionada en 3-4 dosis',
        ],
        prevention: [
          'Análisis de suelo previo',
          'Incorporación de materia orgánica',
          'Fertilización según requerimientos',
          'Control de malezas',
          'Rotación con leguminosas',
          'Manejo de pH del suelo',
        ],
        affectedPlants: [
          'Café',
          'Maíz',
          'Frijol',
          'Tomate',
          'Pepino',
          'Remolacha',
          'Lechuga',
          'Papa',
          'Todos los cultivos',
        ],
        geographicalDistribution: 'Mundial',
        economicImpact: 'Pérdidas 30-70% en producción',
        imageUrls: [
          'assets/diseases/deficiencia_n_1.jpg',
          'assets/diseases/deficiencia_n_2.jpg',
        ],
      ),

      DiseaseEntry(
        id: 'deficiencia_fosforo',
        scientificName: 'Phosphorus deficiency',
        commonName: 'Deficiencia de Fósforo (P) - Móvil',
        category: DiseaseCategory.NUTRITIONAL_DEFICIENCY,
        severity: SeverityLevel.MEDIUM,
        shortDescription:
            'Deficiencia que causa coloración rojiza en hojas viejas',
        detailedDescription: '''
El fósforo es esencial para el metabolismo energético, formación de raíces y reproducción.

MOVILIDAD: Nutriente móvil, síntomas en hojas viejas (Cenicafé).
DOSIS RECOMENDADA CAFÉ: 60 kg.ha⁻¹.año⁻¹ de P₂O₅ en aplicación localizada.
        ''',
        symptoms: [
          'Coloración rojiza-púrpura en hojas viejas (Cenicafé)',
          'Acumulación de antocianinas por estrés',
          'Hojas más viejas afectadas primero',
          'Retraso en crecimiento y floración',
          'Raíces poco desarrolladas',
          'Frutos pequeños y deformes',
        ],
        causes: [
          'Suelos ácidos con fijación de P',
          'Bajos niveles de materia orgánica',
          'Suelos arenosos con lixiviación',
          'Aplicaciones insuficientes',
          'pH inadecuado para disponibilidad',
          'Competencia con malezas',
        ],
        controlMethods: [
          'Superfosfato triple o simple',
          'Fosfato diamónico (DAP)',
          'Aplicación localizada en surcos',
          'Fertilizantes de liberación controlada',
          'Enmiendas para corregir pH',
          'Aplicación foliar en casos severos',
        ],
        prevention: [
          'Análisis de suelo para P disponible',
          'Aplicación preventiva en suelos deficientes',
          'Manejo adecuado del pH (5.5-6.5)',
          'Incorporación de materia orgánica',
          'Rotación de cultivos',
          'Evitar suelos muy ácidos',
        ],
        affectedPlants: [
          'Café',
          'Maíz',
          'Frijol',
          'Tomate',
          'Pepino',
          'Remolacha',
          'Lechuga',
          'Papa',
        ],
        geographicalDistribution: 'Mundial, especialmente suelos ácidos',
        economicImpact: 'Pérdidas 20-50% en rendimiento',
        imageUrls: [
          'assets/diseases/deficiencia_p_1.jpg',
          'assets/diseases/deficiencia_p_2.jpg',
        ],
      ),

      DiseaseEntry(
        id: 'deficiencia_potasio',
        scientificName: 'Potassium deficiency',
        commonName: 'Deficiencia de Potasio (K) - Móvil',
        category: DiseaseCategory.NUTRITIONAL_DEFICIENCY,
        severity: SeverityLevel.MEDIUM,
        shortDescription:
            'Deficiencia que causa necrosis marginal en zona productiva',
        detailedDescription: '''
El potasio regula el balance hídrico, activa enzimas y mejora calidad de frutos.

MOVILIDAD: Nutriente móvil, síntomas en zona productiva (Cenicafé).
DOSIS RECOMENDADA CAFÉ: 300 kg.ha⁻¹.año⁻¹ de K₂O en 2-3 aplicaciones.
        ''',
        symptoms: [
          'Necrosis en puntas y bordes de hojas (Cenicafé)',
          'Quemaduras marginales en zona productiva',
          'Hojas más viejas afectadas primero',
          'Manchas necróticas irregulares',
          'Reducción en grosor de pulpa de frutos',
          'Paloteo en casos severos',
        ],
        causes: [
          'Suelos arenosos con lixiviación',
          'Baja capacidad de intercambio catiónico',
          'Lluvias excesivas',
          'Aplicaciones insuficientes',
          'Desbalances con Ca y Mg',
          'Fertilización nitrogenada excesiva',
        ],
        controlMethods: [
          'Sulfato de potasio (K₂SO₄)',
          'Cloruro de potasio (KCl)',
          'Nitrato de potasio',
          'Fertilizantes compuestos (17-6-18-2)',
          'Aplicación en época seca',
          'Corrección de desbalances iónicos',
        ],
        prevention: [
          'Análisis de suelo para K intercambiable',
          'Fertilización balanceada N-K',
          'Manejo de materia orgánica',
          'Control de erosión',
          'Rotación de cultivos',
          'Evitar fertilización nitrogenada excesiva',
        ],
        affectedPlants: [
          'Café',
          'Maíz',
          'Frijol',
          'Tomate',
          'Pepino',
          'Remolacha',
          'Lechuga',
          'Papa',
        ],
        geographicalDistribution: 'Mundial, especialmente suelos arenosos',
        economicImpact: 'Pérdidas 20-40% en rendimiento y calidad',
        imageUrls: [
          'assets/diseases/deficiencia_k_1.jpg',
          'assets/diseases/deficiencia_k_2.jpg',
        ],
      ),

      DiseaseEntry(
        id: 'deficiencia_magnesio',
        scientificName: 'Magnesium deficiency',
        commonName: 'Deficiencia de Magnesio (Mg) - Móvil',
        category: DiseaseCategory.NUTRITIONAL_DEFICIENCY,
        severity: SeverityLevel.MEDIUM,
        shortDescription:
            'Deficiencia que causa clorosis intervenal en hojas viejas',
        detailedDescription: '''
El magnesio es componente de la clorofila y activa muchas enzimas.

MOVILIDAD: Nutriente móvil, síntomas en hojas viejas (Cenicafé).
DOSIS RECOMENDADA CAFÉ: 60 kg.ha⁻¹.año⁻¹ de MgO en 1-2 aplicaciones.
        ''',
        symptoms: [
          'Clorosis intervenal en hojas más viejas (Cenicafé)',
          'Coloración rojiza o púrpura en hojas maduras',
          'Venas permanecen verdes, lámina amarillea',
          'Progresa desde hojas inferiores hacia arriba',
          'Caída prematura de hojas productivas',
          'Reducción en producción',
        ],
        causes: [
          'Suelos ácidos con lixiviación',
          'Fertilización potásica excesiva',
          'Baja materia orgánica',
          'Suelos arenosos',
          'Encalado sin Mg (cal agrícola común)',
          'Desbalances con K y Ca',
        ],
        controlMethods: [
          'Sulfato de magnesio (MgSO₄·7H₂O)',
          'Óxido de magnesio',
          'Caliza dolomítica',
          'Fertilizantes con Mg',
          'Aplicación foliar',
          'Corrección de relación K/Mg',
        ],
        prevention: [
          'Análisis de suelo para Mg',
          'Uso de enmiendas con Mg',
          'Fertilización balanceada',
          'Manejo de materia orgánica',
          'Evitar exceso de K',
          'Monitoreo de relación K/Mg',
        ],
        affectedPlants: [
          'Café',
          'Maíz',
          'Frijol',
          'Tomate',
          'Pepino',
          'Remolacha',
          'Lechuga',
          'Papa',
        ],
        geographicalDistribution: 'Mundial, especialmente suelos ácidos',
        economicImpact: 'Pérdidas 15-35% en producción',
        imageUrls: [
          'assets/diseases/deficiencia_mg_1.jpg',
          'assets/diseases/deficiencia_mg_2.jpg',
        ],
      ),

      DiseaseEntry(
        id: 'deficiencia_calcio',
        scientificName: 'Calcium deficiency',
        commonName: 'Deficiencia de Calcio (Ca) - Inmóvil',
        category: DiseaseCategory.NUTRITIONAL_DEFICIENCY,
        severity: SeverityLevel.MEDIUM,
        shortDescription:
            'Deficiencia que causa clorosis en bordes de hojas jóvenes',
        detailedDescription: '''
El calcio es esencial para la integridad de membranas y formación de paredes celulares.

MOVILIDAD: Nutriente inmóvil, síntomas en hojas jóvenes (Cenicafé).
DOSIS RECOMENDADA CAFÉ: 400-1400 kg.ha⁻¹ de cal según acidez.
        ''',
        symptoms: [
          'Clorosis en bordes de hojas jóvenes (Cenicafé)',
          'Hojas nuevas con bordes ondulados',
          'Puntas de crecimiento necrosadas',
          'Hojas jóvenes más afectadas',
          'Deformación de frutos jóvenes',
          'Pudrición apical en frutos',
        ],
        causes: [
          'Suelos muy ácidos',
          'Baja capacidad de intercambio catiónico',
          'Lluvias ácidas',
          'Fertilizantes fisiológicamente ácidos',
          'Lixiviación en suelos arenosos',
          'Desbalances con K y Mg',
        ],
        controlMethods: [
          'Cal agrícola (CaCO₃)',
          'Yeso agrícola (CaSO₄)',
          'Caliza dolomítica',
          'Aplicación foliar de calcio',
          'Corrección gradual del pH',
          'Manejo de relación Ca/Mg/K',
        ],
        prevention: [
          'Análisis de pH y Ca del suelo',
          'Encalado preventivo',
          'Uso de variedades tolerantes',
          'Fertilización balanceada',
          'Control de erosión',
          'Monitoreo de pH del suelo',
        ],
        affectedPlants: [
          'Café',
          'Maíz',
          'Frijol',
          'Tomate',
          'Pepino',
          'Remolacha',
          'Lechuga',
          'Papa',
        ],
        geographicalDistribution: 'Zonas con suelos ácidos',
        economicImpact: 'Pérdidas 20-50% en calidad de frutos',
        imageUrls: [
          'assets/diseases/deficiencia_ca_1.jpg',
          'assets/diseases/deficiencia_ca_2.jpg',
        ],
      ),

      DiseaseEntry(
        id: 'deficiencia_hierro',
        scientificName: 'Iron deficiency',
        commonName: 'Deficiencia de Hierro (Fe) - Inmóvil',
        category: DiseaseCategory.NUTRITIONAL_DEFICIENCY,
        severity: SeverityLevel.MEDIUM,
        shortDescription:
            'Deficiencia que causa clorosis intervenal en hojas jóvenes',
        detailedDescription: '''
El hierro es esencial para la síntesis de clorofila y respiración celular.

MOVILIDAD: Nutriente inmóvil, síntomas en hojas jóvenes (Cenicafé).
PECULIARIDAD: Común en suelos calcáreos donde el hierro se vuelve insoluble.
        ''',
        symptoms: [
          'Clorosis intervenal en hojas jóvenes (Cenicafé)',
          'Amarillamiento entre venas, venas permanecen verdes',
          'Hojas jóvenes más afectadas',
          'Coloración verde muy claro a blanco',
          'Crecimiento retardado',
          'Reducción en fotosíntesis',
        ],
        causes: [
          'pH alcalino del suelo (>7.5)',
          'Exceso de fósforo que bloquea hierro',
          'Suelos calcáreos',
          'Encharcamiento',
          'Exceso de zinc o manganeso',
          'Raíces dañadas',
        ],
        controlMethods: [
          'Quelatos de hierro (Fe-EDTA, Fe-EDDHA)',
          'Sulfato ferroso en suelos ácidos',
          'Aplicación foliar de hierro',
          'Acidificación del suelo',
          'Mejora del drenaje',
          'Aplicación junto con ácidos orgánicos',
        ],
        prevention: [
          'Análisis de pH del suelo',
          'Uso de portainjertos tolerantes',
          'Incorporación de azufre para acidificar',
          'Evitar exceso de fósforo',
          'Drenaje adecuado',
          'Variedades tolerantes a clorosis',
        ],
        affectedPlants: [
          'Café',
          'Maíz',
          'Frijol',
          'Tomate',
          'Pepino',
          'Remolacha',
          'Lechuga',
          'Papa',
          'Frutales',
        ],
        geographicalDistribution: 'Zonas con suelos calcáreos',
        economicImpact: 'Pérdidas 20-60% en frutales y hortalizas',
        imageUrls: [
          'assets/diseases/deficiencia_fe_1.jpg',
          'assets/diseases/deficiencia_fe_2.jpg',
        ],
      ),

      DiseaseEntry(
        id: 'deficiencia_azufre',
        scientificName: 'Sulfur deficiency',
        commonName: 'Deficiencia de Azufre (S) - Inmóvil',
        category: DiseaseCategory.NUTRITIONAL_DEFICIENCY,
        severity: SeverityLevel.LOW,
        shortDescription:
            'Deficiencia que causa amarillamiento de hojas jóvenes',
        detailedDescription: '''
El azufre es componente de aminoácidos y enzimas, esencial para síntesis de proteínas.

MOVILIDAD: Nutriente inmóvil, síntomas en hojas jóvenes (Cenicafé).
DOSIS RECOMENDADA CAFÉ: 50 kg.ha⁻¹.año⁻¹ de S.
        ''',
        symptoms: [
          'Amarillamiento uniforme de hojas jóvenes (Cenicafé)',
          'Hojas nuevas más pálidas que las viejas',
          'Afecta principalmente el tercio superior',
          'Reducción en crecimiento vegetativo',
          'Frutos pequeños con menor calidad',
          'Confusión posible con deficiencia de N',
        ],
        causes: [
          'Suelos con baja materia orgánica',
          'Lixiviación en suelos arenosos',
          'Baja mineralización',
          'Fertilizantes sin S',
          'Suelos ácidos fríos',
          'Lluvias ácidas que acidifican más',
        ],
        controlMethods: [
          'Sulfato de amonio',
          'Sulfato de potasio',
          'Sulfato de magnesio',
          'Azufre elemental',
          'Fertilizantes con S',
          'Aplicación foliar',
        ],
        prevention: [
          'Análisis de S en suelo',
          'Incorporación de materia orgánica',
          'Fertilizantes completos con S',
          'Rotación con leguminosas',
          'Manejo de pH del suelo',
          'Monitoreo en suelos arenosos',
        ],
        affectedPlants: [
          'Café',
          'Maíz',
          'Frijol',
          'Tomate',
          'Pepino',
          'Remolacha',
          'Lechuga',
          'Papa',
        ],
        geographicalDistribution: 'Zonas con suelos pobres en materia orgánica',
        economicImpact: 'Pérdidas 10-30% en rendimiento',
        imageUrls: [
          'assets/diseases/deficiencia_s_1.jpg',
          'assets/diseases/deficiencia_s_2.jpg',
        ],
      ),

      DiseaseEntry(
        id: 'deficiencia_boro',
        scientificName: 'Boron deficiency',
        commonName: 'Deficiencia de Boro (B) - Inmóvil',
        category: DiseaseCategory.NUTRITIONAL_DEFICIENCY,
        severity: SeverityLevel.MEDIUM,
        shortDescription: 'Deficiencia que causa manchas cafés en brotes',
        detailedDescription: '''
El boro es esencial para la división celular, polinización y transporte de azúcares.

MOVILIDAD: Nutriente inmóvil, síntomas en tejidos jóvenes (Cenicafé).
DOSIS RECOMENDADA CAFÉ: 2-3 kg.ha⁻¹.año⁻¹ de B.
        ''',
        symptoms: [
          'Manchas cafés en brotes y hojas jóvenes (Cenicafé)',
          'Muerte de yemas terminales',
          'Hojas con forma de "V" invertida verde aceituna',
          'Suberización de nervaduras en hojas viejas',
          'Frutos con manchas circulares cafés',
          'Reducción en polinización y fructificación',
        ],
        causes: [
          'Suelos arenosos con lixiviación',
          'Baja materia orgánica',
          'pH alcalino',
          'Sequía prolongada',
          'Fertilizantes sin B',
          'Suelos derivados de cenizas volcánicas',
        ],
        controlMethods: [
          'Bórax (11% B)',
          'Solubor (20% B)',
          'Aplicación foliar preventiva',
          'Fertilizantes con B',
          'Aplicación al suelo en surcos',
          'Dosis fraccionadas para evitar toxicidad',
        ],
        prevention: [
          'Análisis de B en suelo',
          'Aplicación preventiva en suelos deficientes',
          'Incorporación de materia orgánica',
          'Fertilizantes completos',
          'Monitoreo en suelos arenosos',
          'Evitar dosis excesivas',
        ],
        affectedPlants: [
          'Café',
          'Maíz',
          'Frijol',
          'Tomate',
          'Pepino',
          'Remolacha',
          'Lechuga',
          'Papa',
        ],
        geographicalDistribution:
            'Suelos arenosos y pobres en materia orgánica',
        economicImpact: 'Pérdidas 15-40% en producción y calidad',
        imageUrls: [
          'assets/diseases/deficiencia_b_1.jpg',
          'assets/diseases/deficiencia_b_2.jpg',
        ],
      ),

      DiseaseEntry(
        id: 'deficiencia_zinc',
        scientificName: 'Zinc deficiency',
        commonName: 'Deficiencia de Zinc (Zn) - Inmóvil',
        category: DiseaseCategory.NUTRITIONAL_DEFICIENCY,
        severity: SeverityLevel.MEDIUM,
        shortDescription:
            'Deficiencia que causa hojas pequeñas con clorosis intervenal',
        detailedDescription: '''
El zinc es cofactor de enzimas y esencial para síntesis de auxinas.

MOVILIDAD: Nutriente inmóvil, síntomas en hojas jóvenes (Cenicafé).
DOSIS RECOMENDADA CAFÉ: 3 kg.ha⁻¹.año⁻¹ de Zn.
        ''',
        symptoms: [
          'Hojas jóvenes más pequeñas y lanceoladas (Cenicafé)',
          'Clorosis intervenal en hojas nuevas',
          'Entrenudos cortos (acortamiento)',
          'Hojas jóvenes más afectadas',
          'Reducción en crecimiento vegetativo',
          'Frutos pequeños y deformes',
        ],
        causes: [
          'Suelos calcáreos (pH > 7.0)',
          'Exceso de fósforo',
          'Baja materia orgánica',
          'Suelos arenosos',
          'Fertilizantes sin Zn',
          'Encalado excesivo',
        ],
        controlMethods: [
          'Sulfato de zinc (ZnSO₄·7H₂O)',
          'Óxido de zinc',
          'Aplicación foliar',
          'Fertilizantes con Zn',
          'Quelatos de zinc',
          'Corrección de relación Zn/P',
        ],
        prevention: [
          'Análisis de Zn en suelo',
          'Fertilizantes con micronutrientes',
          'Manejo de pH del suelo',
          'Evitar exceso de fósforo',
          'Incorporación de materia orgánica',
          'Monitoreo en suelos calcáreos',
        ],
        affectedPlants: [
          'Café',
          'Maíz',
          'Frijol',
          'Tomate',
          'Pepino',
          'Remolacha',
          'Lechuga',
          'Papa',
        ],
        geographicalDistribution: 'Suelos calcáreos y con exceso de fósforo',
        economicImpact: 'Pérdidas 20-50% en crecimiento vegetativo',
        imageUrls: [
          'assets/diseases/deficiencia_zn_1.jpg',
          'assets/diseases/deficiencia_zn_2.jpg',
        ],
      ),

      // Additional Diseases from Reliable Sources
      // Source: Cenicafé - Centro Nacional de Investigaciones de Café
      // Manual del Cafetero Colombiano
      DiseaseEntry(
        id: 'cercospora_cafe',
        scientificName: 'Cercospora coffeicola',
        commonName: 'Mancha de Cercospora del Café',
        category: DiseaseCategory.FUNGAL_DISEASE,
        severity: SeverityLevel.MEDIUM,
        shortDescription:
            'Enfermedad fúngica que causa manchas angulares en hojas de café',
        detailedDescription: '''
La mancha de cercospora es causada por Cercospora coffeicola. Produce manchas angulares características limitadas por las venas de las hojas.
        ''',
        symptoms: [
          'Manchas angulares limitadas por venas',
          'Centro gris con borde café',
          'Puntos negros (conidios) en lesiones',
          'Defoliación en casos severos',
          'Reducción en fotosíntesis',
          'Debilitamiento de plantas',
        ],
        causes: [
          'Humedad relativa alta',
          'Temperaturas entre 20-25°C',
          'Lluvias frecuentes',
          'Variedades susceptibles',
          'Mala ventilación',
          'Exceso de sombra',
        ],
        controlMethods: [
          'Fungicidas cúpricos',
          'Triazoles sistémicos',
          'Mejora de ventilación',
          'Poda sanitaria',
          'Variedades resistentes',
          'Manejo de sombra',
        ],
        prevention: [
          'Uso de variedades resistentes',
          'Manejo óptimo de sombra',
          'Fertilización balanceada',
          'Monitoreo regular',
          'Rotación de fungicidas',
          'Eliminación de hojas infectadas',
        ],
        affectedPlants: ['Coffea arabica', 'Coffea canephora'],
        geographicalDistribution: 'Zonas cafetaleras tropicales',
        economicImpact: 'Pérdidas 10-30% en producción',
        imageUrls: [
          'assets/diseases/cercospora_cafe_1.jpg',
          'assets/diseases/cercospora_cafe_2.jpg',
        ],
      ),

      // Source: USDA - United States Department of Agriculture
      // Corn Disease Compendium
      DiseaseEntry(
        id: 'carbón_maiz',
        scientificName: 'Ustilago maydis',
        commonName: 'Carbón del Maíz',
        category: DiseaseCategory.FUNGAL_DISEASE,
        severity: SeverityLevel.HIGH,
        shortDescription: 'Enfermedad fúngica que forma tumores negros en maíz',
        detailedDescription: '''
El carbón del maíz es causado por Ustilago maydis. Produce tumores característicos llenos de esporas negras en diferentes partes de la planta.
        ''',
        symptoms: [
          'Tumores irregulares en mazorcas',
          'Masas negras de esporas',
          'Lesiones en tallos y hojas',
          'Enanismo de plantas',
          'Mazorcas deformes',
          'Pérdida total de grano',
        ],
        causes: [
          'Temperaturas entre 20-30°C',
          'Humedad relativa alta',
          'Heridas en plantas',
          'Variedades susceptibles',
          'Suelos con alto contenido orgánico',
          'Rotación insuficiente',
        ],
        controlMethods: [
          'Variedades resistentes',
          'Rotación de cultivos',
          'Manejo de residuos',
          'Fungicidas en semilla',
          'Control de malezas',
          'Fertilización balanceada',
        ],
        prevention: [
          'Uso de híbridos resistentes',
          'Rotación de 2-3 años',
          'Manejo de residuos culturales',
          'Semillas certificadas',
          'Control de insectos vectores',
          'Monitoreo regular',
        ],
        affectedPlants: ['Zea mays (Maíz)'],
        geographicalDistribution: 'Mundial, zonas tropicales y subtropicales',
        economicImpact: 'Pérdidas 20-80% en mazorcas afectadas',
        imageUrls: [
          'assets/diseases/carbon_maiz_1.jpg',
          'assets/diseases/carbon_maiz_2.jpg',
        ],
      ),

      // Source: CIAT - Centro Internacional de Agricultura Tropical
      // Bean Production Guide
      DiseaseEntry(
        id: 'mosaico_frijol',
        scientificName: 'Bean common mosaic virus (BCMV)',
        commonName: 'Mosaico Común del Frijol',
        category: DiseaseCategory.VIRAL_DISEASE,
        severity: SeverityLevel.HIGH,
        shortDescription: 'Virus que causa mosaicos y deformaciones en frijol',
        detailedDescription: '''
El mosaico común del frijol es causado por el virus BCMV. Es transmitido por áfidos y semillas infectadas, causando pérdidas significativas.
        ''',
        symptoms: [
          'Mosaico verde claro y oscuro en hojas',
          'Deformación de foliolos',
          'Enanismo de plantas',
          'Reducción en floración',
          'Vainas deformes',
          'Disminución en rendimiento',
        ],
        causes: [
          'Transmisión por áfidos (Aphis fabae)',
          'Semillas infectadas',
          'Variedades susceptibles',
          'Presencia de malezas hospederas',
          'Falta de control de vectores',
          'Rotación insuficiente',
        ],
        controlMethods: [
          'Variedades resistentes',
          'Control de áfidos',
          'Semillas certificadas',
          'Eliminación de plantas infectadas',
          'Control de malezas',
          'Rotación de cultivos',
        ],
        prevention: [
          'Uso de variedades resistentes',
          'Semillas libres de virus',
          'Control preventivo de áfidos',
          'Eliminación de malezas',
          'Monitoreo regular',
          'Rotación con cultivos no hospederos',
        ],
        affectedPlants: ['Phaseolus vulgaris (Frijol común)'],
        geographicalDistribution: 'Mundial',
        economicImpact: 'Pérdidas 30-70% en producción',
        imageUrls: [
          'assets/diseases/mosaico_frijol_1.jpg',
          'assets/diseases/mosaico_frijol_2.jpg',
        ],
      ),

      // Source: University of Florida Extension
      // Tomato Disease Guide
      DiseaseEntry(
        id: 'fusarium_tomate',
        scientificName: 'Fusarium oxysporum f.sp. lycopersici',
        commonName: 'Marchitez por Fusarium del Tomate',
        category: DiseaseCategory.FUNGAL_DISEASE,
        severity: SeverityLevel.CRITICAL,
        shortDescription:
            'Hongo del suelo que causa marchitez vascular en tomate',
        detailedDescription: '''
Fusarium oxysporum f.sp. lycopersici causa marchitez vascular en tomate. Es un patógeno del suelo que puede persistir por años.
        ''',
        symptoms: [
          'Marchitez de hojas inferiores',
          'Amarillamiento unilateral',
          'Oscurecimiento vascular',
          'Enanismo de plantas',
          'Frutos pequeños',
          'Muerte de plantas',
        ],
        causes: [
          'Suelos contaminados',
          'pH ácido del suelo',
          'Temperaturas altas',
          'Estrés hídrico',
          'Variedades susceptibles',
          'Rotación insuficiente',
        ],
        controlMethods: [
          'Variedades resistentes',
          'Solarización del suelo',
          'Fungicidas sistémicos',
          'Injertos en portainjertos resistentes',
          'Biocontrol con Trichoderma',
          'Rotación de cultivos',
        ],
        prevention: [
          'Uso de variedades resistentes',
          'Desinfección de suelos',
          'Rotación de 3-4 años',
          'Manejo del pH del suelo',
          'Semillas certificadas',
          'Control de estrés',
        ],
        affectedPlants: ['Solanum lycopersicum (Tomate)'],
        geographicalDistribution: 'Mundial, zonas de producción de tomate',
        economicImpact: 'Pérdidas 50-100% en cultivos susceptibles',
        imageUrls: [
          'assets/diseases/fusarium_tomate_1.jpg',
          'assets/diseases/fusarium_tomate_2.jpg',
        ],
      ),

      // Source: University of Maryland Extension
      // Cucumber Production Guide
      DiseaseEntry(
        id: 'mildiu_pepino',
        scientificName: 'Pseudoperonospora cubensis',
        commonName: 'Mildiu del Pepino',
        category: DiseaseCategory.FUNGAL_DISEASE,
        severity: SeverityLevel.CRITICAL,
        shortDescription:
            'Enfermedad fúngica devastadora del pepino y cucurbitáceas',
        detailedDescription: '''
El mildiu del pepino es causado por Pseudoperonospora cubensis. Es una enfermedad destructiva que puede causar pérdidas totales en condiciones favorables.
        ''',
        symptoms: [
          'Manchas angulares amarillas en hojas',
          'Moho púrpura-gris en el envés',
          'Defoliación rápida',
          'Manchas en frutos',
          'Deformación de frutos',
          'Pérdida total de cosecha',
        ],
        causes: [
          'Humedad relativa >90%',
          'Temperaturas entre 15-25°C',
          'Lluvias frecuentes',
          'Rocío nocturno',
          'Variedades susceptibles',
          'Densidad de siembra alta',
        ],
        controlMethods: [
          'Fungicidas sistémicos',
          'Mejora de ventilación',
          'Riego dirigido',
          'Eliminación de plantas infectadas',
          'Variedades resistentes',
          'Manejo de residuos',
        ],
        prevention: [
          'Uso de variedades resistentes',
          'Rotación de cultivos',
          'Manejo de humedad',
          'Fertilización balanceada',
          'Monitoreo regular',
          'Desinfección de suelo',
        ],
        affectedPlants: ['Cucumis sativus (Pepino)', 'Cucurbita spp.'],
        geographicalDistribution: 'Mundial, zonas templadas y tropicales',
        economicImpact: 'Pérdidas 50-100% en condiciones favorables',
        imageUrls: [
          'assets/diseases/mildiu_pepino_1.jpg',
          'assets/diseases/mildiu_pepino_2.jpg',
        ],
      ),

      // Source: University of Nebraska Extension
      // Sugar Beet Production
      DiseaseEntry(
        id: 'cercospora_remolacha',
        scientificName: 'Cercospora beticola',
        commonName: 'Mancha de Cercospora de la Remolacha',
        category: DiseaseCategory.FUNGAL_DISEASE,
        severity: SeverityLevel.CRITICAL,
        shortDescription:
            'Enfermedad fúngica más importante de la remolacha azucarera',
        detailedDescription: '''
La mancha de cercospora es causada por Cercospora beticola. Es la enfermedad más destructiva de la remolacha azucarera a nivel mundial.
        ''',
        symptoms: [
          'Manchas circulares con centros grises',
          'Halos cloróticos alrededor',
          'Puntos negros en lesiones',
          'Defoliación severa',
          'Reducción en crecimiento de raíces',
          'Disminución en contenido de azúcar',
        ],
        causes: [
          'Humedad foliar alta',
          'Temperaturas entre 20-30°C',
          'Lluvias frecuentes',
          'Variedades susceptibles',
          'Densidad de siembra alta',
          'Falta de rotación',
        ],
        controlMethods: [
          'Fungicidas triazoles',
          'Estrobilurinas',
          'Variedades resistentes',
          'Rotación de cultivos',
          'Manejo de residuos',
          'Aplicación preventiva',
        ],
        prevention: [
          'Uso de variedades resistentes',
          'Rotación con cereales',
          'Manejo de residuos',
          'Monitoreo temprano',
          'Fertilización balanceada',
          'Densidad óptima de siembra',
        ],
        affectedPlants: ['Beta vulgaris (Remolacha azucarera)'],
        geographicalDistribution: 'Mundial, zonas templadas',
        economicImpact: 'Pérdidas 20-80% en rendimiento y calidad',
        imageUrls: [
          'assets/diseases/cercospora_remolacha_1.jpg',
          'assets/diseases/cercospora_remolacha_2.jpg',
        ],
      ),

      // Source: University of California Extension
      // Lettuce Pest and Disease Management
      DiseaseEntry(
        id: 'sclerotinia_lechuga',
        scientificName: 'Sclerotinia sclerotiorum',
        commonName: 'Podredumbre por Sclerotinia en Lechuga',
        category: DiseaseCategory.FUNGAL_DISEASE,
        severity: SeverityLevel.HIGH,
        shortDescription: 'Hongo que causa podredumbre blanda en lechuga',
        detailedDescription: '''
Sclerotinia sclerotiorum causa podredumbre blanda en lechuga. Produce esclerocios negros que sobreviven en el suelo por años.
        ''',
        symptoms: [
          'Podredumbre blanda de plantas',
          'Moho blanco en tejidos afectados',
          'Esclerocios negros en plantas',
          'Marchitez rápida',
          'Mal olor',
          'Pérdida total de plantas',
        ],
        causes: [
          'Humedad del suelo alta',
          'Temperaturas entre 15-25°C',
          'Suelos con alto contenido orgánico',
          'Variedades susceptibles',
          'Daño por herramientas',
          'Estrés por frío',
        ],
        controlMethods: [
          'Fungicidas preventivos',
          'Mejora de drenaje',
          'Rotación de cultivos',
          'Eliminación de residuos',
          'Variedades resistentes',
          'Manejo de pH del suelo',
        ],
        prevention: [
          'Rotación de 4-5 años',
          'Manejo de residuos',
          'Drenaje adecuado',
          'Fertilización balanceada',
          'Monitoreo regular',
          'Control de malezas',
        ],
        affectedPlants: ['Lactuca sativa (Lechuga)'],
        geographicalDistribution: 'Mundial, zonas templadas',
        economicImpact: 'Pérdidas 30-70% en lechugas afectadas',
        imageUrls: [
          'assets/diseases/sclerotinia_lechuga_1.jpg',
          'assets/diseases/sclerotinia_lechuga_2.jpg',
        ],
      ),

      // Source: Cornell University Extension
      // Potato Disease Management
      DiseaseEntry(
        id: 'tizon_tardio_papa',
        scientificName: 'Phytophthora infestans',
        commonName: 'Tizón Tardío de la Papa',
        category: DiseaseCategory.FUNGAL_DISEASE,
        severity: SeverityLevel.CRITICAL,
        shortDescription: 'Enfermedad fúngica más destructiva de la papa',
        detailedDescription: '''
El tizón tardío es causado por Phytophthora infestans. Es responsable de la Gran Hambruna Irlandesa y sigue siendo la enfermedad más destructiva de la papa.
        ''',
        symptoms: [
          'Manchas irregulares en hojas',
          'Moho blanco en el envés',
          'Podredumbre blanda en tubérculos',
          'Mal olor a podrido',
          'Marchitez rápida',
          'Pérdida total de cosecha',
        ],
        causes: [
          'Humedad relativa >90%',
          'Temperaturas entre 10-20°C',
          'Lluvias frecuentes',
          'Rocío nocturno prolongado',
          'Variedades susceptibles',
          'Densidad de siembra alta',
        ],
        controlMethods: [
          'Fungicidas sistémicos',
          'Mejora de ventilación',
          'Riego dirigido',
          'Eliminación de plantas infectadas',
          'Variedades resistentes',
          'Almacenamiento adecuado',
        ],
        prevention: [
          'Uso de variedades resistentes',
          'Rotación de cultivos',
          'Manejo de residuos',
          'Monitoreo regular',
          'Fertilización balanceada',
          'Almacenamiento en condiciones óptimas',
        ],
        affectedPlants: ['Solanum tuberosum (Papa)'],
        geographicalDistribution: 'Mundial',
        economicImpact: 'Pérdidas 50-100% en condiciones favorables',
        imageUrls: [
          'assets/diseases/tizon_tardio_papa_1.jpg',
          'assets/diseases/tizon_tardio_papa_2.jpg',
        ],
      ),
    ];

    _categorizeByType();
  }

  void _categorizeByType() {
    _categorizedDiseases.clear();
    for (var disease in _diseases) {
      if (!_categorizedDiseases.containsKey(disease.category)) {
        _categorizedDiseases[disease.category] = [];
      }
      _categorizedDiseases[disease.category]!.add(disease);
    }
  }

  // Métodos de búsqueda y filtrado
  List<DiseaseEntry> getAllDiseases() => _diseases;

  List<DiseaseEntry> getDiseasesByCategory(DiseaseCategory category) =>
      _categorizedDiseases[category] ?? [];

  List<DiseaseEntry> searchBySymptoms(List<String> symptoms) {
    return _diseases.where((disease) {
      return symptoms.any(
        (symptom) => disease.symptoms.any(
          (diseaseSymptom) =>
              diseaseSymptom.toLowerCase().contains(symptom.toLowerCase()),
        ),
      );
    }).toList();
  }

  List<DiseaseEntry> searchByPlant(String plantName) {
    return _diseases.where((disease) {
      return disease.affectedPlants.any(
        (plant) => plant.toLowerCase().contains(plantName.toLowerCase()),
      );
    }).toList();
  }

  List<DiseaseEntry> filterBySeverity(SeverityLevel severity) {
    return _diseases.where((disease) => disease.severity == severity).toList();
  }

  DiseaseEntry? getDiseaseById(String id) {
    try {
      return _diseases.firstWhere((disease) => disease.id == id);
    } catch (e) {
      return null;
    }
  }

  // Análisis de similitud para diagnóstico
  List<DiseaseMatch> findSimilarDiseases(List<String> observedSymptoms) {
    List<DiseaseMatch> matches = [];

    for (var disease in _diseases) {
      double similarity = _calculateSimilarity(disease, observedSymptoms);
      if (similarity > 0.3) {
        matches.add(
          DiseaseMatch(
            disease: disease,
            similarity: similarity,
            matchedSymptoms: _getMatchedSymptoms(disease, observedSymptoms),
          ),
        );
      }
    }

    matches.sort((a, b) => b.similarity.compareTo(a.similarity));
    return matches.take(5).toList();
  }

  double _calculateSimilarity(
    DiseaseEntry disease,
    List<String> observedSymptoms,
  ) {
    if (disease.symptoms.isEmpty || observedSymptoms.isEmpty) return 0.0;

    int matches = 0;
    for (String observed in observedSymptoms) {
      for (String diseaseSymptom in disease.symptoms) {
        if (diseaseSymptom.toLowerCase().contains(observed.toLowerCase()) ||
            observed.toLowerCase().contains(diseaseSymptom.toLowerCase())) {
          matches++;
          break;
        }
      }
    }

    return matches / disease.symptoms.length;
  }

  List<String> _getMatchedSymptoms(
    DiseaseEntry disease,
    List<String> observedSymptoms,
  ) {
    List<String> matched = [];
    for (String observed in observedSymptoms) {
      for (String diseaseSymptom in disease.symptoms) {
        if (diseaseSymptom.toLowerCase().contains(observed.toLowerCase()) ||
            observed.toLowerCase().contains(diseaseSymptom.toLowerCase())) {
          matched.add(diseaseSymptom);
          break;
        }
      }
    }
    return matched;
  }

  // Estadísticas
  Map<DiseaseCategory, int> getCategoryStatistics() {
    Map<DiseaseCategory, int> stats = {};
    for (var category in DiseaseCategory.values) {
      stats[category] = _categorizedDiseases[category]?.length ?? 0;
    }
    return stats;
  }

  int getTotalDiseases() => _diseases.length;
}

// Modelos de datos para la enciclopedia

class DiseaseEntry {
  final String id;
  final String scientificName;
  final String commonName;
  final DiseaseCategory category;
  final SeverityLevel severity;
  final String shortDescription;
  final String detailedDescription;
  final List<String> symptoms;
  final List<String> causes;
  final List<String> controlMethods;
  final List<String> prevention;
  final List<String> affectedPlants;
  final String geographicalDistribution;
  final String economicImpact;
  final List<String> imageUrls;

  DiseaseEntry({
    required this.id,
    required this.scientificName,
    required this.commonName,
    required this.category,
    required this.severity,
    required this.shortDescription,
    required this.detailedDescription,
    required this.symptoms,
    required this.causes,
    required this.controlMethods,
    required this.prevention,
    required this.affectedPlants,
    required this.geographicalDistribution,
    required this.economicImpact,
    required this.imageUrls,
  });
}

class DiseaseMatch {
  final DiseaseEntry disease;
  final double similarity;
  final List<String> matchedSymptoms;

  DiseaseMatch({
    required this.disease,
    required this.similarity,
    required this.matchedSymptoms,
  });
}

enum DiseaseCategory {
  FUNGAL_DISEASE,
  BACTERIAL_DISEASE,
  VIRAL_DISEASE,
  INSECT_PEST,
  NUTRITIONAL_DEFICIENCY,
  ABIOTIC_DISORDER,
}

enum SeverityLevel { LOW, MEDIUM, HIGH, CRITICAL }

extension DiseaseCategoryExtension on DiseaseCategory {
  String get displayName {
    switch (this) {
      case DiseaseCategory.FUNGAL_DISEASE:
        return 'Enfermedades Fúngicas';
      case DiseaseCategory.BACTERIAL_DISEASE:
        return 'Enfermedades Bacterianas';
      case DiseaseCategory.VIRAL_DISEASE:
        return 'Enfermedades Virales';
      case DiseaseCategory.INSECT_PEST:
        return 'Plagas de Insectos';
      case DiseaseCategory.NUTRITIONAL_DEFICIENCY:
        return 'Deficiencias Nutricionales';
      case DiseaseCategory.ABIOTIC_DISORDER:
        return 'Trastornos Abióticos';
    }
  }

  String get icon {
    switch (this) {
      case DiseaseCategory.FUNGAL_DISEASE:
        return '🍄';
      case DiseaseCategory.BACTERIAL_DISEASE:
        return '🦠';
      case DiseaseCategory.VIRAL_DISEASE:
        return '🧬';
      case DiseaseCategory.INSECT_PEST:
        return '🐛';
      case DiseaseCategory.NUTRITIONAL_DEFICIENCY:
        return '🌿';
      case DiseaseCategory.ABIOTIC_DISORDER:
        return '🌡️';
    }
  }
}

extension SeverityLevelExtension on SeverityLevel {
  String get displayName {
    switch (this) {
      case SeverityLevel.LOW:
        return 'Leve';
      case SeverityLevel.MEDIUM:
        return 'Moderada';
      case SeverityLevel.HIGH:
        return 'Alta';
      case SeverityLevel.CRITICAL:
        return 'Crítica';
    }
  }

  String get color {
    switch (this) {
      case SeverityLevel.LOW:
        return 'green';
      case SeverityLevel.MEDIUM:
        return 'yellow';
      case SeverityLevel.HIGH:
        return 'orange';
      case SeverityLevel.CRITICAL:
        return 'red';
    }
  }
}
