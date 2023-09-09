import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class StateManager {
  String monitorKey = 'monitor';
  String cpuKey = 'cpu';
  String asKey = 'as';
  String chargerKey = 'charger';

  static bool _monitor = false;
  static bool _cpu = false;
  static bool _as = false;
  static bool _charger = false;
  static StreamController<List<bool>> streamController =
      StreamController<List<bool>>.broadcast();

  bool get monitor => _monitor;
  bool get cpu => _cpu;
  bool get as => _as;
  bool get charger => _charger;

  Stream<List<bool>> getStream() {
    return streamController.stream;
  }

  Future<void> updateStream() async {
    streamController.sink.add([_monitor, _cpu, _as, _charger]);
  }

  void updateState({
    int? monitor,
    int? cpu,
    int? as,
    int? charger,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    if (monitor != null) {
      _monitor = !_monitor;
      await prefs.setBool(monitorKey, _monitor);
    } else if (cpu != null) {
      _cpu = !_cpu;
      await prefs.setBool(cpuKey, _cpu);
    } else if (as != null) {
      _as = !_as;
      await prefs.setBool(asKey, _as);
    } else if (charger != null) {
      _charger = !_charger;
      await prefs.setBool(chargerKey, _charger);
    }
    updateStream();
  }

  Future<void> restoreOldState() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(monitorKey)) {
      await prefs.setBool(monitorKey, false);
      // print('no monitor key');
    } else {
      _monitor = prefs.getBool(monitorKey)!;
      //print('Monitor: $_monitor');
    }

    if (!prefs.containsKey(cpuKey)) {
      await prefs.setBool(cpuKey, false);
      //print('no cpu key');
    } else {
      _cpu = prefs.getBool(cpuKey)!;
      //print('CPU: $_cpu');
    }

    if (!prefs.containsKey(asKey)) {
      await prefs.setBool(asKey, false);
      // print('no as key');
    } else {
      _as = prefs.getBool(asKey)!;
      // print('AS: $_as');
    }

    if (!prefs.containsKey(chargerKey)) {
      await prefs.setBool(chargerKey, false);
      // print('no charger key');
    } else {
      _charger = prefs.getBool(chargerKey)!;
      //print('Charger: $_charger');
    }
    updateStream();
  }
}
