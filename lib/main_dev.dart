import 'package:blabla/data/repositories/location/location_repository.dart';
import 'package:blabla/data/repositories/location/location_repository_mock.dart';
import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/data/repositories/ride/ride_repository_mock.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository_mock.dart';
import 'package:blabla/main_common.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

List<SingleChildWidget> get devProviders {
  return [
    // 1. Inject location repository
    Provider<LocationRepository>(create: (context) => LocationRepositoryMock()),

    // 2. Inject ride repository
    Provider<RideRepository>(create: (context) => RideRepositoryMock()),

    // 3. Inject ridePref repository
    Provider<RidePreferenceRepository>(create: (context) => RidePreferenceRepositoryMock())
  ];
}

void main() {
  mainCommon(devProviders);
}