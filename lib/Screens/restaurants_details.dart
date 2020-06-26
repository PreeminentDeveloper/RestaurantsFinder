import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurants_finder/Screens/search_restaurants.dart';

class RestaurantsDetail extends StatefulWidget {
  @override
  _RestaurantsDetailState createState() => _RestaurantsDetailState();
}

class _RestaurantsDetailState extends State<RestaurantsDetail> {

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurants Finder"),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => SearchRestaurants()));
              }),
        ],
      ), 
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh3.googleusercontent.com/c40DpUUe5OfDCgkvpiLYN6QNMrNBYY5hjmbeX3HrhpLgmNgVnosi96ILz3R70jRUlaeGYakt=w1080-h608-p-no-v0",
                  6.514436, 3.374376,"Calabar Kitchen"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://hotels.ng/places/media/poi/4153/contact_yaba-4153-585a3116d1cdf.jpg?w=300",
                  6.511437, 3.377608,"Domino's Pizza Yaba"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh3.googleusercontent.com/Tqo2_wUdB6OXS9k_h-h8NyIjSIphg7-nNCuOS_3kAuKgvtbW7Vv8C5domr8DJdBhrBzi_fnQGu-r_hjP=w1080-h608-p-no-v0",
                  6.521348, 3.370459,"Ashbol Foods"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://files.ofadaa.com/uploads/restaurant_cover_image/file/352/header_chicken-republic-ofadaa.jpg",
                  6.506344, 3.374265,"Chicken Republic"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat,double long,String restaurantName) {
    return  GestureDetector(
        onTap: () {
          _gotoLocation(lat,long);
        },
        child:Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 250,
                          height: 250,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(_image,),
                            ),
                          ),),
                          Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: myDetailsContainer1(restaurantName),
                          ),
                        ),

                      ],)
                ),
              ),
            ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(restaurantName,
            style: TextStyle(
                color: Color(0xff6200ee),
                fontSize: 26.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(height:5.0),
        Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "4.1",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20.0,
                ),
              )),
              Container(
                child: Icon(
                  Icons.restaurant,
                  color: Colors.amber,
                  size: 17.0,
                ),
              ),
              Container(
                child: Icon(
                  Icons.restaurant,
                  color: Colors.amber,
                  size: 17.0,
                ),
              ),
              Container(
                child: Icon(
                  Icons.restaurant,
                  color: Colors.amber,
                  size: 17.0,
                ),
              ),
              Container(
                child: Icon(
                  Icons.restaurant,
                  color: Colors.amber,
                  size: 17.0,
                ),
              ),
              Container(
                child: Icon(
                  Icons.restaurant,
                  color: Colors.amber,
                  size: 17.0,
                ),
              ),
               Container(
                  child: Text(
                "(946)",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20.0,
                ),
              )),
            ],
          )),
          SizedBox(height:5.0),
        Container(
                  child: Text(
                "Nigerian \u00B7 ₦₦ \u00B7 1.1 mi",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20.0,
                ),
              )),
              SizedBox(height:5.0),
        Container(
            child: Text(
          "Open \u00B7 Closes 10:00 PM",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(6.516722, 3.388096), zoom: 13),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          sofreshMarker,sweetMarker,iyanMarker,calabarMarker,dominoMarker,dodoMarker, chickenMarker
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }

}

Marker calabarMarker = Marker(
  markerId: MarkerId('Calabar Kitchen'),
  position: LatLng(6.514436, 3.374376),
  infoWindow: InfoWindow(title: 'Calabar Kitchen'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker dominoMarker = Marker(
  markerId: MarkerId("Domino's Pizza Yaba"),
  position: LatLng(6.511437, 3.377608),
  infoWindow: InfoWindow(title: "Domino's Pizza Yaba"),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker dodoMarker = Marker(
  markerId: MarkerId('Ashbol Foods'),
  position: LatLng(6.521348, 3.370459),
  infoWindow: InfoWindow(title: "Ashbol Foods"),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker chickenMarker = Marker(
  markerId: MarkerId('Chicken Republic'),
  position: LatLng(6.506344, 3.374265),
  infoWindow: InfoWindow(title: "Chicken Republic"),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//New York Marker

Marker sofreshMarker = Marker(
  markerId: MarkerId('So Fresh Yaba'),
  position: LatLng(6.503123, 3.377708),
  infoWindow: InfoWindow(title: 'So Fresh Yaba'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker chineseMarker = Marker(
  markerId: MarkerId('Chinese Restaurant'),
  position: LatLng(6.497147, 3.364172),
  infoWindow: InfoWindow(title: 'Chinese Restaurant'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker sweetMarker = Marker(
  markerId: MarkerId('Sweet Sensation'),
  position: LatLng(6.499839, 3.378519),
  infoWindow: InfoWindow(title: 'Sweet Sensation'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker iyanMarker = Marker(
  markerId: MarkerId('Iyan Aladuke'),
  position: LatLng(6.501880, 3.375426),
  infoWindow: InfoWindow(title: 'Iyan Aladuke'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
