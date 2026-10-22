// Weekly adverse-event check-in (FR-28). A "yes" pauses activity
// recommendations and prompts and shows a referral (FR-29).

import 'package:flutter/material.dart';

import '../widgets/common.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key, this.presetReferral = false});

  /// Demo link only: show the state after an adverse event was reported.
  final bool presetReferral;

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  late bool? _adverse = widget.presetReferral ? true : null;
  late bool? _exclusion = widget.presetReferral ? false : null;
  late bool _submitted = widget.presetReferral;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final theme = Theme.of(context);

    Widget question(String text, bool? value, ValueChanged<bool> onChanged) =>
        SectionCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text, style: theme.textTheme.bodyLarge),
              const SizedBox(height: 12),
              SegmentedButton<bool>(
                segments: [
                  ButtonSegment(value: true, label: Text(l.yes)),
                  ButtonSegment(value: false, label: Text(l.no)),
                ],
                emptySelectionAllowed: true,
                selected: {?value},
                onSelectionChanged: _submitted
                    ? null
                    : (s) => setState(() => onChanged(s.first)),
              ),
            ],
          ),
        );

    final referral = _submitted && (_adverse == true || _exclusion == true);

    return Scaffold(
      appBar: AppBar(title: Text(l.checkInTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          question(l.checkInQ1, _adverse, (v) => _adverse = v),
          question(l.checkInQ2, _exclusion, (v) => _exclusion = v),
          const SizedBox(height: 8),
          if (!_submitted)
            FilledButton(
              onPressed: _adverse == null || _exclusion == null
                  ? null
                  : () {
                      context.app.submitCheckIn(
                          adverseEvent: _adverse!, newExclusion: _exclusion!);
                      setState(() => _submitted = true);
                    },
              child: Text(l.submit),
            )
          else if (referral)
            SectionCard(
              color: theme.colorScheme.errorContainer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Icon(Icons.local_hospital_outlined,
                        color: theme.colorScheme.onErrorContainer),
                    const SizedBox(width: 8),
                    Text(l.referralTitle,
                        style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.onErrorContainer)),
                  ]),
                  const SizedBox(height: 8),
                  Text(l.referralBody,
                      style: TextStyle(
                          color: theme.colorScheme.onErrorContainer)),
                ],
              ),
            )
          else
            NoteBanner(text: l.checkInThanks, icon: Icons.check_circle_outline),
          if (_submitted)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(l.close)),
            ),
        ],
      ),
    );
  }
}
