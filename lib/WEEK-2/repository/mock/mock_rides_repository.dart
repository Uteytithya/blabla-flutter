import 'package:new_flutter/WEEK-2/dummy_data/dummy_data.dart';
import 'package:new_flutter/WEEK-2/model/ride/ride.dart';
import 'package:new_flutter/WEEK-2/model/ride_pref/ride_pref.dart';
import 'package:new_flutter/WEEK-2/repository/rides_repository.dart';
import 'package:new_flutter/WEEK-2/service/rides_service.dart';

class MockRidesRepository extends RidesRepository {
  @override
  List<Ride> getRides(
      RidePreference preferences, RidesFilter? filter, RideSortType? sortType) {
    List<Ride> result = [];

    // Preference Filtering
    for (var ride in fakeCambodiaRides) {
      if (ride.departureLocation == preferences.departure &&
          ride.arrivalLocation == preferences.arrival &&
          (ride.departureDate.isAtSameMomentAs(preferences.departureDate) ||
              ride.departureDate.isAfter(preferences.departureDate)) &&
          ride.availableSeats >= preferences.requestedSeats) {
        // Apply Filter
        if (filter == null || filter.acceptPets == ride.filter.acceptPets) {
          result.add(ride);
        }
      }
    }

    // Apply Sorting Logic
    if (sortType != null) {
      result.sort((a, b) {
        switch (sortType) {
          case RideSortType.earliestDeparture:
            return a.departureDate.compareTo(b.departureDate);
          case RideSortType.lowestPrice:
            return a.pricePerSeat.compareTo(b.pricePerSeat);
          case RideSortType.shortestRide:
            return a.arrivalDateTime
                .difference(a.departureDate)
                .compareTo(b.arrivalDateTime.difference(b.departureDate));
          default:
            return 0;
        }
      });
    }
    return result;
  }
}
