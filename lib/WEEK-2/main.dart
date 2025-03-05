import 'package:flutter/material.dart';
import 'package:new_flutter/WEEK-2/service/rides_service.dart';
import 'package:new_flutter/WEEK-2/repository/mock/mock_locations_repository.dart';
import 'package:new_flutter/WEEK-2/repository/mock/mock_rides_repository.dart';
import 'package:new_flutter/WEEK-2/service/locations_service.dart';
import 'package:new_flutter/WEEK-2/repository/mock/mock_ride_preferences_repository.dart';

import 'screens/ride_pref/ride_pref_screen.dart';
import 'service/ride_prefs_service.dart';
import 'theme/theme.dart';

void main() {

  // 1 - Initialize the ride pref services
  RidePrefService.initialize(MockRidePreferencesRepository());

  // 2. Initialize the locations service
  LocationsService.initialize(MockLocationsRepository());

  // 3. Initialize the rides service
  RidesService.initialize(MockRidesRepository());

  // 3- Run the UI
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(body: RidePrefScreen()),
    );
  }
}
