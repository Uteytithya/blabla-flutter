import 'package:new_flutter/WEEK-2/model/ride/locations.dart';

abstract class LocationsRepository {
  List<Location> getLocations();
}