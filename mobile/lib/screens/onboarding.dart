// Onboarding: language, consent (FR-02), screening (FR-04) and its result
// with referral for ineligible people (FR-05).

import 'package:flutter/material.dart';

import '../models/models.dart';
import '../rules/rule_base.dart';
import '../state/app_state.dart';
import '../widgets/common.dart';

const languages = [
  (Locale('kk'), 'Қазақша'),
  (Locale('ru'), 'Русский'),
  (Locale('en'), 'English'),
];

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final app = context.app;
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(alignment: Alignment.topRight, child: DemoBadge()),
              const Spacer(),
              Icon(Icons.monitor_weight_outlined,
                  size: 56, color: theme.colorScheme.primary),
              const SizedBox(height: 16),
              Text(l.appTitle, style: theme.textTheme.headlineMedium),
              const SizedBox(height: 8),
              Text(l.welcomeTitle, style: theme.textTheme.titleMedium),
              const SizedBox(height: 12),
              Text(l.welcomeBody, style: theme.textTheme.bodyLarge),
              const Spacer(),
              Text(l.chooseLanguage, style: theme.textTheme.titleSmall),
              const SizedBox(height: 8),
              SegmentedButton<String>(
                segments: [
                  for (final (locale, name) in languages)
                    ButtonSegment(value: locale.languageCode, label: Text(name)),
                ],
                selected: {app.lang},
                onSelectionChanged: (s) => app.setLocale(Locale(s.first)),
                showSelectedIcon: false,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => app.goTo(Stage.consent),
                  child: Text(l.start),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ConsentScreen extends StatelessWidget {
  const ConsentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final theme = Theme.of(context);
    final points = [
      (Icons.medical_services_outlined, l.consentPoint1),
      (Icons.badge_outlined, l.consentPoint2),
      (Icons.logout, l.consentPoint3),
      (Icons.groups_outlined, l.consentPoint4),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(l.consentTitle),
        leading: BackButton(onPressed: () => context.app.goTo(Stage.language)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(l.consentBody, style: theme.textTheme.bodyLarge),
          const SizedBox(height: 16),
          for (final (icon, text) in points)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(icon, color: theme.colorScheme.primary),
              title: Text(text),
            ),
          const SizedBox(height: 8),
          NoteBanner(text: l.consentPrototypeNote),
          const SizedBox(height: 8),
          FilledButton(
            onPressed: context.app.giveConsent,
            child: Text(l.consentAgree),
          ),
        ],
      ),
    );
  }
}

class ScreeningScreen extends StatefulWidget {
  const ScreeningScreen({super.key});

  @override
  State<ScreeningScreen> createState() => _ScreeningScreenState();
}

class _ScreeningScreenState extends State<ScreeningScreen> {
  TextEditingController? _ageC, _heightC, _weightC;
  TextEditingController get _age => _ageC!;
  TextEditingController get _height => _heightC!;
  TextEditingController get _weight => _weightC!;
  bool _diabetes = false;
  bool _cardio = false;
  bool _pregnancy = false;
  bool _medication = false;
  bool _parq = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_ageC != null) return;
    final s = context.app.screening;
    _ageC = TextEditingController(text: '${s.age}');
    _heightC = TextEditingController(text: s.heightCm.toStringAsFixed(0));
    _weightC = TextEditingController(text: s.weightKg.toStringAsFixed(1));
  }

  @override
  void dispose() {
    _age.dispose();
    _height.dispose();
    _weight.dispose();
    super.dispose();
  }

  double? _parse(TextEditingController c) =>
      double.tryParse(c.text.replaceAll(',', '.'));

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final theme = Theme.of(context);
    final h = _parse(_height), w = _parse(_weight);
    final bmi = (h != null && w != null && h > 0) ? w / ((h / 100) * (h / 100)) : null;

    Widget field(TextEditingController c, String label) => Expanded(
          child: TextField(
            controller: c,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
                labelText: label, border: const OutlineInputBorder()),
            onChanged: (_) => setState(() {}),
          ),
        );

    Widget check(String title, bool value, ValueChanged<bool> onChanged,
            {String? subtitle}) =>
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          value: value,
          onChanged: (v) => setState(() => onChanged(v ?? false)),
          title: Text(title),
          subtitle: subtitle == null ? null : Text(subtitle),
          controlAffinity: ListTileControlAffinity.leading,
        );

    return Scaffold(
      appBar: AppBar(title: Text(l.screeningTitle)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(l.screeningBody, style: theme.textTheme.bodyLarge),
          const SizedBox(height: 16),
          Row(children: [
            field(_age, l.ageYears),
            const SizedBox(width: 8),
            field(_height, l.heightCm),
            const SizedBox(width: 8),
            field(_weight, l.weightKg),
          ]),
          const SizedBox(height: 8),
          if (bmi != null)
            Text(l.bmiValue(fmt(context, bmi, 1)),
                style: theme.textTheme.titleMedium),
          const SizedBox(height: 16),
          Text(l.exclusionsTitle, style: theme.textTheme.titleSmall),
          check(l.exDiabetes, _diabetes, (v) => _diabetes = v),
          check(l.exCardio, _cardio, (v) => _cardio = v),
          check(l.exPregnancy, _pregnancy, (v) => _pregnancy = v),
          check(l.exMedication, _medication, (v) => _medication = v),
          check(l.exParq, _parq, (v) => _parq = v, subtitle: l.exParqHint),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () => context.app.submitScreening(ScreeningAnswers(
              age: int.tryParse(_age.text) ?? 0,
              heightCm: h ?? 0,
              weightKg: w ?? 0,
              diabetes: _diabetes,
              cardiovascular: _cardio,
              pregnancy: _pregnancy,
              weightLossMedication: _medication,
              parqPositive: _parq,
            )),
            child: Text(l.checkEligibility),
          ),
        ],
      ),
    );
  }
}

class ScreeningResultScreen extends StatelessWidget {
  const ScreeningResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final app = context.app;
    final theme = Theme.of(context);
    final result = app.eligibility!;

    if (!result.eligible) {
      String reason(IneligibleReason r) => switch (r) {
            IneligibleReason.age => l.reasonAge,
            IneligibleReason.bmiLow => l.reasonBmiLow,
            IneligibleReason.bmiHigh => l.reasonBmiHigh,
            IneligibleReason.diabetes => l.reasonDiabetes,
            IneligibleReason.cardiovascular => l.reasonCardio,
            IneligibleReason.pregnancy => l.reasonPregnancy,
            IneligibleReason.medication => l.reasonMedication,
            IneligibleReason.parq => l.reasonParq,
          };
      return Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              const SizedBox(height: 32),
              Icon(Icons.local_hospital_outlined,
                  size: 56, color: theme.colorScheme.error),
              const SizedBox(height: 16),
              Text(l.ineligibleTitle, style: theme.textTheme.headlineSmall),
              const SizedBox(height: 12),
              Text(l.ineligibleBody, style: theme.textTheme.bodyLarge),
              const SizedBox(height: 16),
              Text(l.ineligibleReasons, style: theme.textTheme.titleSmall),
              for (final r in result.reasons) Text('• ${reason(r)}'),
              const SizedBox(height: 32),
              OutlinedButton(
                onPressed: () => app.goTo(Stage.screening),
                child: Text(l.backToStart),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const SizedBox(height: 32),
            Icon(Icons.check_circle_outline,
                size: 56, color: theme.colorScheme.primary),
            const SizedBox(height: 16),
            Text(l.eligibleTitle, style: theme.textTheme.headlineSmall),
            const SizedBox(height: 12),
            Text(l.bmiValue(fmt(context, app.screening.bmi, 1)),
                style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            Text(l.eligibleBody, style: theme.textTheme.bodyLarge),
            const SizedBox(height: 16),
            SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l.armAssigned(app.isIntervention
                        ? l.armIntervention
                        : l.armControl),
                    style: theme.textTheme.titleSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(l.armRandomNote, style: theme.textTheme.bodySmall),
                ],
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => app.goTo(Stage.app),
              child: Text(l.openDemo),
            ),
          ],
        ),
      ),
    );
  }
}
