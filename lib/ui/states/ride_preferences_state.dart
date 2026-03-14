import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';

class RidePreferencesState extends ChangeNotifier {
  final RidePreferenceRepository _repository;

  RidePreference? _selectedPreference;
  List<RidePreference> _preferenceHistory = [];

  RidePreferencesState(this._repository);

  RidePreference? get selectedPreference => _selectedPreference;
  List<RidePreference> get preferenceHistory => _preferenceHistory;
  int get maxAllowedSeats => _repository.maxAllowedSeats;

  void init() {
    _preferenceHistory = _repository.getpreferenceHistory();
    _selectedPreference = _repository.getSelectedPreference();
    notifyListeners();
  }

  void selectPreference(RidePreference preference) {
    // Only update if different from current
    if (preference != _selectedPreference) {
      _repository.selectPreference(preference);

      // Update local state
      _preferenceHistory = _repository.getpreferenceHistory();
      _selectedPreference = _repository.getSelectedPreference();

      notifyListeners();
    }
  }
}
