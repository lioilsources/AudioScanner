import 'package:flutter/material.dart';

import 'app_state.dart';
import 'l10n/l10n.dart';
import 'store/session_store.dart';
import 'ui/design_screen.dart';
import 'ui/impulse_screen.dart';
import 'ui/map_screen.dart';
import 'ui/rta_screen.dart';
import 'ui/scan_screen.dart';
import 'ui/signals_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AudioScannerApp());
}

class AudioScannerApp extends StatefulWidget {
  const AudioScannerApp({super.key});

  @override
  State<AudioScannerApp> createState() => _AudioScannerAppState();
}

class _AudioScannerAppState extends State<AudioScannerApp> {
  final _state = AppState();
  SessionStore? _store;

  @override
  void initState() {
    super.initState();
    SessionStore.forApp().then((store) async {
      await _state.attachStore(store);
      if (mounted) setState(() => _store = store);
    });
  }

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AudioScanner',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) {
        // AppState formats its own error messages, so it needs the current
        // locale's strings outside the widget tree.
        _state.l10n = AppLocalizations.of(context);
        return child!;
      },
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF2B6CB0),
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: const Color(0xFF2B6CB0),
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: _Home(state: _state, store: _store),
    );
  }
}

class _Home extends StatefulWidget {
  const _Home({required this.state, required this.store});

  final AppState state;
  final SessionStore? store;

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      RtaScreen(state: widget.state),
      ScanScreen(state: widget.state),
      MapScreen(state: widget.state, store: widget.store),
      ImpulseScreen(state: widget.state, store: widget.store),
      DesignScreen(state: widget.state, store: widget.store),
      SignalsScreen(store: widget.store),
    ];

    return Scaffold(
      body: IndexedStack(index: _tab, children: screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (i) => setState(() => _tab = i),
        destinations: [
          NavigationDestination(
              icon: const Icon(Icons.graphic_eq), label: context.l10n.tabAnalyzer),
          NavigationDestination(
              icon: const Icon(Icons.view_in_ar_outlined), label: context.l10n.tabScan),
          NavigationDestination(
              icon: const Icon(Icons.map_outlined), label: context.l10n.tabMap),
          NavigationDestination(
              icon: const Icon(Icons.timeline), label: context.l10n.tabResponse),
          NavigationDestination(
              icon: const Icon(Icons.architecture), label: context.l10n.tabDesign),
          NavigationDestination(
              icon: const Icon(Icons.waves), label: context.l10n.tabSignals),
        ],
      ),
    );
  }
}
