import 'package:flutter/material.dart';
import 'package:new_flutter/WEEK-2/widgets/actions/bla_icon_button.dart';

import '../../../model/ride_pref/ride_pref.dart';
import '../../../theme/theme.dart';
import '../../ride_pref/widgets/ride_pref_form.dart';

class RidePrefModal extends StatefulWidget {
  final RidePreference currentPreference;
  const RidePrefModal({
    super.key,
    // TODO 7 : We should pass the current prefs to this moda;
    required this.currentPreference,
  });

  @override
  State<RidePrefModal> createState() => _RidePrefModalState();
}

class _RidePrefModalState extends State<RidePrefModal> {
  late RidePreference currentSelectedPreference;

  @override
  void initState() {
    super.initState();
    currentSelectedPreference = widget.currentPreference;
  }

  void onBackSelected() {
    Navigator.of(context).pop();
  }

  void onSubmit(RidePreference newPreference) {
    // Update the current selected preference
    setState(() {
      currentSelectedPreference = newPreference;
    });

    // Pop the context and return the updated preference
    Navigator.pop(context, currentSelectedPreference);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(
          left: BlaSpacings.m, right: BlaSpacings.m, top: BlaSpacings.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back icon
          BlaIconButton(
            onPressed: onBackSelected,
            icon: Icons.close,
          ),
          SizedBox(height: BlaSpacings.m),

          // Title
          Text("Edit your search",
              style: BlaTextStyles.title.copyWith(color: BlaColors.textNormal)),

          // Form
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: RidePrefForm(
              initialPreference:
                  currentSelectedPreference, // TODO 7 : We should pass the current prefs to the form
              onSubmit: onSubmit,
            ),
          )),
        ],
      ),
    ));
  }
}
