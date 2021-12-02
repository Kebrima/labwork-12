import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget{
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>{
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(43.233074, 76.890443),
    zoom: 13.0
  );

  List<Marker> markers = [];

  @override
  void initState() {
    initilize();
    super.initState();
  }

  initilize() {
    Marker first = Marker(
      markerId: MarkerId('first'),
      position: LatLng(43.249024, 76.868368),
      infoWindow: InfoWindow(title: 'First'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    Marker second = Marker(
      markerId: MarkerId('second'),
      position: LatLng(43.226415, 76.873059),
      infoWindow: InfoWindow(title: 'Second'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    markers.add(first);
    markers.add(second);
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 110,
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text('7food на карте',
                      style: TextStyle(
                        fontSize: 23,
                      ),
                    ),
                    centerTitle: true,
                    backgroundColor: Color.fromRGBO(71, 81, 109, 1),
                    elevation: 0,
                    bottom: TabBar(
                        unselectedLabelColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color.fromRGBO(71, 81, 109, 1)),
                        tabs: [
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Список",
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text("На карте",
                                    style: TextStyle(
                                      fontSize: 17,)
                                )
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              height: 552,
              width: 1000,
              child: GoogleMap(
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                initialCameraPosition: _initialCameraPosition,
                markers: markers.map((e) => e).toSet(),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        height: 75.0,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.qr_code, size: 30),
          Icon(Icons.person, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.indigo,
        backgroundColor: Color.fromRGBO(192,192,192,1),
        animationCurve: Curves.easeInOut,
        onTap: (index) {},
        letIndexChange: (index) => true,
      ),
    );
  }
}