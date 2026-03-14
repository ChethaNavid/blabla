import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/states/ride_preferences_state.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePreferencesState ridePreferencesState;

  HomeViewModel({required this.ridePreferencesState});

  RidePreference? get selectedRidePref =>
      ridePreferencesState.selectedPreference;
  List<RidePreference> get prefHistory =>
      ridePreferencesState.preferenceHistory;

  void selectPreference(RidePreference preference) {
    ridePreferencesState.selectPreference(preference);
    notifyListeners();
  }
}
