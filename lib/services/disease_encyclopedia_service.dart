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

      DiseaseEntry(
        id: 'deficiencia_hierro',
        scientificName: 'Iron deficiency',
        commonName: 'Clorosis Férrica',
        category: DiseaseCategory.NUTRITIONAL_DEFICIENCY,
        severity: SeverityLevel.MEDIUM,
        shortDescription:
            'Deficiencia que causa clorosis intervenal característica',
        detailedDescription: '''
La deficiencia de hierro causa clorosis intervenal, donde las hojas se amarillean pero las venas permanecen verdes.

PECULIARIDAD: Común en suelos calcáreos donde el hierro se vuelve insoluble.
        ''',
        symptoms: [
          'Clorosis intervenal en hojas jóvenes',
          'Venas permanecen verdes',
          'Hojas pueden volverse blancas',
          'Crecimiento retardado',
          'Muerte de brotes en casos severos',
          'Frutos pequeños y pálidos',
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
        affectedPlants: ['Frutales', 'Vid', 'Ornamentales', 'Hortalizas'],
        geographicalDistribution: 'Zonas con suelos calcáreos',
        economicImpact: 'Pérdidas 20-60% en frutales',
        imageUrls: [
          'assets/diseases/clorosis_ferrica_1.jpg',
          'assets/diseases/clorosis_ferrica_2.jpg',
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
