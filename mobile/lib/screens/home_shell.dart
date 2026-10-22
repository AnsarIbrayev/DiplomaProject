import 'package:flutter/material.dart';

import '../widgets/common.dart';
import 'checkin_screen.dart';
import 'factors_screen.dart';
import 'log_screen.dart';
import 'plan_screen.dart';
import 'progress_screen.dart';
import 'settings_screen.dart';
import 'today_screen.dart';

enum HomeTab { today, log, factors, plan, progress }

/// Bottom navigation. The control arm (FR-31) has no Factors and Plan tabs.
class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => HomeShellState();
}

class HomeShellState extends State<HomeShell> {
  HomeTab _tab = HomeTab.today;

  void open(HomeTab tab) => setState(() => _tab = tab);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _openDemoScreen());
  }

  /// Opens the screen requested by a demo link (see AppState.applyDemoLink).
  void _openDemoScreen() {
    final app = context.app;
    final screen = app.demoScreen;
    app.demoScreen = null;
    final nav = Navigator.of(context);
    switch (screen) {
      case 'log':
        open(HomeTab.log);
      case 'factors':
        open(HomeTab.factors);
      case 'plan':
        open(HomeTab.plan);
      case 'progress':
        open(HomeTab.progress);
      case 'settings':
        openSettings(context);
      case 'why':
        open(HomeTab.plan);
        showWhySheet(context, app.recommendations.first);
      case 'ai':
        open(HomeTab.log);
        nav.push(MaterialPageRoute(
            builder: (_) => AiLogScreen(initialText: context.l10n.aiHint
                .replaceFirst(RegExp(r'^(e\.g\.|например:|мысалы:)\s*'), ''))));
      case 'checkin':
        nav.push(MaterialPageRoute(builder: (_) => const CheckInScreen()));
      case 'referral':
        app.submitCheckIn(adverseEvent: true, newExclusion: false);
        nav.push(MaterialPageRoute(
            builder: (_) => const CheckInScreen(presetReferral: true)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final app = context.app;
    final tabs = [
      HomeTab.today,
      HomeTab.log,
      if (app.isIntervention) ...[HomeTab.factors, HomeTab.plan],
      HomeTab.progress,
    ];
    if (!tabs.contains(_tab)) _tab = HomeTab.today;

    final (body, title) = switch (_tab) {
      HomeTab.today => (TodayScreen(onOpen: open), l.navToday),
      HomeTab.log => (const LogScreen(), l.logTitle),
      HomeTab.factors => (const FactorsScreen(), l.factorsTitle),
      HomeTab.plan => (const PlanScreen(), l.planTitle),
      HomeTab.progress => (const ProgressScreen(), l.progressTitle),
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            tooltip: l.navSettings,
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => openSettings(context),
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(24),
          child: DemoStrip(),
        ),
      ),
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: tabs.indexOf(_tab),
        onDestinationSelected: (i) => open(tabs[i]),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: [
          for (final t in tabs)
            switch (t) {
              HomeTab.today => NavigationDestination(
                  icon: const Icon(Icons.today_outlined), label: l.navToday),
              HomeTab.log => NavigationDestination(
                  icon: const Icon(Icons.restaurant_outlined),
                  label: l.navLog),
              HomeTab.factors => NavigationDestination(
                  icon: const Icon(Icons.insights_outlined),
                  label: l.navFactors),
              HomeTab.plan => NavigationDestination(
                  icon: const Icon(Icons.checklist_outlined),
                  label: l.navPlan),
              HomeTab.progress => NavigationDestination(
                  icon: const Icon(Icons.show_chart), label: l.navProgress),
            },
        ],
      ),
    );
  }
}

void openSettings(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.settingsTitle),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(24),
          child: DemoStrip(),
        ),
      ),
      body: const SettingsScreen(),
    ),
  ));
}
