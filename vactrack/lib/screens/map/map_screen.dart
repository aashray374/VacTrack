import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:vactrack/models/hospital.dart';
import 'package:vactrack/services/child_sample_data.dart';

import '../../const.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final List<Hospital> hospitals = SampleData().hospitalData;
  final List<LatLng> markerPositions = [];
  int selectedHospitalIndex = 0;
  final PageController _pageController = PageController();

  void fillData() {
    for (int i = 0; i < hospitals.length; i++) {
      markerPositions.add(LatLng(hospitals[i].lat, hospitals[i].long));
    }
  }

  @override
  void initState() {
    super.initState();
    fillData();
  }

  @override
  Widget build(BuildContext context) {
    // Generate marker list from LatLng coordinates
    final markers = markerPositions.asMap().entries.map((entry) {
      int index = entry.key;
      LatLng position = entry.value;
      return Marker(
        point: position,
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedHospitalIndex = index;
            });
            _pageController.jumpToPage(index);
          },
          child: const Icon(
            Icons.location_pin,
            size: 60,
            color: Colors.red,
          ),
        ),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.appBarTitles[0]),
        elevation: 4,
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: markerPositions[0],
              initialZoom: 12,
            ),
            children: [
              openStreetMapTileLayer,
              MarkerLayer(markers: markers),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                itemCount: hospitals.length,
                itemBuilder: (context, index) {
                  final hospital = hospitals[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hospital.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text("Location: ${hospital.location}"),
                          Text("Contact: ${hospital.contactNumber}"),
                          const SizedBox(height: 8),

                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// OpenStreetMap tile layer
TileLayer get openStreetMapTileLayer => TileLayer(
  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
);
