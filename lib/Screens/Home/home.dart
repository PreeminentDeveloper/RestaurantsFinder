import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurants_finder/Screens/restaurants_details.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GoogleMapController mapController;
  String searchAddress;

  List<Marker> marker = [];
  int id = Random().nextInt(100);

  addMarker(coordinate) {
    marker
        .add(Marker(
          position: coordinate,
          markerId: MarkerId(id.toString()),
          infoWindow: InfoWindow(snippet: "go here")
          ));
  }

  searchNavigate() {
    Geolocator().placemarkFromAddress(searchAddress).then((result) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(
            result[0].position.latitude,
            result[0].position.longitude
          ),
          zoom: 10.0)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
              onMapCreated: (controller) {
                setState(() {
                  mapController = controller;
                });
              },
              onTap: (coordinate) {
                setState(() {
                  mapController
                      .animateCamera(CameraUpdate.newLatLng(coordinate));
                  addMarker(coordinate);
                });
              },
              initialCameraPosition: CameraPosition(
                  target: LatLng(6.45407, 3.39467), zoom: 12.0),
              mapType: MapType.normal,
              markers: marker.toSet()),
          Positioned(
            top: 35.0,
            right: 15.0,
            left: 15.0,
            child: GestureDetector(
              onTap: (){
                Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => RestaurantsDetail()));
              },
              child: Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1.0, 2.0),
                        blurRadius: 5,
                        spreadRadius: 1
                      )
                    ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.location_on),
                      SizedBox(width: 10.0),
                      Text("Navigate to Restaurants"),
                    ],
                  ),
                )
              ),
            ),
          )
        ],
      )
    );
  }
}
