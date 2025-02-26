import 'package:flutter/material.dart';
import 'package:new_flutter/dummy_data/dummy_data.dart';
import 'package:new_flutter/model/ride/ride.dart';
import 'package:new_flutter/model/ride_pref/ride_pref.dart';

class RideScreen extends StatelessWidget {
  final RidePref? ridePref;

  const RideScreen({Key? key, this.ridePref}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Ride> matchingRides = fakeRides;

    return Scaffold(
      appBar: AppBar(title: Text("Matching Rides")),
      body: matchingRides.isNotEmpty
          ? ListView.builder(
              itemCount: matchingRides.length,
              itemBuilder: (context, index) {
                Ride ride = matchingRides[index];
                return ListTile(
                  title: Text("${ride.departureLocation.name} → ${ride.arrivalLocation.name}"),
                  subtitle: Text(
                    "Date: ${ride.departureDate}\nSeats: ${ride.availableSeats}\nPrice: €${ride.pricePerSeat}"
                  ),
                  trailing: Icon(Icons.directions_car),
                  onTap: () {
                    // Handle ride selection if needed
                  },
                );
              },
            )
          : Center(child: Text("No matching rides found")),
    );
  }

  List<Ride> getMatchingRides(RidePref ridePref) {
    return fakeRides.where((ride) {
      return ride.departureLocation.name == ridePref.departure.name &&
          ride.arrivalLocation.name == ridePref.arrival.name &&
          ride.departureDate.day == ridePref.departureDate.day &&
          ride.departureDate.month == ridePref.departureDate.month &&
          ride.departureDate.year == ridePref.departureDate.year &&
          ride.availableSeats >= ridePref.requestedSeats;
    }).toList();
  }
}
