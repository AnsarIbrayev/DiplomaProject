// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kazakh (`kk`).
class AppLocalizationsKk extends AppLocalizations {
  AppLocalizationsKk([String locale = 'kk']) : super(locale);

  @override
  String get appTitle => 'Салмақ көмекшісі';

  @override
  String get demoBadge => 'Прототип · демо-деректер';

  @override
  String get next => 'Әрі қарай';

  @override
  String get save => 'Сақтау';

  @override
  String get cancel => 'Болдырмау';

  @override
  String get close => 'Жабу';

  @override
  String get add => 'Қосу';

  @override
  String get chooseLanguage => 'Тілді таңдаңыз';

  @override
  String get welcomeTitle => 'Салмақты жеке басқару';

  @override
  String get welcomeBody =>
      'Қосымша күнделікті әдеттеріңіздің қайсысы денсаулық сақтау ұсынымдарынан көбірек ауытқитынын анықтап, тамақтану мен белсенділік бойынша түсіндірілген ұсынымдар береді.';

  @override
  String get start => 'Бастау';

  @override
  String get consentTitle => 'Зерттеу туралы ақпарат және келісім';

  @override
  String get consentBody =>
      'Бұл қосымша — университеттік зерттеудің бөлігі. Деректер жиналмас бұрын негізгі тармақтарды оқыңыз:';

  @override
  String get consentPoint1 =>
      'Қосымша диагноз қоймайды және дәрігерді алмастырмайды.';

  @override
  String get consentPoint2 =>
      'Деректеріңіз бүркеншік ID арқылы сақталады, атыңыз зерттеу деректеріне енбейді.';

  @override
  String get consentPoint3 =>
      'Кез келген уақытта зерттеуден шығып, деректеріңізді жоюды сұрай аласыз.';

  @override
  String get consentPoint4 =>
      'Сізді тек күнделік жүргізетін топқа немесе ұсыным алатын топқа қосуы мүмкін.';

  @override
  String get consentAgree => 'Қатысуға келісемін';

  @override
  String get consentPrototypeNote =>
      'Прототип: енгізілген деректер еш жерде сақталмайды және жіберілмейді.';

  @override
  String get screeningTitle => 'Бірнеше сұрақ';

  @override
  String get screeningBody =>
      'Қосымшаны дәрігердің бақылауынсыз қолдану сізге қауіпсіз екенін тексереміз.';

  @override
  String get ageYears => 'Жасы, жыл';

  @override
  String get heightCm => 'Бойы, см';

  @override
  String get weightKg => 'Салмағы, кг';

  @override
  String get waistCm => 'Бел шеңбері, см';

  @override
  String bmiValue(String bmi) {
    return 'ДСИ: $bmi кг/м²';
  }

  @override
  String get exclusionsTitle => 'Мыналардың біреуі сізге қатысты ма?';

  @override
  String get exDiabetes => 'Анықталған қант диабеті';

  @override
  String get exCardio => 'Анықталған жүрек-қантамыр ауруы';

  @override
  String get exPregnancy => 'Жүктілік';

  @override
  String get exMedication => 'Қазір салмақ азайтуға арналған дәрі қабылдаймын';

  @override
  String get exParq => 'PAR-Q+ сауалнамасының кез келген жалпы сұрағына «Иә»';

  @override
  String get exParqHint =>
      'PAR-Q+ — дене жүктемесін бастар алдындағы стандартты сауалнама (eparmedx.com).';

  @override
  String get checkEligibility => 'Тексеру';

  @override
  String get eligibleTitle => 'Қосымшаны пайдалана аласыз';

  @override
  String get eligibleBody =>
      'Алғашқы 7 күн — базалық апта: тек тамақты, салмақты және қадамдарды жазып отырыңыз. Жеке мақсаттар 8-күннен басталады.';

  @override
  String armAssigned(String arm) {
    return 'Зерттеу тобы: $arm';
  }

  @override
  String get armIntervention => 'ұсыныммен';

  @override
  String get armControl => 'тек күнделік';

  @override
  String get armRandomNote =>
      'Пилотта топ кездейсоқ тағайындалады және оны өзгерту мүмкін емес.';

  @override
  String get openDemo => 'Демоны ашу (14-күн)';

  @override
  String get ineligibleTitle => 'Бұл қосымша сізге сәйкес келмейді';

  @override
  String get ineligibleBody =>
      'Қауіпсіздігіңіз үшін сіздің жағдайыңызда салмақ азайту дәрігердің бақылауымен жүруі керек. Емханаға немесе отбасылық дәрігерге жүгініңіз. Қосымша сізге ұсынымдар бермейді.';

  @override
  String get ineligibleReasons => 'Себебі:';

  @override
  String get reasonAge => 'жасы 18–60 жас аралығынан тыс';

  @override
  String get reasonBmiLow => 'ДСИ 25,0-ден төмен';

  @override
  String get reasonBmiHigh => 'ДСИ 35,0 немесе одан жоғары';

  @override
  String get reasonDiabetes => 'қант диабеті';

  @override
  String get reasonCardio => 'жүрек-қантамыр ауруы';

  @override
  String get reasonPregnancy => 'жүктілік';

  @override
  String get reasonMedication => 'салмақ азайтатын дәрі';

  @override
  String get reasonParq => 'PAR-Q+ жауабы';

  @override
  String get backToStart => 'Басына оралу';

  @override
  String get navToday => 'Бүгін';

  @override
  String get navLog => 'Күнделік';

  @override
  String get navFactors => 'Факторлар';

  @override
  String get navPlan => 'Жоспар';

  @override
  String get navProgress => 'Нәтиже';

  @override
  String get navSettings => 'Баптаулар';

  @override
  String dayOfStudy(int day, int week) {
    return '$day-күн · $week-апта';
  }

  @override
  String get energyToday => 'Бүгінгі энергия';

  @override
  String get stepsToday => 'Бүгінгі қадам';

  @override
  String ofTarget(String target) {
    return '$target ішінен';
  }

  @override
  String get kcal => 'ккал';

  @override
  String get steps => 'қадам';

  @override
  String get mg => 'мг';

  @override
  String get g => 'г';

  @override
  String get topFactor => 'Осы аптаның басты факторы';

  @override
  String get seeAllFactors => 'Барлық факторлар';

  @override
  String get topRecommendation => 'Бірінші ұсыным';

  @override
  String get openPlan => 'Жоспарды ашу';

  @override
  String get checkInDue => 'Апталық сауалнаманы толтыру уақыты келді';

  @override
  String get checkInOpen => 'Жауап беру (1 мин)';

  @override
  String get promptTitle => 'Белсенділік туралы еске салу (мысал)';

  @override
  String get promptBody =>
      'Әдетте осы уақытқа дейін қадамыңыз көбірек болады. 10 минуттық серуен бүгінгі мақсатқа жақындатады.';

  @override
  String get suspendedBanner =>
      'Денсаулығыңызға қатысты мәселе туралы хабарлағандықтан, белсенділік ұсынымдары тоқтатылды. Дәрігерге қаралыңыз.';

  @override
  String get controlTodayNote =>
      'Күнделік режимі: тамақты, салмақты және қадамдарды жазыңыз. Бұл зерттеу тобында ұсынымдар көрсетілмейді.';

  @override
  String get logTitle => 'Тамақ және салмақ';

  @override
  String get searchFood => 'Өнімді іздеу';

  @override
  String get demoFoodNote =>
      'Өнімдердің демо-тізімі: қоректік мәндер шамамен берілген, тек прототипке арналған.';

  @override
  String get localFood => 'жергілікті';

  @override
  String per100g(String kcal) {
    return '100 г-да $kcal ккал';
  }

  @override
  String get portionGrams => 'Порция, г';

  @override
  String get addToDiary => 'Күнделікке қосу';

  @override
  String get aiLogging => 'Тамақты сипаттаңыз';

  @override
  String get aiHint => 'мысалы: палау, шай және нан';

  @override
  String get aiSimulatedNote =>
      'Прототип: AI-сервис шақырылмайды. Сөздер өнімдер тізімімен салыстырылып, «сақтамас бұрын тексеру» қадамы көрсетіледі.';

  @override
  String get aiPropose => 'Өнімдерді табу';

  @override
  String get aiProposalTitle => 'Сақтамас бұрын тексеріңіз';

  @override
  String get aiConfirm => 'Растау және сақтау';

  @override
  String get aiNothing => 'Өнімдер тізімінен ештеңе табылмады.';

  @override
  String get todayEntries => 'Бүгін жазылғаны';

  @override
  String get noEntries => 'Әзірге ештеңе жазылмаған';

  @override
  String get logWeight => 'Салмақ пен бел шеңберін жазу';

  @override
  String get weightSaved => 'Сақталды';

  @override
  String entryAdded(String name) {
    return 'Қосылды: $name';
  }

  @override
  String totalToday(String kcal) {
    return 'Барлығы: $kcal ккал';
  }

  @override
  String get factorsTitle => 'Сіздің факторларыңыз';

  @override
  String get factorsIntro =>
      'Соңғы 7 күннің орташа мәні ұсынымдардағы мақсаттармен салыстырылады. Фактор неғұрлым жоғары болса, мақсаттан соғұрлым көп ауытқиды.';

  @override
  String get factorEnergy => 'Тамақтың калориясы';

  @override
  String get factorMacros => 'Ақуыз, май, көмірсу теңгерімі';

  @override
  String get factorCalcium => 'Кальций';

  @override
  String get factorFruitVeg => 'Көкөніс пен жеміс';

  @override
  String get factorSteps => 'Күндік қадам';

  @override
  String get factorSedentary => 'Ұзақ отыру';

  @override
  String get groupDiet => 'Тамақтану';

  @override
  String get groupActivity => 'Дене белсенділігі';

  @override
  String get groupSedentary => 'Отырықшы өмір салты';

  @override
  String get valueLabel => 'Сіздің мәніңіз';

  @override
  String get targetLabel => 'Мақсат';

  @override
  String get ruleLabel => 'Ереже';

  @override
  String get onTarget => 'Қалыпты';

  @override
  String deviationPct(String pct) {
    return 'Ауытқу $pct%';
  }

  @override
  String atLeast(String value) {
    return 'кемінде $value';
  }

  @override
  String atMost(String value) {
    return 'ең көбі $value';
  }

  @override
  String get perDay => 'күніне';

  @override
  String get periodsPerDay => 'рет/күн';

  @override
  String get baselineWeekFactors =>
      'Қадам бойынша мақсаттар базалық аптадан кейін пайда болады.';

  @override
  String get planTitle => 'Сіздің жоспарыңыз';

  @override
  String get planIntro =>
      'Ұсынымдар факторларыңыз бойынша реттелген. Әр ұсынымның артындағы ережені көру үшін «Неге?» түймесін басыңыз.';

  @override
  String get constraintsTitle => 'Жоспардың қауіпсіздік тексерістері';

  @override
  String get constraintEnergy =>
      'Калория мақсаты тыныштық энергиясынан төмен емес';

  @override
  String get constraintMacros => 'Ақуыз, май, көмірсу ұсынылған аралықта';

  @override
  String get constraintCalcium =>
      'Кальций мақсаты ұсынылған нормадан төмен емес';

  @override
  String get constraintIntensity =>
      'Белсенділік өз деңгейіңізден біртіндеп артады';

  @override
  String get why => 'Неге?';

  @override
  String get macroProtein => 'ақуыз';

  @override
  String get macroFat => 'май';

  @override
  String get macroCarbs => 'көмірсу';

  @override
  String recReduceEnergyTitle(String target) {
    return 'Сәл азырақ жеңіз: күніне шамамен $target ккал';
  }

  @override
  String recReduceEnergyBody(String value) {
    return 'Орта есеппен $value ккал болды. Ең калориялы тағамдардың порциясын азайту ең оңай жол.';
  }

  @override
  String recIncreaseEnergyTitle(String target) {
    return 'Тым аз жемеңіз: күніне шамамен $target ккал';
  }

  @override
  String recIncreaseEnergyBody(String value) {
    return 'Орта есеппен $value ккал болды. Тым аз калорияны ұстап тұру қиын және денсаулыққа зиян болуы мүмкін.';
  }

  @override
  String recMacrosTitle(String nutrient) {
    return 'Тәрелкені теңестіріңіз: $nutrient';
  }

  @override
  String recMacrosBody(String nutrient, String value, String min, String max) {
    return '$nutrient энергияның $value% берді; ұсынылған аралық — $min–$max%.';
  }

  @override
  String recCalciumTitle(String target) {
    return 'Кальций қосыңыз: күніне $target мг';
  }

  @override
  String recCalciumBody(String value) {
    return 'Күніне шамамен $value мг болды. Күніне 1–2 рет айран, сүзбе немесе басқа сүт өнімдері айырмашылықтың көп бөлігін жабады.';
  }

  @override
  String recFruitVegTitle(String target) {
    return 'Күніне кемінде $target г көкөніс пен жеміс';
  }

  @override
  String recFruitVegBody(String value) {
    return 'Күніне шамамен $value г болды. Түскі асқа көкөніс салатын, тіскебасарға жеміс қосыңыз.';
  }

  @override
  String recStepsTitle(String target) {
    return 'Осы аптаның қадам мақсаты: $target';
  }

  @override
  String recStepsBody(String baseline, String value) {
    return 'Базалық деңгейіңіз — $baseline қадам; мақсат әр апта сайын сәл артады. Өткен аптада орта есеппен $value болды.';
  }

  @override
  String get recResistanceTitle => 'Аптасына екі күш жаттығуы';

  @override
  String get recResistanceBody =>
      'Мысалы, сейсенбі мен жұма: отырып-тұру, қабырғадан итерілу, резеңке таспамен тарту. Жеңіл жүктемеден бастаңыз.';

  @override
  String get recSittingTitle => 'Ұзақ отыруды үзіп отырыңыз';

  @override
  String recSittingBody(String value) {
    return 'Күніне бір сағат және одан ұзақ отырған шамамен $value кезең болды. Әр сағат сайын тұрып, 2–3 минут жүріңіз.';
  }

  @override
  String get whyTitle => 'Бұл ұсыным неге берілді';

  @override
  String get whyReason => 'Себебі';

  @override
  String get whyRule => 'Ереже';

  @override
  String get whyInputs => 'Пайдаланылған деректеріңіз';

  @override
  String get whySource => 'Дәлел көзі';

  @override
  String get whyReasonEnergy =>
      'Орташа калорияңыз салмағыңыз, бойыңыз, жасыңыз және белсенділігіңіз бойынша есептелген мақсатты аралықтан тыс.';

  @override
  String get whyReasonMacros =>
      'Бір макронутриенттен алынатын энергия үлесі ересектерге ұсынылған аралықтан тыс.';

  @override
  String get whyReasonCalcium =>
      'Кальций мөлшері жасыңыз бен жынысыңызға ұсынылған тәуліктік нормадан төмен.';

  @override
  String get whyReasonFruitVeg =>
      'Көкөніс пен жемісті ұсынылған ең аз мөлшерден кем жейсіз.';

  @override
  String get whyReasonSteps =>
      'Қадамыңыз осы аптаның мақсатынан төмен; мақсат өзіңіздің базалық аптаңыздан есептеледі.';

  @override
  String get whyReasonResistance =>
      'Ұсынымдар бойынша бұлшықетті нығайтатын жаттығуларды аптасына кемінде екі күн жасау керек.';

  @override
  String get whyReasonSitting => 'Ұзақ отыру кезеңдері жоспардағы шектен көп.';

  @override
  String ruleVersion(String id, String version) {
    return '$id, $version нұсқа';
  }

  @override
  String get statusGuideline => 'ұсынымға негізделген';

  @override
  String get statusProject => 'жоба шешімі';

  @override
  String get statusTeamSet => 'команда белгілеген уақытша мәндер бар';

  @override
  String get inWeight => 'Салмағы, кг';

  @override
  String get inHeight => 'Бойы, см';

  @override
  String get inAge => 'Жасы, жыл';

  @override
  String get inPal => 'Белсенділік деңгейі (PAL)';

  @override
  String get inIntakeKcal => 'Орташа тұтыну, ккал/күн';

  @override
  String get inTargetKcal => 'Мақсат, ккал/күн';

  @override
  String get inSharePct => 'Энергия үлесі, %';

  @override
  String get inMinPct => 'Төменгі шек, %';

  @override
  String get inMaxPct => 'Жоғарғы шек, %';

  @override
  String get inCalciumMg => 'Орташа кальций, мг/күн';

  @override
  String get inTargetMg => 'Ұсынылғаны, мг/күн';

  @override
  String get inFruitVegG => 'Орташа көкөніс пен жеміс, г/күн';

  @override
  String get inTargetG => 'Ұсынылған ең аз мөлшер, г/күн';

  @override
  String get inBaselineSteps => 'Базалық деңгей, қадам/күн';

  @override
  String get inWeek => 'Зерттеу аптасы';

  @override
  String get inMeanSteps => 'Соңғы 7 күн, қадам/күн';

  @override
  String get inTargetSteps => 'Мақсат, қадам/күн';

  @override
  String get inSessionsPerWeek => 'Аптасына жаттығу саны';

  @override
  String get inSittingPeriods => 'Күніне ұзақ отыру кезеңдері';

  @override
  String get inMaxPeriods => 'Күндік шек';

  @override
  String get progressTitle => 'Нәтиже';

  @override
  String get weightTrend => 'Салмақ, кг';

  @override
  String weightChange(String value) {
    return '1-күннен бергі өзгеріс: $value кг';
  }

  @override
  String get stepsChart => 'Күндік қадам';

  @override
  String get intakeChart => 'Күндік калория, ккал';

  @override
  String get targetLine => 'мақсат';

  @override
  String get baselineLabel => 'базалық апта';

  @override
  String get checkInTitle => 'Апталық сауалнама';

  @override
  String get checkInQ1 =>
      'Соңғы аптада жарақат, ауырсыну, бас айналу, кеуде тұсының ауыруы немесе денсаулыққа қатысты басқа мәселе болды ма?';

  @override
  String get checkInQ2 =>
      'Бірдеңе өзгерді ме: жүктілік, қант диабеті немесе жүрек ауруының жаңа диагнозы, салмақ азайтатын жаңа дәрі?';

  @override
  String get yes => 'Иә';

  @override
  String get no => 'Жоқ';

  @override
  String get submit => 'Жіберу';

  @override
  String get checkInThanks => 'Рақмет! Келесі аптада кездескенше.';

  @override
  String get referralTitle => 'Дәрігерге қаралыңыз';

  @override
  String get referralBody =>
      'Белсенділік бойынша ұсынымдар мен еске салуларды тоқтаттық. Жалғастырмас бұрын емханаға немесе отбасылық дәрігерге жүгініңіз.';

  @override
  String get settingsTitle => 'Баптаулар';

  @override
  String get language => 'Тіл';

  @override
  String get studyArm => 'Зерттеу тобы (демо-ауыстырғыш)';

  @override
  String get armDemoNote =>
      'Тек прототипте: қосымшаның екі нұсқасын салыстыруға мүмкіндік береді. Пилотта топ кездейсоқ тағайындалады.';

  @override
  String get activeHours => 'Еске салуларға арналған белсенді сағаттар';

  @override
  String get activeHoursValue => '09:00–21:00';

  @override
  String get ruleBase => 'Ережелер базасы (прототип)';

  @override
  String get restartDemo => 'Демоны қайта бастау';

  @override
  String get aboutPrototype => 'Прототип туралы';

  @override
  String get aboutBody =>
      'Дипломдық жобаның интерактивті прототипі (Astana IT University). Профиль мен жазбалар — синтетикалық демо-деректер. «Команда белгілеген» деп белгіленген ереже мәндері ережелер базасы бекітілгенге дейін уақытша.';
}
