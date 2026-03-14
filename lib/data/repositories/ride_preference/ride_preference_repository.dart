import 'package:blabla/model/ride_pref/ride_pref.dart';

abstract class RidePreferenceRepository {
  int get maxAllowedSeats;
  RidePreference? getSelectedPreference();
  List<RidePreference> getpreferenceHistory();
  void selectPreference(RidePreference preference);
}
