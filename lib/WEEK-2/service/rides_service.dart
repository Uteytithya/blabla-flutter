import 'package:new_flutter/WEEK-2/model/ride_pref/ride_pref.dart';
import 'package:new_flutter/WEEK-2/repository/rides_repository.dart';

import '../dummy_data/dummy_data.dart';
import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {
  static RidesService? _instance;

  final RidesRepository repository;

  RidesService._internal(this.repository) {}

  List<Ride> getRides(RidePreference preferences, RidesFilter? filter) {
    return repository.getRides(preferences, filter);
  }

  static RidesService get instance {
    if (_instance == null) {
      throw Exception("You should initialize your service first. Please call the initializer");
    }
    return _instance!;
  }

  static void initialize(RidesRepository repository) {
    _instance ??= RidesService._internal(repository);
  }
}

class RidesFilter {
  final bool acceptPets;

  RidesFilter({
    required this.acceptPets
  });
}