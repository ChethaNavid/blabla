import 'package:blabla/data/repositories/location/location_repository.dart';
import 'package:blabla/data/repositories/location/location_repository_mock.dart';
import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/data/repositories/ride/ride_repository_mock.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository_mock.dart';
import 'package:blabla/main_common.dart';
import 'package:blabla/ui/screens/home/view_model/home_view_model.dart';
import 'package:blabla/ui/screens/rides_selection/view_model/ride_selection_view_model.dart';
import 'package:blabla/ui/states/ride_preferences_state.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

List<SingleChildWidget> get devProviders {
  return [
    // 1. Inject location repository
    Provider<LocationRepository>(create: (context) => LocationRepositoryMock()),

    // 2. Inject ride repository
    Provider<RideRepository>(create: (context) => RideRepositoryMock()),

    // 3. Inject ridePref repository
    Provider<RidePreferenceRepository>(
      create: (context) => RidePreferenceRepositoryMock(),
    ),

    // 4. Inject ridePref state
    ChangeNotifierProvider<RidePreferencesState>(
      create: (context) =>
          RidePreferencesState(context.read<RidePreferenceRepository>())
            ..init(),
    ),

    // 5. Inject home viewModel
    ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(
        ridePreferencesState: context.read<RidePreferencesState>(),
      ),
    ),

    // 6. Inject ride selection viewModel
    ChangeNotifierProvider<RideSelectionViewModel>(
      create: (context) => RideSelectionViewModel(
        ridePreferencesState: context.read<RidePreferencesState>(),
        rideRepository: context.read<RideRepository>(),
      )..init(),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
