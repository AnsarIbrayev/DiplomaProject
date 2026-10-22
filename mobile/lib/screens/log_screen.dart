// Food logging by search (FR-07), simulated AI-assisted logging with
// confirmation before saving (FR-40), and weight and waist logging (FR-09).

import 'package:flutter/material.dart';

import '../data/food_db.dart';
import '../models/models.dart';
import '../widgets/common.dart';

class LogScreen extends StatefulWidget {
  const LogScreen({super.key});

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  final _search = TextEditingController();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final app = context.app;
    final theme = Theme.of(context);
    final entries = app.entriesOf(app.today);
    final total = DayIntake.of(entries);
    final results = _search.text.isEmpty
        ? <Food>[]
        : searchFoods(_search.text, app.lang);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        FilledButton.tonalIcon(
          onPressed: () => _openAi(context),
          icon: const Icon(Icons.auto_awesome_outlined),
          label: Text(l.aiLogging),
        ),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: () => _openWeight(context),
          icon: const Icon(Icons.monitor_weight_outlined),
          label: Text(l.logWeight),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _search,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: l.searchFood,
            border: const OutlineInputBorder(),
          ),
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: 8),
        for (final f in results)
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(f.name(app.lang)),
            subtitle: Text(l.per100g(fmt(context, f.kcal))),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              if (f.isLocal)
                Chip(
                  label: Text(l.localFood),
                  visualDensity: VisualDensity.compact,
                ),
              const Icon(Icons.add_circle_outline),
            ]),
            onTap: () => _openPortion(context, f),
          ),
        if (results.isEmpty) NoteBanner(text: l.demoFoodNote),
        const SizedBox(height: 8),
        Row(children: [
          Expanded(
              child:
                  Text(l.todayEntries, style: theme.textTheme.titleMedium)),
          Text(l.totalToday(fmt(context, total.kcal)),
              style: theme.textTheme.titleSmall),
        ]),
        const SizedBox(height: 4),
        if (entries.isEmpty) Text(l.noEntries),
        for (final e in entries)
          ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            leading: const Icon(Icons.restaurant, size: 20),
            title: Text(e.food.name(app.lang)),
            subtitle: Text('${fmt(context, e.grams)} ${l.g}'),
            trailing: Text('${fmt(context, e.kcal)} ${l.kcal}'),
          ),
      ],
    );
  }

  Future<void> _openPortion(BuildContext context, Food food) async {
    final l = context.l10n;
    final app = context.app;
    final controller =
        TextEditingController(text: food.defaultPortionG.toStringAsFixed(0));
    final grams = await showModalBottomSheet<double>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(
            20, 20, 20, 20 + MediaQuery.of(ctx).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(food.name(app.lang),
                style: Theme.of(ctx).textTheme.titleLarge),
            Text(l.per100g(fmt(ctx, food.kcal))),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: l.portionGrams,
                  border: const OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.pop(
                    ctx, double.tryParse(controller.text.replaceAll(',', '.'))),
                child: Text(l.addToDiary),
              ),
            ),
          ],
        ),
      ),
    );
    if (grams == null || grams <= 0 || !context.mounted) return;
    app.addFood(food, grams);
    _search.clear();
    setState(() {});
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l.entryAdded(food.name(app.lang)))));
  }

  Future<void> _openAi(BuildContext context) async {
    final saved = await Navigator.of(context).push<bool>(
        MaterialPageRoute(builder: (_) => const AiLogScreen()));
    if (saved == true) setState(() {});
  }

  Future<void> _openWeight(BuildContext context) async {
    final l = context.l10n;
    final app = context.app;
    final weight =
        TextEditingController(text: app.profile.weightKg.toStringAsFixed(1));
    final waist =
        TextEditingController(text: app.profile.waistCm.toStringAsFixed(0));
    final ok = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(
            20, 20, 20, 20 + MediaQuery.of(ctx).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l.logWeight, style: Theme.of(ctx).textTheme.titleLarge),
            const SizedBox(height: 16),
            TextField(
              controller: weight,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                  labelText: l.weightKg, border: const OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: waist,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                  labelText: l.waistCm, border: const OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                  onPressed: () => Navigator.pop(ctx, true),
                  child: Text(l.save)),
            ),
          ],
        ),
      ),
    );
    final w = double.tryParse(weight.text.replaceAll(',', '.'));
    if (ok != true || w == null || !context.mounted) return;
    app.addMeasurement(w, double.tryParse(waist.text.replaceAll(',', '.')));
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(l.weightSaved)));
  }
}

/// FR-40 flow: describe a meal, review the proposed foods, confirm.
class AiLogScreen extends StatefulWidget {
  const AiLogScreen({super.key, this.initialText = ''});

  /// Pre-filled description; when set, the proposal is shown at once.
  final String initialText;

  @override
  State<AiLogScreen> createState() => _AiLogScreenState();
}

class _AiLogScreenState extends State<AiLogScreen> {
  late final _text = TextEditingController(text: widget.initialText);
  List<(Food, double)>? _proposal;

  @override
  void initState() {
    super.initState();
    if (widget.initialText.isNotEmpty) _propose();
  }

  void _propose() {
    _proposal = [
      for (final f in simulateAiProposal(_text.text)) (f, f.defaultPortionG)
    ];
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final app = context.app;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l.aiLogging)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          NoteBanner(text: l.aiSimulatedNote),
          TextField(
            controller: _text,
            minLines: 2,
            maxLines: 4,
            decoration: InputDecoration(
                hintText: l.aiHint, border: const OutlineInputBorder()),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () => setState(_propose),
            icon: const Icon(Icons.auto_awesome_outlined),
            label: Text(l.aiPropose),
          ),
          if (_proposal != null) ...[
            const SizedBox(height: 20),
            Text(l.aiProposalTitle, style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            if (_proposal!.isEmpty) Text(l.aiNothing),
            for (var i = 0; i < _proposal!.length; i++)
              _ProposalRow(
                food: _proposal![i].$1,
                grams: _proposal![i].$2,
                lang: app.lang,
                onChanged: (g) => _proposal![i] = (_proposal![i].$1, g),
                onRemove: () => setState(() => _proposal!.removeAt(i)),
              ),
            const SizedBox(height: 12),
            if (_proposal!.isNotEmpty)
              FilledButton(
                onPressed: () {
                  for (final (f, g) in _proposal!) {
                    app.addFood(f, g);
                  }
                  Navigator.pop(context, true);
                },
                child: Text(l.aiConfirm),
              ),
          ],
        ],
      ),
    );
  }
}

class _ProposalRow extends StatelessWidget {
  const _ProposalRow({
    required this.food,
    required this.grams,
    required this.lang,
    required this.onChanged,
    required this.onRemove,
  });

  final Food food;
  final double grams;
  final String lang;
  final ValueChanged<double> onChanged;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(children: [
        Expanded(child: Text(food.name(lang))),
        SizedBox(
          width: 90,
          child: TextFormField(
            initialValue: grams.toStringAsFixed(0),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              suffixText: context.l10n.g,
              isDense: true,
              border: const OutlineInputBorder(),
            ),
            onChanged: (v) {
              final g = double.tryParse(v.replaceAll(',', '.'));
              if (g != null) onChanged(g);
            },
          ),
        ),
        IconButton(onPressed: onRemove, icon: const Icon(Icons.close)),
      ]),
    );
  }
}
