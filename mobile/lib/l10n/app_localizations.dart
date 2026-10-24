import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_kk.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('kk'),
    Locale('ru'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Weight Assistant'**
  String get appTitle;

  /// No description provided for @demoBadge.
  ///
  /// In en, this message translates to:
  /// **'Prototype · demo data'**
  String get demoBadge;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose the language'**
  String get chooseLanguage;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal weight management'**
  String get welcomeTitle;

  /// No description provided for @welcomeBody.
  ///
  /// In en, this message translates to:
  /// **'The app finds which of your daily habits differ most from health guidelines and gives explained nutrition and activity recommendations.'**
  String get welcomeBody;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @consentTitle.
  ///
  /// In en, this message translates to:
  /// **'Study information and consent'**
  String get consentTitle;

  /// No description provided for @consentBody.
  ///
  /// In en, this message translates to:
  /// **'This app is part of a university research project. Before any data are collected, please read the main points:'**
  String get consentBody;

  /// No description provided for @consentPoint1.
  ///
  /// In en, this message translates to:
  /// **'The app does not diagnose diseases and does not replace a doctor.'**
  String get consentPoint1;

  /// No description provided for @consentPoint2.
  ///
  /// In en, this message translates to:
  /// **'Your data are stored under a pseudonymous ID; your name is never included in research data.'**
  String get consentPoint2;

  /// No description provided for @consentPoint3.
  ///
  /// In en, this message translates to:
  /// **'You can withdraw at any time and ask to delete your data.'**
  String get consentPoint3;

  /// No description provided for @consentPoint4.
  ///
  /// In en, this message translates to:
  /// **'You may be assigned to a group with tracking only or with recommendations.'**
  String get consentPoint4;

  /// No description provided for @consentAgree.
  ///
  /// In en, this message translates to:
  /// **'I agree to take part'**
  String get consentAgree;

  /// No description provided for @consentPrototypeNote.
  ///
  /// In en, this message translates to:
  /// **'Prototype: nothing you enter is stored or sent anywhere.'**
  String get consentPrototypeNote;

  /// No description provided for @screeningTitle.
  ///
  /// In en, this message translates to:
  /// **'A few questions'**
  String get screeningTitle;

  /// No description provided for @screeningBody.
  ///
  /// In en, this message translates to:
  /// **'We check that the app is safe for you to use without medical supervision.'**
  String get screeningBody;

  /// No description provided for @ageYears.
  ///
  /// In en, this message translates to:
  /// **'Age, years'**
  String get ageYears;

  /// No description provided for @heightCm.
  ///
  /// In en, this message translates to:
  /// **'Height, cm'**
  String get heightCm;

  /// No description provided for @weightKg.
  ///
  /// In en, this message translates to:
  /// **'Weight, kg'**
  String get weightKg;

  /// No description provided for @waistCm.
  ///
  /// In en, this message translates to:
  /// **'Waist, cm'**
  String get waistCm;

  /// No description provided for @bmiValue.
  ///
  /// In en, this message translates to:
  /// **'BMI: {bmi} kg/m²'**
  String bmiValue(String bmi);

  /// No description provided for @exclusionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Does any of this apply to you?'**
  String get exclusionsTitle;

  /// No description provided for @exDiabetes.
  ///
  /// In en, this message translates to:
  /// **'Diagnosed diabetes'**
  String get exDiabetes;

  /// No description provided for @exCardio.
  ///
  /// In en, this message translates to:
  /// **'Diagnosed cardiovascular disease'**
  String get exCardio;

  /// No description provided for @exPregnancy.
  ///
  /// In en, this message translates to:
  /// **'Pregnancy'**
  String get exPregnancy;

  /// No description provided for @exMedication.
  ///
  /// In en, this message translates to:
  /// **'Currently taking weight-loss medication'**
  String get exMedication;

  /// No description provided for @exParq.
  ///
  /// In en, this message translates to:
  /// **'\"Yes\" to any PAR-Q+ general health question'**
  String get exParq;

  /// No description provided for @exParqHint.
  ///
  /// In en, this message translates to:
  /// **'PAR-Q+ is a standard pre-exercise questionnaire (eparmedx.com).'**
  String get exParqHint;

  /// No description provided for @checkEligibility.
  ///
  /// In en, this message translates to:
  /// **'Check'**
  String get checkEligibility;

  /// No description provided for @eligibleTitle.
  ///
  /// In en, this message translates to:
  /// **'You can use the app'**
  String get eligibleTitle;

  /// No description provided for @eligibleBody.
  ///
  /// In en, this message translates to:
  /// **'The first 7 days are a baseline week: just log your food, weight and steps. Personal targets start on day 8.'**
  String get eligibleBody;

  /// No description provided for @armAssigned.
  ///
  /// In en, this message translates to:
  /// **'Study group: {arm}'**
  String armAssigned(String arm);

  /// No description provided for @armIntervention.
  ///
  /// In en, this message translates to:
  /// **'recommendations'**
  String get armIntervention;

  /// No description provided for @armControl.
  ///
  /// In en, this message translates to:
  /// **'tracking only'**
  String get armControl;

  /// No description provided for @armRandomNote.
  ///
  /// In en, this message translates to:
  /// **'In the pilot the group is assigned at random and cannot be changed.'**
  String get armRandomNote;

  /// No description provided for @openDemo.
  ///
  /// In en, this message translates to:
  /// **'Open the demo (day 14)'**
  String get openDemo;

  /// No description provided for @ineligibleTitle.
  ///
  /// In en, this message translates to:
  /// **'This app is not suitable for you'**
  String get ineligibleTitle;

  /// No description provided for @ineligibleBody.
  ///
  /// In en, this message translates to:
  /// **'For your safety, weight management in your situation should be supervised by a doctor. Please contact your polyclinic or a family doctor. The app will not give you recommendations.'**
  String get ineligibleBody;

  /// No description provided for @ineligibleReasons.
  ///
  /// In en, this message translates to:
  /// **'Reason:'**
  String get ineligibleReasons;

  /// No description provided for @reasonAge.
  ///
  /// In en, this message translates to:
  /// **'age outside 18–60 years'**
  String get reasonAge;

  /// No description provided for @reasonBmiLow.
  ///
  /// In en, this message translates to:
  /// **'BMI below 25.0'**
  String get reasonBmiLow;

  /// No description provided for @reasonBmiHigh.
  ///
  /// In en, this message translates to:
  /// **'BMI of 35.0 or higher'**
  String get reasonBmiHigh;

  /// No description provided for @reasonDiabetes.
  ///
  /// In en, this message translates to:
  /// **'diabetes'**
  String get reasonDiabetes;

  /// No description provided for @reasonCardio.
  ///
  /// In en, this message translates to:
  /// **'cardiovascular disease'**
  String get reasonCardio;

  /// No description provided for @reasonPregnancy.
  ///
  /// In en, this message translates to:
  /// **'pregnancy'**
  String get reasonPregnancy;

  /// No description provided for @reasonMedication.
  ///
  /// In en, this message translates to:
  /// **'weight-loss medication'**
  String get reasonMedication;

  /// No description provided for @reasonParq.
  ///
  /// In en, this message translates to:
  /// **'PAR-Q+ answer'**
  String get reasonParq;

  /// No description provided for @backToStart.
  ///
  /// In en, this message translates to:
  /// **'Back to start'**
  String get backToStart;

  /// No description provided for @navToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get navToday;

  /// No description provided for @navLog.
  ///
  /// In en, this message translates to:
  /// **'Log'**
  String get navLog;

  /// No description provided for @navFactors.
  ///
  /// In en, this message translates to:
  /// **'Factors'**
  String get navFactors;

  /// No description provided for @navPlan.
  ///
  /// In en, this message translates to:
  /// **'Plan'**
  String get navPlan;

  /// No description provided for @navProgress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get navProgress;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @dayOfStudy.
  ///
  /// In en, this message translates to:
  /// **'Day {day} · week {week}'**
  String dayOfStudy(int day, int week);

  /// No description provided for @energyToday.
  ///
  /// In en, this message translates to:
  /// **'Energy today'**
  String get energyToday;

  /// No description provided for @stepsToday.
  ///
  /// In en, this message translates to:
  /// **'Steps today'**
  String get stepsToday;

  /// No description provided for @ofTarget.
  ///
  /// In en, this message translates to:
  /// **'of {target}'**
  String ofTarget(String target);

  /// No description provided for @kcal.
  ///
  /// In en, this message translates to:
  /// **'kcal'**
  String get kcal;

  /// No description provided for @steps.
  ///
  /// In en, this message translates to:
  /// **'steps'**
  String get steps;

  /// No description provided for @mg.
  ///
  /// In en, this message translates to:
  /// **'mg'**
  String get mg;

  /// No description provided for @g.
  ///
  /// In en, this message translates to:
  /// **'g'**
  String get g;

  /// No description provided for @topFactor.
  ///
  /// In en, this message translates to:
  /// **'Your main factor this week'**
  String get topFactor;

  /// No description provided for @seeAllFactors.
  ///
  /// In en, this message translates to:
  /// **'All factors'**
  String get seeAllFactors;

  /// No description provided for @topRecommendation.
  ///
  /// In en, this message translates to:
  /// **'First recommendation'**
  String get topRecommendation;

  /// No description provided for @openPlan.
  ///
  /// In en, this message translates to:
  /// **'Open the plan'**
  String get openPlan;

  /// No description provided for @checkInDue.
  ///
  /// In en, this message translates to:
  /// **'Weekly check-in is due'**
  String get checkInDue;

  /// No description provided for @checkInOpen.
  ///
  /// In en, this message translates to:
  /// **'Answer (1 min)'**
  String get checkInOpen;

  /// No description provided for @promptTitle.
  ///
  /// In en, this message translates to:
  /// **'Activity prompt (example)'**
  String get promptTitle;

  /// No description provided for @promptBody.
  ///
  /// In en, this message translates to:
  /// **'By now you usually have more steps. A 10-minute walk would bring you closer to today\'s target.'**
  String get promptBody;

  /// No description provided for @suspendedBanner.
  ///
  /// In en, this message translates to:
  /// **'Activity recommendations are paused because you reported a health problem. Please see a doctor.'**
  String get suspendedBanner;

  /// No description provided for @controlTodayNote.
  ///
  /// In en, this message translates to:
  /// **'Tracking mode: log your food, weight and steps. Recommendations are not shown in this study group.'**
  String get controlTodayNote;

  /// No description provided for @logTitle.
  ///
  /// In en, this message translates to:
  /// **'Food and weight'**
  String get logTitle;

  /// No description provided for @searchFood.
  ///
  /// In en, this message translates to:
  /// **'Search food'**
  String get searchFood;

  /// No description provided for @demoFoodNote.
  ///
  /// In en, this message translates to:
  /// **'Demo food list: nutrient values are approximate and only for the prototype.'**
  String get demoFoodNote;

  /// No description provided for @localFood.
  ///
  /// In en, this message translates to:
  /// **'local'**
  String get localFood;

  /// No description provided for @per100g.
  ///
  /// In en, this message translates to:
  /// **'{kcal} kcal per 100 g'**
  String per100g(String kcal);

  /// No description provided for @portionGrams.
  ///
  /// In en, this message translates to:
  /// **'Portion, g'**
  String get portionGrams;

  /// No description provided for @addToDiary.
  ///
  /// In en, this message translates to:
  /// **'Add to diary'**
  String get addToDiary;

  /// No description provided for @aiLogging.
  ///
  /// In en, this message translates to:
  /// **'Describe a meal'**
  String get aiLogging;

  /// No description provided for @aiHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. plov, tea and bread'**
  String get aiHint;

  /// No description provided for @aiSimulatedNote.
  ///
  /// In en, this message translates to:
  /// **'Prototype: no AI service is called. Words are matched against the food list to show the confirm-before-save step.'**
  String get aiSimulatedNote;

  /// No description provided for @aiPropose.
  ///
  /// In en, this message translates to:
  /// **'Find foods'**
  String get aiPropose;

  /// No description provided for @aiProposalTitle.
  ///
  /// In en, this message translates to:
  /// **'Check before saving'**
  String get aiProposalTitle;

  /// No description provided for @aiConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm and save'**
  String get aiConfirm;

  /// No description provided for @aiNothing.
  ///
  /// In en, this message translates to:
  /// **'Nothing found in the food list.'**
  String get aiNothing;

  /// No description provided for @todayEntries.
  ///
  /// In en, this message translates to:
  /// **'Logged today'**
  String get todayEntries;

  /// No description provided for @noEntries.
  ///
  /// In en, this message translates to:
  /// **'Nothing logged yet'**
  String get noEntries;

  /// No description provided for @logWeight.
  ///
  /// In en, this message translates to:
  /// **'Log weight and waist'**
  String get logWeight;

  /// No description provided for @weightSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get weightSaved;

  /// No description provided for @entryAdded.
  ///
  /// In en, this message translates to:
  /// **'Added: {name}'**
  String entryAdded(String name);

  /// No description provided for @totalToday.
  ///
  /// In en, this message translates to:
  /// **'Total: {kcal} kcal'**
  String totalToday(String kcal);

  /// No description provided for @factorsTitle.
  ///
  /// In en, this message translates to:
  /// **'Your factors'**
  String get factorsTitle;

  /// No description provided for @factorsIntro.
  ///
  /// In en, this message translates to:
  /// **'Average of the last 7 days compared with guideline targets. The higher a factor, the more it differs from its target.'**
  String get factorsIntro;

  /// No description provided for @factorEnergy.
  ///
  /// In en, this message translates to:
  /// **'Energy intake'**
  String get factorEnergy;

  /// No description provided for @factorMacros.
  ///
  /// In en, this message translates to:
  /// **'Macronutrient balance'**
  String get factorMacros;

  /// No description provided for @factorCalcium.
  ///
  /// In en, this message translates to:
  /// **'Calcium'**
  String get factorCalcium;

  /// No description provided for @factorFruitVeg.
  ///
  /// In en, this message translates to:
  /// **'Fruit and vegetables'**
  String get factorFruitVeg;

  /// No description provided for @factorSteps.
  ///
  /// In en, this message translates to:
  /// **'Daily steps'**
  String get factorSteps;

  /// No description provided for @factorSedentary.
  ///
  /// In en, this message translates to:
  /// **'Prolonged sitting'**
  String get factorSedentary;

  /// No description provided for @groupDiet.
  ///
  /// In en, this message translates to:
  /// **'Diet'**
  String get groupDiet;

  /// No description provided for @groupActivity.
  ///
  /// In en, this message translates to:
  /// **'Physical activity'**
  String get groupActivity;

  /// No description provided for @groupSedentary.
  ///
  /// In en, this message translates to:
  /// **'Sedentary behaviour'**
  String get groupSedentary;

  /// No description provided for @valueLabel.
  ///
  /// In en, this message translates to:
  /// **'Your value'**
  String get valueLabel;

  /// No description provided for @targetLabel.
  ///
  /// In en, this message translates to:
  /// **'Target'**
  String get targetLabel;

  /// No description provided for @ruleLabel.
  ///
  /// In en, this message translates to:
  /// **'Rule'**
  String get ruleLabel;

  /// No description provided for @onTarget.
  ///
  /// In en, this message translates to:
  /// **'On target'**
  String get onTarget;

  /// No description provided for @deviationPct.
  ///
  /// In en, this message translates to:
  /// **'Deviation {pct}%'**
  String deviationPct(String pct);

  /// No description provided for @atLeast.
  ///
  /// In en, this message translates to:
  /// **'at least {value}'**
  String atLeast(String value);

  /// No description provided for @atMost.
  ///
  /// In en, this message translates to:
  /// **'at most {value}'**
  String atMost(String value);

  /// No description provided for @perDay.
  ///
  /// In en, this message translates to:
  /// **'per day'**
  String get perDay;

  /// No description provided for @periodsPerDay.
  ///
  /// In en, this message translates to:
  /// **'periods/day'**
  String get periodsPerDay;

  /// No description provided for @baselineWeekFactors.
  ///
  /// In en, this message translates to:
  /// **'Step targets start after the baseline week.'**
  String get baselineWeekFactors;

  /// No description provided for @planTitle.
  ///
  /// In en, this message translates to:
  /// **'Your plan'**
  String get planTitle;

  /// No description provided for @planIntro.
  ///
  /// In en, this message translates to:
  /// **'Recommendations are ordered by your factors. Tap \"Why?\" to see the rule behind each one.'**
  String get planIntro;

  /// No description provided for @constraintsTitle.
  ///
  /// In en, this message translates to:
  /// **'Safety checks of the plan'**
  String get constraintsTitle;

  /// No description provided for @constraintEnergy.
  ///
  /// In en, this message translates to:
  /// **'Energy target not below resting energy'**
  String get constraintEnergy;

  /// No description provided for @constraintMacros.
  ///
  /// In en, this message translates to:
  /// **'Macronutrients within guideline ranges'**
  String get constraintMacros;

  /// No description provided for @constraintCalcium.
  ///
  /// In en, this message translates to:
  /// **'Calcium target not below the recommended intake'**
  String get constraintCalcium;

  /// No description provided for @constraintIntensity.
  ///
  /// In en, this message translates to:
  /// **'Activity raised gradually from your own baseline'**
  String get constraintIntensity;

  /// No description provided for @why.
  ///
  /// In en, this message translates to:
  /// **'Why?'**
  String get why;

  /// No description provided for @macroProtein.
  ///
  /// In en, this message translates to:
  /// **'protein'**
  String get macroProtein;

  /// No description provided for @macroFat.
  ///
  /// In en, this message translates to:
  /// **'fat'**
  String get macroFat;

  /// No description provided for @macroCarbs.
  ///
  /// In en, this message translates to:
  /// **'carbohydrates'**
  String get macroCarbs;

  /// No description provided for @recReduceEnergyTitle.
  ///
  /// In en, this message translates to:
  /// **'Eat a little less: about {target} kcal a day'**
  String recReduceEnergyTitle(String target);

  /// No description provided for @recReduceEnergyBody.
  ///
  /// In en, this message translates to:
  /// **'Your average was {value} kcal. Smaller portions of the most energy-dense dishes are the easiest change.'**
  String recReduceEnergyBody(String value);

  /// No description provided for @recIncreaseEnergyTitle.
  ///
  /// In en, this message translates to:
  /// **'Do not eat too little: about {target} kcal a day'**
  String recIncreaseEnergyTitle(String target);

  /// No description provided for @recIncreaseEnergyBody.
  ///
  /// In en, this message translates to:
  /// **'Your average was {value} kcal. Eating too little is hard to keep up and can harm health.'**
  String recIncreaseEnergyBody(String value);

  /// No description provided for @recMacrosTitle.
  ///
  /// In en, this message translates to:
  /// **'Balance your plate: {nutrient}'**
  String recMacrosTitle(String nutrient);

  /// No description provided for @recMacrosBody.
  ///
  /// In en, this message translates to:
  /// **'{nutrient} gave {value}% of your energy; the recommended range is {min}–{max}%.'**
  String recMacrosBody(String nutrient, String value, String min, String max);

  /// No description provided for @recCalciumTitle.
  ///
  /// In en, this message translates to:
  /// **'Add calcium: {target} mg a day'**
  String recCalciumTitle(String target);

  /// No description provided for @recCalciumBody.
  ///
  /// In en, this message translates to:
  /// **'You had about {value} mg a day. Kefir, cottage cheese or other dairy products once or twice a day close most of the gap.'**
  String recCalciumBody(String value);

  /// No description provided for @recFruitVegTitle.
  ///
  /// In en, this message translates to:
  /// **'At least {target} g of fruit and vegetables a day'**
  String recFruitVegTitle(String target);

  /// No description provided for @recFruitVegBody.
  ///
  /// In en, this message translates to:
  /// **'You had about {value} g a day. Add a vegetable salad to lunch and a fruit as a snack.'**
  String recFruitVegBody(String value);

  /// No description provided for @recStepsTitle.
  ///
  /// In en, this message translates to:
  /// **'Step target this week: {target}'**
  String recStepsTitle(String target);

  /// No description provided for @recStepsBody.
  ///
  /// In en, this message translates to:
  /// **'Your baseline is {baseline} steps; the target rises a little each week. Last week you averaged {value}.'**
  String recStepsBody(String baseline, String value);

  /// No description provided for @recResistanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Two strength sessions a week'**
  String get recResistanceTitle;

  /// No description provided for @recResistanceBody.
  ///
  /// In en, this message translates to:
  /// **'For example, Tuesday and Friday: squats, push-ups against a wall, resistance band rows. Start easy.'**
  String get recResistanceBody;

  /// No description provided for @recSittingTitle.
  ///
  /// In en, this message translates to:
  /// **'Break up long sitting'**
  String get recSittingTitle;

  /// No description provided for @recSittingBody.
  ///
  /// In en, this message translates to:
  /// **'You had about {value} periods of sitting for an hour or more a day. Stand up and walk for 2–3 minutes every hour.'**
  String recSittingBody(String value);

  /// No description provided for @whyTitle.
  ///
  /// In en, this message translates to:
  /// **'Why this recommendation'**
  String get whyTitle;

  /// No description provided for @whyReason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get whyReason;

  /// No description provided for @whyRule.
  ///
  /// In en, this message translates to:
  /// **'Rule'**
  String get whyRule;

  /// No description provided for @whyInputs.
  ///
  /// In en, this message translates to:
  /// **'Your data used'**
  String get whyInputs;

  /// No description provided for @whySource.
  ///
  /// In en, this message translates to:
  /// **'Evidence source'**
  String get whySource;

  /// No description provided for @whyReasonEnergy.
  ///
  /// In en, this message translates to:
  /// **'Your average energy intake is outside the target range calculated from your weight, height, age and activity.'**
  String get whyReasonEnergy;

  /// No description provided for @whyReasonMacros.
  ///
  /// In en, this message translates to:
  /// **'The share of energy from one macronutrient is outside the range recommended for adults.'**
  String get whyReasonMacros;

  /// No description provided for @whyReasonCalcium.
  ///
  /// In en, this message translates to:
  /// **'Your calcium intake is below the recommended daily amount for your age and sex.'**
  String get whyReasonCalcium;

  /// No description provided for @whyReasonFruitVeg.
  ///
  /// In en, this message translates to:
  /// **'You eat fewer fruit and vegetables than the recommended minimum.'**
  String get whyReasonFruitVeg;

  /// No description provided for @whyReasonSteps.
  ///
  /// In en, this message translates to:
  /// **'Your steps are below this week\'s target, which is set from your own baseline week.'**
  String get whyReasonSteps;

  /// No description provided for @whyReasonResistance.
  ///
  /// In en, this message translates to:
  /// **'Guidelines recommend muscle-strengthening activity on at least two days a week.'**
  String get whyReasonResistance;

  /// No description provided for @whyReasonSitting.
  ///
  /// In en, this message translates to:
  /// **'You have more long sitting periods than the limit set in the plan.'**
  String get whyReasonSitting;

  /// No description provided for @ruleVersion.
  ///
  /// In en, this message translates to:
  /// **'{id}, version {version}'**
  String ruleVersion(String id, String version);

  /// No description provided for @statusGuideline.
  ///
  /// In en, this message translates to:
  /// **'based on a guideline'**
  String get statusGuideline;

  /// No description provided for @statusProject.
  ///
  /// In en, this message translates to:
  /// **'project decision'**
  String get statusProject;

  /// No description provided for @statusTeamSet.
  ///
  /// In en, this message translates to:
  /// **'contains team-set placeholder values'**
  String get statusTeamSet;

  /// No description provided for @inWeight.
  ///
  /// In en, this message translates to:
  /// **'Weight, kg'**
  String get inWeight;

  /// No description provided for @inHeight.
  ///
  /// In en, this message translates to:
  /// **'Height, cm'**
  String get inHeight;

  /// No description provided for @inAge.
  ///
  /// In en, this message translates to:
  /// **'Age, years'**
  String get inAge;

  /// No description provided for @inPal.
  ///
  /// In en, this message translates to:
  /// **'Activity level (PAL)'**
  String get inPal;

  /// No description provided for @inIntakeKcal.
  ///
  /// In en, this message translates to:
  /// **'Average intake, kcal/day'**
  String get inIntakeKcal;

  /// No description provided for @inTargetKcal.
  ///
  /// In en, this message translates to:
  /// **'Target, kcal/day'**
  String get inTargetKcal;

  /// No description provided for @inSharePct.
  ///
  /// In en, this message translates to:
  /// **'Share of energy, %'**
  String get inSharePct;

  /// No description provided for @inMinPct.
  ///
  /// In en, this message translates to:
  /// **'Lower limit, %'**
  String get inMinPct;

  /// No description provided for @inMaxPct.
  ///
  /// In en, this message translates to:
  /// **'Upper limit, %'**
  String get inMaxPct;

  /// No description provided for @inCalciumMg.
  ///
  /// In en, this message translates to:
  /// **'Average calcium, mg/day'**
  String get inCalciumMg;

  /// No description provided for @inTargetMg.
  ///
  /// In en, this message translates to:
  /// **'Recommended, mg/day'**
  String get inTargetMg;

  /// No description provided for @inFruitVegG.
  ///
  /// In en, this message translates to:
  /// **'Average fruit and vegetables, g/day'**
  String get inFruitVegG;

  /// No description provided for @inTargetG.
  ///
  /// In en, this message translates to:
  /// **'Recommended minimum, g/day'**
  String get inTargetG;

  /// No description provided for @inBaselineSteps.
  ///
  /// In en, this message translates to:
  /// **'Baseline, steps/day'**
  String get inBaselineSteps;

  /// No description provided for @inWeek.
  ///
  /// In en, this message translates to:
  /// **'Study week'**
  String get inWeek;

  /// No description provided for @inMeanSteps.
  ///
  /// In en, this message translates to:
  /// **'Last 7 days, steps/day'**
  String get inMeanSteps;

  /// No description provided for @inTargetSteps.
  ///
  /// In en, this message translates to:
  /// **'Target, steps/day'**
  String get inTargetSteps;

  /// No description provided for @inSessionsPerWeek.
  ///
  /// In en, this message translates to:
  /// **'Sessions per week'**
  String get inSessionsPerWeek;

  /// No description provided for @inSittingPeriods.
  ///
  /// In en, this message translates to:
  /// **'Long sitting periods per day'**
  String get inSittingPeriods;

  /// No description provided for @inMaxPeriods.
  ///
  /// In en, this message translates to:
  /// **'Limit per day'**
  String get inMaxPeriods;

  /// No description provided for @progressTitle.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progressTitle;

  /// No description provided for @weightTrend.
  ///
  /// In en, this message translates to:
  /// **'Weight, kg'**
  String get weightTrend;

  /// No description provided for @weightChange.
  ///
  /// In en, this message translates to:
  /// **'Change since day 1: {value} kg'**
  String weightChange(String value);

  /// No description provided for @stepsChart.
  ///
  /// In en, this message translates to:
  /// **'Steps per day'**
  String get stepsChart;

  /// No description provided for @intakeChart.
  ///
  /// In en, this message translates to:
  /// **'Energy per day, kcal'**
  String get intakeChart;

  /// No description provided for @targetLine.
  ///
  /// In en, this message translates to:
  /// **'target'**
  String get targetLine;

  /// No description provided for @baselineLabel.
  ///
  /// In en, this message translates to:
  /// **'baseline week'**
  String get baselineLabel;

  /// No description provided for @checkInTitle.
  ///
  /// In en, this message translates to:
  /// **'Weekly check-in'**
  String get checkInTitle;

  /// No description provided for @checkInQ1.
  ///
  /// In en, this message translates to:
  /// **'During the last week, did you have an injury, pain, dizziness, chest pain or another health problem?'**
  String get checkInQ1;

  /// No description provided for @checkInQ2.
  ///
  /// In en, this message translates to:
  /// **'Has anything changed: pregnancy, a new diagnosis of diabetes or heart disease, or new weight-loss medication?'**
  String get checkInQ2;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @checkInThanks.
  ///
  /// In en, this message translates to:
  /// **'Thank you! See you next week.'**
  String get checkInThanks;

  /// No description provided for @referralTitle.
  ///
  /// In en, this message translates to:
  /// **'Please see a doctor'**
  String get referralTitle;

  /// No description provided for @referralBody.
  ///
  /// In en, this message translates to:
  /// **'We have paused activity recommendations and prompts. Contact your polyclinic or family doctor before continuing.'**
  String get referralBody;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @studyArm.
  ///
  /// In en, this message translates to:
  /// **'Study group (demo switch)'**
  String get studyArm;

  /// No description provided for @armDemoNote.
  ///
  /// In en, this message translates to:
  /// **'Only in the prototype: lets you compare the two versions of the app. In the pilot the group is assigned at random.'**
  String get armDemoNote;

  /// No description provided for @activeHours.
  ///
  /// In en, this message translates to:
  /// **'Active hours for prompts'**
  String get activeHours;

  /// No description provided for @activeHoursValue.
  ///
  /// In en, this message translates to:
  /// **'09:00–21:00'**
  String get activeHoursValue;

  /// No description provided for @ruleBase.
  ///
  /// In en, this message translates to:
  /// **'Rule base (prototype)'**
  String get ruleBase;

  /// No description provided for @restartDemo.
  ///
  /// In en, this message translates to:
  /// **'Restart the demo'**
  String get restartDemo;

  /// No description provided for @aboutPrototype.
  ///
  /// In en, this message translates to:
  /// **'About the prototype'**
  String get aboutPrototype;

  /// No description provided for @aboutBody.
  ///
  /// In en, this message translates to:
  /// **'Clickable prototype of a diploma project (Astana IT University). The profile and logs are synthetic demo data. Rule values marked as team-set are placeholders until the rule base is finalized.'**
  String get aboutBody;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'kk', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'kk':
      return AppLocalizationsKk();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
