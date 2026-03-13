import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

class RidePreferenceRepositoryMock implements RidePreferenceRepository{
  RidePreference? _selectedPreference;
  final List<RidePreference> _preferenceHistory = [];
  static final int maxAllowedSeats = 8;

  @override
  RidePreference? getSelectedPreference() {
    return _selectedPreference;
  }

  @override
  List<RidePreference> getpreferenceHistory() {
    return _preferenceHistory;
  }

  void _addPreferenceToHistory(RidePreference preference) {
    _preferenceHistory.add(preference);
  }

  @override
  void selectPreference(RidePreference preference) {
    if (preference != _selectedPreference) {
      // Set the selected preference
      _selectedPreference = preference;

      // Push to history
      _addPreferenceToHistory(preference);
    }
  }
}