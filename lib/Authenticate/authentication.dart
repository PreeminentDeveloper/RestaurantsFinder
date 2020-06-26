import 'package:restaurants_finder/Authenticate/login.dart';
import 'package:restaurants_finder/Authenticate/signup.dart';
import 'package:restaurants_finder/Screens/Services/auth.dart';
import 'package:restaurants_finder/Shared/loading.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LandingPage();
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final AuthService _auth = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: Container(
              child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 70.0),
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Restaurant Finder",
                          style:
                              TextStyle(fontSize: 40.0, color: Colors.pinkAccent),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        SizedBox(
                          height: 80.0,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Navigate to Restaurants nearby",
                            style: TextStyle(fontSize: 30.0), textAlign: TextAlign.justify,
                          ),
                        ),
                        SizedBox(
                          height: 80.0,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: OutlineButton(
                                  padding: EdgeInsets.only(
                                      top: 14.0,
                                      bottom: 14.0,
                                      left: 48.0,
                                      right: 48.0),
                                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                                  highlightedBorderColor: Colors.black54,
                                  highlightColor: Colors.black12,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0)),
                                  child: Text(
                                    "LOG IN",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Login()));
                                  }),
                            ),
                            SizedBox(
                              width: 13.0,
                            ),
                            Expanded(
                              child: FlatButton(
                                  color: Colors.pinkAccent,
                                  padding: EdgeInsets.only(
                                      top: 15.0,
                                      bottom: 15.0,
                                      left: 48.0,
                                      right: 48.0),
                                  highlightColor: Colors.pinkAccent.shade100,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0)),
                                  child: Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                SignUp()));
                                  }),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ]),
            ),
          );
  }

  Widget getAssetImage(String path, double height) {
    AssetImage assetImage = AssetImage(path);
    Image image = Image(
      image: assetImage,
      height: height,
    );
    return image;
  }
}
