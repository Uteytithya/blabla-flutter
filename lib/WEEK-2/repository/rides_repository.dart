import 'package:new_flutter/WEEK-2/model/ride/ride.dart';
import 'package:new_flutter/WEEK-2/model/ride_pref/ride_pref.dart';
import 'package:new_flutter/WEEK-2/service/rides_service.dart';

abstract class RidesRepository {
  List<Ride> getRides(RidePreference preferences, RidesFilter? filter);
}