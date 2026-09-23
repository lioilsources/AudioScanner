import 'package:flutter/material.dart';

import 'app_state.dart';
import 'store/session_store.dart';
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
      SignalsScreen(store: widget.store),
    ];

    return Scaffold(
      body: IndexedStack(index: _tab, children: screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (i) => setState(() => _tab = i),
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.graphic_eq), label: 'Analyzátor'),
          NavigationDestination(
              icon: Icon(Icons.view_in_ar_outlined), label: 'Sken'),
          NavigationDestination(icon: Icon(Icons.map_outlined), label: 'Mapa'),
          NavigationDestination(
              icon: Icon(Icons.timeline), label: 'Odezva'),
          NavigationDestination(
              icon: Icon(Icons.waves), label: 'Signály'),
        ],
      ),
    );
  }
}
