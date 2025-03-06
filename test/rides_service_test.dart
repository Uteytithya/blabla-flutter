import 'package:new_flutter/WEEK-2/dummy_data/dummy_data.dart';
import 'package:new_flutter/WEEK-2/repository/mock/mock_rides_repository.dart';
import 'package:test/test.dart';
import 'package:new_flutter/WEEK-2/service/rides_service.dart';
import 'package:new_flutter/WEEK-2/model/ride_pref/ride_pref.dart';

void main() {
  group('RidesServices Tests', () {
    RidesService.initialize(MockRidesRepository());

    test('T1: Fetch rides and ensure 4 results with available seats are displayed', () {
      final preference = RidePreference(
        departure: fakeCambodiaLocations[2], // Battambang
        departureDate: DateTime.now(),
        arrival: fakeCambodiaLocations[1], // Siem Reap
        requestedSeats: 1,
      );

      final results = RidesService.instance.getRides(preference, null, null);

      expect(results.length, equals(4));
    });

    test('T2: Fetch rides with pet filter and ensure 1 result is displayed', () {
      final preference = RidePreference(
        departure: fakeCambodiaLocations[2], // Battambang
        departureDate: DateTime.now(),
        arrival: fakeCambodiaLocations[1], // Siem Reap
        requestedSeats: 1,
      );

      final petFilter = RidesFilter(acceptPets: true);
      final filteredResults = RidesService.instance.getRides(preference, petFilter, null)
          .where((ride) => ride.filter.acceptPets)
          .toList();

      expect(filteredResults.length, equals(1));
    });
  });
}