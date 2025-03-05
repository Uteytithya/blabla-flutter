import 'package:new_flutter/WEEK-2/dummy_data/dummy_data.dart';
import 'package:new_flutter/WEEK-2/model/ride/ride.dart';
import 'package:new_flutter/WEEK-2/model/ride_pref/ride_pref.dart';
import 'package:new_flutter/WEEK-2/repository/rides_repository.dart';
import 'package:new_flutter/WEEK-2/service/rides_service.dart';

class MockRidesRepository extends RidesRepository {

  @override
  List<Ride> getRides(RidePreference preferences, RidesFilter? filter) {;
    List<Ride> result = [];
    
    // Preference Filtering
    for (var ride in fakeCambodiaRides) {
      if (ride.departureLocation == preferences.departure &&
          ride.arrivalLocation == preferences.arrival &&
          ride.departureDate.isAfter(preferences.departureDate) &&
          ride.availableSeats > 0) {
            // Filter Filtering
        if (filter != null) {
          if (filter.acceptPets == ride.filter.acceptPets) {
            result.add(ride);
          }
        } else {
          result.add(ride);
        }
      }
    }
    return result;
  }
}
