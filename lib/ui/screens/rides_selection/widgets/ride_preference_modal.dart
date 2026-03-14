import 'package:blabla/ui/widgets/pickers/bla_ride_preference_picker.dart';
import 'package:flutter/material.dart';

import '../../../../model/ride_pref/ride_pref.dart';
import '../../../theme/theme.dart';
import '../../../widgets/buttons/bla_icon_button.dart';

//
// Wrap the ride preference picker within a modal
//
class RidePreferenceModal extends StatelessWidget {
  const RidePreferenceModal({super.key, required this.initialPreference});

  final RidePreference? initialPreference;

  void onBackSelected(BuildContext context) {
    Navigator.of(context).pop();
  }

  void onRidePreferenceSelected(BuildContext context, RidePreference newPreference,) {
    Navigator.of(context).pop<RidePreference>(newPreference);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back icon
            BlaIconButton(
              onPressed: () => onBackSelected(context),
              icon: Icons.close,
            ),
            SizedBox(height: BlaSpacings.m),

            // Title
            Text(
              "Edit your search",
              style: BlaTextStyles.title.copyWith(color: BlaColors.textNormal),
            ),

            // Form
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: BlaRidePreferencePicker(
                  initRidePreference: initialPreference,
                  onRidePreferenceSelected: (newPreference) =>
                      onRidePreferenceSelected(context, newPreference),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
