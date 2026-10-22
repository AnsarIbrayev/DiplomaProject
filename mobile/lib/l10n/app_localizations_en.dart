// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Weight Assistant';

  @override
  String get demoBadge => 'Prototype · demo data';

  @override
  String get next => 'Next';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get close => 'Close';

  @override
  String get add => 'Add';

  @override
  String get chooseLanguage => 'Choose the language';

  @override
  String get welcomeTitle => 'Personal weight management';

  @override
  String get welcomeBody =>
      'The app finds which of your daily habits differ most from health guidelines and gives explained nutrition and activity recommendations.';

  @override
  String get start => 'Start';

  @override
  String get consentTitle => 'Study information and consent';

  @override
  String get consentBody =>
      'This app is part of a university research project. Before any data are collected, please read the main points:';

  @override
  String get consentPoint1 =>
      'The app does not diagnose diseases and does not replace a doctor.';

  @override
  String get consentPoint2 =>
      'Your data are stored under a pseudonymous ID; your name is never included in research data.';

  @override
  String get consentPoint3 =>
      'You can withdraw at any time and ask to delete your data.';

  @override
  String get consentPoint4 =>
      'You may be assigned to a group with tracking only or with recommendations.';

  @override
  String get consentAgree => 'I agree to take part';

  @override
  String get consentPrototypeNote =>
      'Prototype: nothing you enter is stored or sent anywhere.';

  @override
  String get screeningTitle => 'A few questions';

  @override
  String get screeningBody =>
      'We check that the app is safe for you to use without medical supervision.';

  @override
  String get ageYears => 'Age, years';

  @override
  String get heightCm => 'Height, cm';

  @override
  String get weightKg => 'Weight, kg';

  @override
  String get waistCm => 'Waist, cm';

  @override
  String bmiValue(String bmi) {
    return 'BMI: $bmi kg/m²';
  }

  @override
  String get exclusionsTitle => 'Does any of this apply to you?';

  @override
  String get exDiabetes => 'Diagnosed diabetes';

  @override
  String get exCardio => 'Diagnosed cardiovascular disease';

  @override
  String get exPregnancy => 'Pregnancy';

  @override
  String get exMedication => 'Currently taking weight-loss medication';

  @override
  String get exParq => '\"Yes\" to any PAR-Q+ general health question';

  @override
  String get exParqHint =>
      'PAR-Q+ is a standard pre-exercise questionnaire (eparmedx.com).';

  @override
  String get checkEligibility => 'Check';

  @override
  String get eligibleTitle => 'You can use the app';

  @override
  String get eligibleBody =>
      'The first 7 days are a baseline week: just log your food, weight and steps. Personal targets start on day 8.';

  @override
  String armAssigned(String arm) {
    return 'Study group: $arm';
  }

  @override
  String get armIntervention => 'recommendations';

  @override
  String get armControl => 'tracking only';

  @override
  String get armRandomNote =>
      'In the pilot the group is assigned at random and cannot be changed.';

  @override
  String get openDemo => 'Open the demo (day 14)';

  @override
  String get ineligibleTitle => 'This app is not suitable for you';

  @override
  String get ineligibleBody =>
      'For your safety, weight management in your situation should be supervised by a doctor. Please contact your polyclinic or a family doctor. The app will not give you recommendations.';

  @override
  String get ineligibleReasons => 'Reason:';

  @override
  String get reasonAge => 'age outside 18–60 years';

  @override
  String get reasonBmiLow => 'BMI below 25.0';

  @override
  String get reasonBmiHigh => 'BMI of 35.0 or higher';

  @override
  String get reasonDiabetes => 'diabetes';

  @override
  String get reasonCardio => 'cardiovascular disease';

  @override
  String get reasonPregnancy => 'pregnancy';

  @override
  String get reasonMedication => 'weight-loss medication';

  @override
  String get reasonParq => 'PAR-Q+ answer';

  @override
  String get backToStart => 'Back to start';

  @override
  String get navToday => 'Today';

  @override
  String get navLog => 'Log';

  @override
  String get navFactors => 'Factors';

  @override
  String get navPlan => 'Plan';

  @override
  String get navProgress => 'Progress';

  @override
  String get navSettings => 'Settings';

  @override
  String dayOfStudy(int day, int week) {
    return 'Day $day · week $week';
  }

  @override
  String get energyToday => 'Energy today';

  @override
  String get stepsToday => 'Steps today';

  @override
  String ofTarget(String target) {
    return 'of $target';
  }

  @override
  String get kcal => 'kcal';

  @override
  String get steps => 'steps';

  @override
  String get mg => 'mg';

  @override
  String get g => 'g';

  @override
  String get topFactor => 'Your main factor this week';

  @override
  String get seeAllFactors => 'All factors';

  @override
  String get topRecommendation => 'First recommendation';

  @override
  String get openPlan => 'Open the plan';

  @override
  String get checkInDue => 'Weekly check-in is due';

  @override
  String get checkInOpen => 'Answer (1 min)';

  @override
  String get promptTitle => 'Activity prompt (example)';

  @override
  String get promptBody =>
      'By now you usually have more steps. A 10-minute walk would bring you closer to today\'s target.';

  @override
  String get suspendedBanner =>
      'Activity recommendations are paused because you reported a health problem. Please see a doctor.';

  @override
  String get controlTodayNote =>
      'Tracking mode: log your food, weight and steps. Recommendations are not shown in this study group.';

  @override
  String get logTitle => 'Food and weight';

  @override
  String get searchFood => 'Search food';

  @override
  String get demoFoodNote =>
      'Demo food list: nutrient values are approximate and only for the prototype.';

  @override
  String get localFood => 'local';

  @override
  String per100g(String kcal) {
    return '$kcal kcal per 100 g';
  }

  @override
  String get portionGrams => 'Portion, g';

  @override
  String get addToDiary => 'Add to diary';

  @override
  String get aiLogging => 'Describe a meal';

  @override
  String get aiHint => 'e.g. plov, tea and bread';

  @override
  String get aiSimulatedNote =>
      'Prototype: no AI service is called. Words are matched against the food list to show the confirm-before-save step.';

  @override
  String get aiPropose => 'Find foods';

  @override
  String get aiProposalTitle => 'Check before saving';

  @override
  String get aiConfirm => 'Confirm and save';

  @override
  String get aiNothing => 'Nothing found in the food list.';

  @override
  String get todayEntries => 'Logged today';

  @override
  String get noEntries => 'Nothing logged yet';

  @override
  String get logWeight => 'Log weight and waist';

  @override
  String get weightSaved => 'Saved';

  @override
  String entryAdded(String name) {
    return 'Added: $name';
  }

  @override
  String totalToday(String kcal) {
    return 'Total: $kcal kcal';
  }

  @override
  String get factorsTitle => 'Your factors';

  @override
  String get factorsIntro =>
      'Average of the last 7 days compared with guideline targets. The higher a factor, the more it differs from its target.';

  @override
  String get factorEnergy => 'Energy intake';

  @override
  String get factorMacros => 'Macronutrient balance';

  @override
  String get factorCalcium => 'Calcium';

  @override
  String get factorFruitVeg => 'Fruit and vegetables';

  @override
  String get factorSteps => 'Daily steps';

  @override
  String get factorSedentary => 'Prolonged sitting';

  @override
  String get groupDiet => 'Diet';

  @override
  String get groupActivity => 'Physical activity';

  @override
  String get groupSedentary => 'Sedentary behaviour';

  @override
  String get valueLabel => 'Your value';

  @override
  String get targetLabel => 'Target';

  @override
  String get ruleLabel => 'Rule';

  @override
  String get onTarget => 'On target';

  @override
  String deviationPct(String pct) {
    return 'Deviation $pct%';
  }

  @override
  String atLeast(String value) {
    return 'at least $value';
  }

  @override
  String atMost(String value) {
    return 'at most $value';
  }

  @override
  String get perDay => 'per day';

  @override
  String get periodsPerDay => 'periods/day';

  @override
  String get baselineWeekFactors =>
      'Step targets start after the baseline week.';

  @override
  String get planTitle => 'Your plan';

  @override
  String get planIntro =>
      'Recommendations are ordered by your factors. Tap \"Why?\" to see the rule behind each one.';

  @override
  String get constraintsTitle => 'Safety checks of the plan';

  @override
  String get constraintEnergy => 'Energy target not below resting energy';

  @override
  String get constraintMacros => 'Macronutrients within guideline ranges';

  @override
  String get constraintCalcium =>
      'Calcium target not below the recommended intake';

  @override
  String get constraintIntensity =>
      'Activity raised gradually from your own baseline';

  @override
  String get why => 'Why?';

  @override
  String get macroProtein => 'protein';

  @override
  String get macroFat => 'fat';

  @override
  String get macroCarbs => 'carbohydrates';

  @override
  String recReduceEnergyTitle(String target) {
    return 'Eat a little less: about $target kcal a day';
  }

  @override
  String recReduceEnergyBody(String value) {
    return 'Your average was $value kcal. Smaller portions of the most energy-dense dishes are the easiest change.';
  }

  @override
  String recIncreaseEnergyTitle(String target) {
    return 'Do not eat too little: about $target kcal a day';
  }

  @override
  String recIncreaseEnergyBody(String value) {
    return 'Your average was $value kcal. Eating too little is hard to keep up and can harm health.';
  }

  @override
  String recMacrosTitle(String nutrient) {
    return 'Balance your plate: $nutrient';
  }

  @override
  String recMacrosBody(String nutrient, String value, String min, String max) {
    return '$nutrient gave $value% of your energy; the recommended range is $min–$max%.';
  }

  @override
  String recCalciumTitle(String target) {
    return 'Add calcium: $target mg a day';
  }

  @override
  String recCalciumBody(String value) {
    return 'You had about $value mg a day. Kefir, cottage cheese or other dairy products once or twice a day close most of the gap.';
  }

  @override
  String recFruitVegTitle(String target) {
    return 'At least $target g of fruit and vegetables a day';
  }

  @override
  String recFruitVegBody(String value) {
    return 'You had about $value g a day. Add a vegetable salad to lunch and a fruit as a snack.';
  }

  @override
  String recStepsTitle(String target) {
    return 'Step target this week: $target';
  }

  @override
  String recStepsBody(String baseline, String value) {
    return 'Your baseline is $baseline steps; the target rises a little each week. Last week you averaged $value.';
  }

  @override
  String get recResistanceTitle => 'Two strength sessions a week';

  @override
  String get recResistanceBody =>
      'For example, Tuesday and Friday: squats, push-ups against a wall, resistance band rows. Start easy.';

  @override
  String get recSittingTitle => 'Break up long sitting';

  @override
  String recSittingBody(String value) {
    return 'You had about $value periods of sitting for an hour or more a day. Stand up and walk for 2–3 minutes every hour.';
  }

  @override
  String get whyTitle => 'Why this recommendation';

  @override
  String get whyReason => 'Reason';

  @override
  String get whyRule => 'Rule';

  @override
  String get whyInputs => 'Your data used';

  @override
  String get whySource => 'Evidence source';

  @override
  String get whyReasonEnergy =>
      'Your average energy intake is outside the target range calculated from your weight, height, age and activity.';

  @override
  String get whyReasonMacros =>
      'The share of energy from one macronutrient is outside the range recommended for adults.';

  @override
  String get whyReasonCalcium =>
      'Your calcium intake is below the recommended daily amount for your age and sex.';

  @override
  String get whyReasonFruitVeg =>
      'You eat fewer fruit and vegetables than the recommended minimum.';

  @override
  String get whyReasonSteps =>
      'Your steps are below this week\'s target, which is set from your own baseline week.';

  @override
  String get whyReasonResistance =>
      'Guidelines recommend muscle-strengthening activity on at least two days a week.';

  @override
  String get whyReasonSitting =>
      'You have more long sitting periods than the limit set in the plan.';

  @override
  String ruleVersion(String id, String version) {
    return '$id, version $version';
  }

  @override
  String get statusGuideline => 'based on a guideline';

  @override
  String get statusProject => 'project decision';

  @override
  String get statusTeamSet => 'contains team-set placeholder values';

  @override
  String get inWeight => 'Weight, kg';

  @override
  String get inHeight => 'Height, cm';

  @override
  String get inAge => 'Age, years';

  @override
  String get inPal => 'Activity level (PAL)';

  @override
  String get inIntakeKcal => 'Average intake, kcal/day';

  @override
  String get inTargetKcal => 'Target, kcal/day';

  @override
  String get inSharePct => 'Share of energy, %';

  @override
  String get inMinPct => 'Lower limit, %';

  @override
  String get inMaxPct => 'Upper limit, %';

  @override
  String get inCalciumMg => 'Average calcium, mg/day';

  @override
  String get inTargetMg => 'Recommended, mg/day';

  @override
  String get inFruitVegG => 'Average fruit and vegetables, g/day';

  @override
  String get inTargetG => 'Recommended minimum, g/day';

  @override
  String get inBaselineSteps => 'Baseline, steps/day';

  @override
  String get inWeek => 'Study week';

  @override
  String get inMeanSteps => 'Last 7 days, steps/day';

  @override
  String get inTargetSteps => 'Target, steps/day';

  @override
  String get inSessionsPerWeek => 'Sessions per week';

  @override
  String get inSittingPeriods => 'Long sitting periods per day';

  @override
  String get inMaxPeriods => 'Limit per day';

  @override
  String get progressTitle => 'Progress';

  @override
  String get weightTrend => 'Weight, kg';

  @override
  String weightChange(String value) {
    return 'Change since day 1: $value kg';
  }

  @override
  String get stepsChart => 'Steps per day';

  @override
  String get intakeChart => 'Energy per day, kcal';

  @override
  String get targetLine => 'target';

  @override
  String get baselineLabel => 'baseline week';

  @override
  String get checkInTitle => 'Weekly check-in';

  @override
  String get checkInQ1 =>
      'During the last week, did you have an injury, pain, dizziness, chest pain or another health problem?';

  @override
  String get checkInQ2 =>
      'Has anything changed: pregnancy, a new diagnosis of diabetes or heart disease, or new weight-loss medication?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get submit => 'Submit';

  @override
  String get checkInThanks => 'Thank you! See you next week.';

  @override
  String get referralTitle => 'Please see a doctor';

  @override
  String get referralBody =>
      'We have paused activity recommendations and prompts. Contact your polyclinic or family doctor before continuing.';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get studyArm => 'Study group (demo switch)';

  @override
  String get armDemoNote =>
      'Only in the prototype: lets you compare the two versions of the app. In the pilot the group is assigned at random.';

  @override
  String get activeHours => 'Active hours for prompts';

  @override
  String get activeHoursValue => '09:00–21:00';

  @override
  String get ruleBase => 'Rule base (prototype)';

  @override
  String get restartDemo => 'Restart the demo';

  @override
  String get aboutPrototype => 'About the prototype';

  @override
  String get aboutBody =>
      'Clickable prototype of a diploma project (Astana IT University). The profile and logs are synthetic demo data. Rule values marked as team-set are placeholders until the rule base is finalized.';
}
