import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_flutter/screens/global_widget/bla_button.dart';
import 'package:new_flutter/theme/theme.dart';
 
import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';
 
///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate = DateTime.now();
  Location? arrival;
  int requestedSeats = 1;



  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    if (widget.initRidePref != null) {
      departure = widget.initRidePref!.departure;
      arrival = widget.initRidePref!.arrival;
      departureDate = widget.initRidePref!.departureDate;
      requestedSeats = widget.initRidePref!.requestedSeats;
    } 
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------
 

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------
  

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    DateTime departureDate = widget.initRidePref?.departureDate ?? DateTime.now();
    int requestedSeats = widget.initRidePref?.requestedSeats ?? 1;

    return Container(
      padding: const EdgeInsets.all(BlaSpacings.m),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: BlaSpacings.l),
          Container(
            decoration: BoxDecoration(
              color: BlaColors.white,
              borderRadius: BorderRadius.circular(BlaSpacings.radius),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                )
              ],
            ),
            padding: EdgeInsets.all(BlaSpacings.m),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BlaButton(
                  icon: Icons.location_on,
                  text: "Leaving from",
                  onTap: () {},
                ),
                SizedBox(height: BlaSpacings.s),
                BlaButton(
                  icon: Icons.flag,
                  text: "Going to",
                  onTap: () {},
                ),
                SizedBox(height: BlaSpacings.s),
                BlaButton(
                  icon: Icons.calendar_today,
                  text: DateFormat('EEE, d MMM').format(departureDate),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: departureDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      departureDate = pickedDate;
                    }
                  },
                ),
                SizedBox(height: BlaSpacings.s),
                BlaButton(
                  icon: Icons.person,
                  text: "$requestedSeats Passenger(s)",
                  onTap: () {},
                ),
                SizedBox(height: BlaSpacings.s),
                BlaButton(
                  icon: Icons.search,
                  text: "Search",
                  onTap: () {},
                  isPrimary: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




