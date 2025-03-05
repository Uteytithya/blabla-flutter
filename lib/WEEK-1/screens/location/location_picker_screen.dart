import 'package:flutter/material.dart';
import 'package:new_flutter/screens/global_widget/bla_button.dart';
import 'package:new_flutter/theme/theme.dart';
import '../../../model/ride/locations.dart';

class LocationPicker extends StatefulWidget {
  final Function(Location) onLocationSelected;
  final Location? previousLocation; // Keep track of the last selection

  const LocationPicker(
      {super.key, required this.onLocationSelected, this.previousLocation});

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  String searchQuery = "";
  List<Location> allLocations = [
    Location(name: "Paris", country: Country.france),
    Location(name: "Lyon", country: Country.france),
    Location(name: "Marseille", country: Country.france),
    Location(name: "Toulouse", country: Country.france),
    Location(name: "Nice", country: Country.france),
    Location(name: "Nantes", country: Country.france),
    Location(name: "Montpellier", country: Country.france),
    Location(name: "Strasbourg", country: Country.france),
    Location(name: "Bordeaux", country: Country.france),
    Location(name: "Lille", country: Country.france),
    Location(name: "Rennes", country: Country.france),
    Location(name: "Reims", country: Country.france),
    Location(name: "Le Havre", country: Country.france),
    Location(name: "Saint-Etienne", country: Country.france),
    Location(name: "Toulon", country: Country.france),
    Location(name: "Grenoble", country: Country.france),
    Location(name: "Dijon", country: Country.france),
    Location(name: "Angers", country: Country.france),
  ];

  @override
  Widget build(BuildContext context) {
    /// filter locations only when input exist and query only when input is 2 characters or more
    List<Location> filteredLocations = searchQuery.length <= 1
        ? [] // Show nothing if search is empty
        : allLocations
            .where((loc) => loc.name.toLowerCase().contains(searchQuery.toLowerCase()))
            .toList();

    /// previous location is shown at the top if it exists
    if (widget.previousLocation != null &&
        !filteredLocations.contains(widget.previousLocation)) {
      filteredLocations.insert(0, widget.previousLocation!);
    }

    return Scaffold(
      appBar: AppBar(title: Text("Location Picker")),
      body: Padding(
        padding: const EdgeInsets.all(BlaSpacings.m),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search location...",
                prefixIcon: Icon(Icons.search),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => setState(() => searchQuery = ""),
                      )
                    : null,
              ),
              onChanged: (value) => setState(() => searchQuery = value),
            ),
            SizedBox(height: BlaSpacings.m),
            Expanded(
              child: filteredLocations.isEmpty
                  ? widget.previousLocation != null
                      ? Column(
                          children: [
                            BlaButton(
                              text: widget.previousLocation!.name,
                              icon: Icons.access_time, 
                              onTap: () {
                                widget.onLocationSelected(widget.previousLocation!);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        )
                      : Center(child: Text("No results found"))
                  : ListView.builder(
                      itemCount: filteredLocations.length,
                      itemBuilder: (context, index) {
                        final location = filteredLocations[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: BlaButton(
                            text: location.name,
                            icon: index == 0 && widget.previousLocation != null
                                ? Icons.access_time 
                                : Icons.location_on,
                            onTap: () {
                              widget.onLocationSelected(location);
                              Navigator.pop(context);
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
