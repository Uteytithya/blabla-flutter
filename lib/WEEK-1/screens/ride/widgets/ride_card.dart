import 'package:flutter/material.dart';
import 'package:new_flutter/model/ride/ride.dart';

class RideCard extends StatelessWidget {
  final Ride ride;
  final VoidCallback onTap;

  const RideCard({super.key, required this.ride, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Departure: ${ride.departureLocation}", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Arrival: ${ride.arrivalLocation}"),
              Text("Time: ${ride.departureDate}"),
              Text("Seats: ${ride.availableSeats}"),
            ],
          ),
        ),
      ),
    );
  }
}
