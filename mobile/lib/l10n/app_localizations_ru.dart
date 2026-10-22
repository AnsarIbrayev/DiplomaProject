// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Помощник по весу';

  @override
  String get demoBadge => 'Прототип · демо-данные';

  @override
  String get next => 'Далее';

  @override
  String get save => 'Сохранить';

  @override
  String get cancel => 'Отмена';

  @override
  String get close => 'Закрыть';

  @override
  String get add => 'Добавить';

  @override
  String get chooseLanguage => 'Выберите язык';

  @override
  String get welcomeTitle => 'Персональное управление весом';

  @override
  String get welcomeBody =>
      'Приложение находит, какие ваши ежедневные привычки сильнее всего отличаются от рекомендаций здравоохранения, и даёт объяснённые рекомендации по питанию и активности.';

  @override
  String get start => 'Начать';

  @override
  String get consentTitle => 'Информация об исследовании и согласие';

  @override
  String get consentBody =>
      'Приложение — часть университетского исследования. Прежде чем собирать данные, прочитайте главное:';

  @override
  String get consentPoint1 =>
      'Приложение не ставит диагнозы и не заменяет врача.';

  @override
  String get consentPoint2 =>
      'Данные хранятся под псевдонимным ID, ваше имя не попадает в исследовательские данные.';

  @override
  String get consentPoint3 =>
      'Вы можете выйти из исследования в любой момент и попросить удалить данные.';

  @override
  String get consentPoint4 =>
      'Вас могут включить в группу только с дневником или в группу с рекомендациями.';

  @override
  String get consentAgree => 'Я согласен(на) участвовать';

  @override
  String get consentPrototypeNote =>
      'Прототип: введённые данные никуда не сохраняются и не отправляются.';

  @override
  String get screeningTitle => 'Несколько вопросов';

  @override
  String get screeningBody =>
      'Проверим, что приложением безопасно пользоваться без наблюдения врача.';

  @override
  String get ageYears => 'Возраст, лет';

  @override
  String get heightCm => 'Рост, см';

  @override
  String get weightKg => 'Вес, кг';

  @override
  String get waistCm => 'Талия, см';

  @override
  String bmiValue(String bmi) {
    return 'ИМТ: $bmi кг/м²';
  }

  @override
  String get exclusionsTitle => 'Относится ли к вам что-то из этого?';

  @override
  String get exDiabetes => 'Диагностированный диабет';

  @override
  String get exCardio => 'Диагностированное сердечно-сосудистое заболевание';

  @override
  String get exPregnancy => 'Беременность';

  @override
  String get exMedication => 'Сейчас принимаю препараты для снижения веса';

  @override
  String get exParq => '«Да» на любой общий вопрос анкеты PAR-Q+';

  @override
  String get exParqHint =>
      'PAR-Q+ — стандартная анкета перед началом физических нагрузок (eparmedx.com).';

  @override
  String get checkEligibility => 'Проверить';

  @override
  String get eligibleTitle => 'Вы можете пользоваться приложением';

  @override
  String get eligibleBody =>
      'Первые 7 дней — базовая неделя: просто записывайте еду, вес и шаги. Персональные цели начнутся с 8-го дня.';

  @override
  String armAssigned(String arm) {
    return 'Группа исследования: $arm';
  }

  @override
  String get armIntervention => 'с рекомендациями';

  @override
  String get armControl => 'только дневник';

  @override
  String get armRandomNote =>
      'В пилоте группа назначается случайно, и её нельзя изменить.';

  @override
  String get openDemo => 'Открыть демо (14-й день)';

  @override
  String get ineligibleTitle => 'Это приложение вам не подходит';

  @override
  String get ineligibleBody =>
      'Ради вашей безопасности снижение веса в вашей ситуации должно проходить под наблюдением врача. Обратитесь в поликлинику или к семейному врачу. Приложение не будет давать вам рекомендации.';

  @override
  String get ineligibleReasons => 'Причина:';

  @override
  String get reasonAge => 'возраст вне диапазона 18–60 лет';

  @override
  String get reasonBmiLow => 'ИМТ ниже 25,0';

  @override
  String get reasonBmiHigh => 'ИМТ 35,0 или выше';

  @override
  String get reasonDiabetes => 'диабет';

  @override
  String get reasonCardio => 'сердечно-сосудистое заболевание';

  @override
  String get reasonPregnancy => 'беременность';

  @override
  String get reasonMedication => 'препараты для снижения веса';

  @override
  String get reasonParq => 'ответ в PAR-Q+';

  @override
  String get backToStart => 'В начало';

  @override
  String get navToday => 'Сегодня';

  @override
  String get navLog => 'Дневник';

  @override
  String get navFactors => 'Факторы';

  @override
  String get navPlan => 'План';

  @override
  String get navProgress => 'Прогресс';

  @override
  String get navSettings => 'Настройки';

  @override
  String dayOfStudy(int day, int week) {
    return 'День $day · неделя $week';
  }

  @override
  String get energyToday => 'Энергия сегодня';

  @override
  String get stepsToday => 'Шаги сегодня';

  @override
  String ofTarget(String target) {
    return 'из $target';
  }

  @override
  String get kcal => 'ккал';

  @override
  String get steps => 'шагов';

  @override
  String get mg => 'мг';

  @override
  String get g => 'г';

  @override
  String get topFactor => 'Главный фактор этой недели';

  @override
  String get seeAllFactors => 'Все факторы';

  @override
  String get topRecommendation => 'Первая рекомендация';

  @override
  String get openPlan => 'Открыть план';

  @override
  String get checkInDue => 'Пора пройти еженедельный опрос';

  @override
  String get checkInOpen => 'Ответить (1 мин)';

  @override
  String get promptTitle => 'Напоминание об активности (пример)';

  @override
  String get promptBody =>
      'Обычно к этому времени у вас больше шагов. Прогулка 10 минут приблизит вас к цели на сегодня.';

  @override
  String get suspendedBanner =>
      'Рекомендации по активности приостановлены, потому что вы сообщили о проблеме со здоровьем. Обратитесь к врачу.';

  @override
  String get controlTodayNote =>
      'Режим дневника: записывайте еду, вес и шаги. В этой группе исследования рекомендации не показываются.';

  @override
  String get logTitle => 'Еда и вес';

  @override
  String get searchFood => 'Поиск продукта';

  @override
  String get demoFoodNote =>
      'Демо-список продуктов: значения нутриентов приблизительные, только для прототипа.';

  @override
  String get localFood => 'местное';

  @override
  String per100g(String kcal) {
    return '$kcal ккал на 100 г';
  }

  @override
  String get portionGrams => 'Порция, г';

  @override
  String get addToDiary => 'Добавить в дневник';

  @override
  String get aiLogging => 'Опишите приём пищи';

  @override
  String get aiHint => 'например: плов, чай и хлеб';

  @override
  String get aiSimulatedNote =>
      'Прототип: AI-сервис не вызывается. Слова сравниваются со списком продуктов, чтобы показать шаг «проверить перед сохранением».';

  @override
  String get aiPropose => 'Найти продукты';

  @override
  String get aiProposalTitle => 'Проверьте перед сохранением';

  @override
  String get aiConfirm => 'Подтвердить и сохранить';

  @override
  String get aiNothing => 'В списке продуктов ничего не найдено.';

  @override
  String get todayEntries => 'Записано сегодня';

  @override
  String get noEntries => 'Пока ничего не записано';

  @override
  String get logWeight => 'Записать вес и талию';

  @override
  String get weightSaved => 'Сохранено';

  @override
  String entryAdded(String name) {
    return 'Добавлено: $name';
  }

  @override
  String totalToday(String kcal) {
    return 'Итого: $kcal ккал';
  }

  @override
  String get factorsTitle => 'Ваши факторы';

  @override
  String get factorsIntro =>
      'Среднее за последние 7 дней в сравнении с целями из рекомендаций. Чем выше фактор, тем сильнее он отличается от цели.';

  @override
  String get factorEnergy => 'Калорийность питания';

  @override
  String get factorMacros => 'Баланс БЖУ';

  @override
  String get factorCalcium => 'Кальций';

  @override
  String get factorFruitVeg => 'Овощи и фрукты';

  @override
  String get factorSteps => 'Шаги за день';

  @override
  String get factorSedentary => 'Долгое сидение';

  @override
  String get groupDiet => 'Питание';

  @override
  String get groupActivity => 'Физическая активность';

  @override
  String get groupSedentary => 'Сидячий образ жизни';

  @override
  String get valueLabel => 'Ваше значение';

  @override
  String get targetLabel => 'Цель';

  @override
  String get ruleLabel => 'Правило';

  @override
  String get onTarget => 'В норме';

  @override
  String deviationPct(String pct) {
    return 'Отклонение $pct%';
  }

  @override
  String atLeast(String value) {
    return 'не менее $value';
  }

  @override
  String atMost(String value) {
    return 'не более $value';
  }

  @override
  String get perDay => 'в день';

  @override
  String get periodsPerDay => 'раз/день';

  @override
  String get baselineWeekFactors =>
      'Цели по шагам появятся после базовой недели.';

  @override
  String get planTitle => 'Ваш план';

  @override
  String get planIntro =>
      'Рекомендации упорядочены по вашим факторам. Нажмите «Почему?», чтобы увидеть правило за каждой.';

  @override
  String get constraintsTitle => 'Проверки безопасности плана';

  @override
  String get constraintEnergy => 'Цель по калориям не ниже энергии покоя';

  @override
  String get constraintMacros => 'БЖУ в рекомендованных диапазонах';

  @override
  String get constraintCalcium => 'Цель по кальцию не ниже рекомендуемой нормы';

  @override
  String get constraintIntensity =>
      'Активность растёт постепенно от вашего уровня';

  @override
  String get why => 'Почему?';

  @override
  String get macroProtein => 'белки';

  @override
  String get macroFat => 'жиры';

  @override
  String get macroCarbs => 'углеводы';

  @override
  String recReduceEnergyTitle(String target) {
    return 'Ешьте немного меньше: около $target ккал в день';
  }

  @override
  String recReduceEnergyBody(String value) {
    return 'В среднем у вас было $value ккал. Проще всего уменьшить порции самых калорийных блюд.';
  }

  @override
  String recIncreaseEnergyTitle(String target) {
    return 'Не ешьте слишком мало: около $target ккал в день';
  }

  @override
  String recIncreaseEnergyBody(String value) {
    return 'В среднем у вас было $value ккал. Слишком малую калорийность трудно поддерживать, и она может навредить здоровью.';
  }

  @override
  String recMacrosTitle(String nutrient) {
    return 'Сбалансируйте тарелку: $nutrient';
  }

  @override
  String recMacrosBody(String nutrient, String value, String min, String max) {
    return '$nutrient дали $value% энергии; рекомендуемый диапазон — $min–$max%.';
  }

  @override
  String recCalciumTitle(String target) {
    return 'Добавьте кальций: $target мг в день';
  }

  @override
  String recCalciumBody(String value) {
    return 'У вас было около $value мг в день. Кефир, творог или другие молочные продукты 1–2 раза в день закроют большую часть разницы.';
  }

  @override
  String recFruitVegTitle(String target) {
    return 'Не менее $target г овощей и фруктов в день';
  }

  @override
  String recFruitVegBody(String value) {
    return 'У вас было около $value г в день. Добавьте овощной салат к обеду и фрукт на перекус.';
  }

  @override
  String recStepsTitle(String target) {
    return 'Цель по шагам на эту неделю: $target';
  }

  @override
  String recStepsBody(String baseline, String value) {
    return 'Ваш базовый уровень — $baseline шагов; цель немного растёт каждую неделю. На прошлой неделе в среднем было $value.';
  }

  @override
  String get recResistanceTitle => 'Две силовые тренировки в неделю';

  @override
  String get recResistanceBody =>
      'Например, во вторник и пятницу: приседания, отжимания от стены, тяга резинки. Начните с лёгкой нагрузки.';

  @override
  String get recSittingTitle => 'Прерывайте долгое сидение';

  @override
  String recSittingBody(String value) {
    return 'У вас было около $value периодов сидения по часу и дольше в день. Каждый час вставайте и ходите 2–3 минуты.';
  }

  @override
  String get whyTitle => 'Почему эта рекомендация';

  @override
  String get whyReason => 'Причина';

  @override
  String get whyRule => 'Правило';

  @override
  String get whyInputs => 'Ваши данные, которые использованы';

  @override
  String get whySource => 'Источник доказательств';

  @override
  String get whyReasonEnergy =>
      'Ваша средняя калорийность вне целевого диапазона, рассчитанного по весу, росту, возрасту и активности.';

  @override
  String get whyReasonMacros =>
      'Доля энергии от одного из макронутриентов вне диапазона, рекомендованного для взрослых.';

  @override
  String get whyReasonCalcium =>
      'Потребление кальция ниже рекомендуемой суточной нормы для вашего возраста и пола.';

  @override
  String get whyReasonFruitVeg =>
      'Вы едите меньше овощей и фруктов, чем рекомендуемый минимум.';

  @override
  String get whyReasonSteps =>
      'Ваши шаги ниже цели этой недели, которая рассчитана от вашей базовой недели.';

  @override
  String get whyReasonResistance =>
      'Рекомендации советуют упражнения на укрепление мышц не менее двух дней в неделю.';

  @override
  String get whyReasonSitting =>
      'У вас больше долгих периодов сидения, чем предел в плане.';

  @override
  String ruleVersion(String id, String version) {
    return '$id, версия $version';
  }

  @override
  String get statusGuideline => 'основано на рекомендации';

  @override
  String get statusProject => 'решение проекта';

  @override
  String get statusTeamSet => 'содержит временные значения, заданные командой';

  @override
  String get inWeight => 'Вес, кг';

  @override
  String get inHeight => 'Рост, см';

  @override
  String get inAge => 'Возраст, лет';

  @override
  String get inPal => 'Уровень активности (PAL)';

  @override
  String get inIntakeKcal => 'Среднее потребление, ккал/день';

  @override
  String get inTargetKcal => 'Цель, ккал/день';

  @override
  String get inSharePct => 'Доля энергии, %';

  @override
  String get inMinPct => 'Нижняя граница, %';

  @override
  String get inMaxPct => 'Верхняя граница, %';

  @override
  String get inCalciumMg => 'Кальций в среднем, мг/день';

  @override
  String get inTargetMg => 'Рекомендуемо, мг/день';

  @override
  String get inFruitVegG => 'Овощи и фрукты в среднем, г/день';

  @override
  String get inTargetG => 'Рекомендуемый минимум, г/день';

  @override
  String get inBaselineSteps => 'Базовый уровень, шагов/день';

  @override
  String get inWeek => 'Неделя исследования';

  @override
  String get inMeanSteps => 'Последние 7 дней, шагов/день';

  @override
  String get inTargetSteps => 'Цель, шагов/день';

  @override
  String get inSessionsPerWeek => 'Тренировок в неделю';

  @override
  String get inSittingPeriods => 'Долгих периодов сидения в день';

  @override
  String get inMaxPeriods => 'Предел в день';

  @override
  String get progressTitle => 'Прогресс';

  @override
  String get weightTrend => 'Вес, кг';

  @override
  String weightChange(String value) {
    return 'Изменение с 1-го дня: $value кг';
  }

  @override
  String get stepsChart => 'Шаги по дням';

  @override
  String get intakeChart => 'Калории по дням, ккал';

  @override
  String get targetLine => 'цель';

  @override
  String get baselineLabel => 'базовая неделя';

  @override
  String get checkInTitle => 'Еженедельный опрос';

  @override
  String get checkInQ1 =>
      'За последнюю неделю была ли у вас травма, боль, головокружение, боль в груди или другая проблема со здоровьем?';

  @override
  String get checkInQ2 =>
      'Изменилось ли что-то: беременность, новый диагноз диабета или болезни сердца, новые препараты для снижения веса?';

  @override
  String get yes => 'Да';

  @override
  String get no => 'Нет';

  @override
  String get submit => 'Отправить';

  @override
  String get checkInThanks => 'Спасибо! До следующей недели.';

  @override
  String get referralTitle => 'Обратитесь к врачу';

  @override
  String get referralBody =>
      'Мы приостановили рекомендации и напоминания по активности. Прежде чем продолжить, обратитесь в поликлинику или к семейному врачу.';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get language => 'Язык';

  @override
  String get studyArm => 'Группа исследования (демо-переключатель)';

  @override
  String get armDemoNote =>
      'Только в прототипе: позволяет сравнить две версии приложения. В пилоте группа назначается случайно.';

  @override
  String get activeHours => 'Активные часы для напоминаний';

  @override
  String get activeHoursValue => '09:00–21:00';

  @override
  String get ruleBase => 'База правил (прототип)';

  @override
  String get restartDemo => 'Начать демо заново';

  @override
  String get aboutPrototype => 'О прототипе';

  @override
  String get aboutBody =>
      'Кликабельный прототип дипломного проекта (Astana IT University). Профиль и записи — синтетические демо-данные. Значения правил с пометкой «задано командой» временные, до утверждения базы правил.';
}
