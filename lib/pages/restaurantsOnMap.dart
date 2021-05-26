import 'package:flutter/material.dart';
import 'package:flutter_app/app_localizations.dart';
import 'package:flutter_app/models/post_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../extensions/extensions.dart';

class RestaurantOnMapScreen extends StatefulWidget {
  final List? restaurantsList;

  RestaurantOnMapScreen({this.restaurantsList});

  @override
  State<StatefulWidget> createState() => RestaurantOnMapScreenState();
}

class RestaurantOnMapScreenState extends State<RestaurantOnMapScreen> {
  final GlobalKey scaffoldKey = GlobalKey();
  AppLanguage appLanguage = AppLanguage();
  LocalizedData localizedData = LocalizedData();
  Set<Marker> _markers = {};
  List restaurants = [];
  double pinPillPosition = -110;
  String? restName;
  String? restAddress;

  @override
  void initState() {
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    widget.restaurantsList?.forEach((item) {
      if (item.description_restaurants != null) {
        setState(() {
          restaurants.add(item.address_restaurants);
          _markers.add(Marker(
              markerId: MarkerId(item.address_restaurants.placeId),
              position: LatLng(
                  item.address_restaurants.lat, item.address_restaurants.lng),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueCyan),
              onTap: () {
                setState(() {
                  restName = item.description_restaurants;
                  restAddress = item.address_restaurants.address;
                  pinPillPosition = 0;
                });
              }));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    var localized = Provider.of<LocalizedData>(context);
    final RestaurantsOnMap =
        localized.data['${appLanguage.appLocal}RestaurantsOnMap']?.toUpperCase() ?? '';
    ;
    restName != null ? print(restName) : '';
    return Scaffold(
        appBar: AppBar(
            title: Text(RestaurantsOnMap),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back, // add custom icons also
              ),
            ),
            backgroundColor: HexColor.fromHex('#8358ad')),
        body: Stack(children: <Widget>[
          _markers.length != 0
              ? GoogleMap(
                  onMapCreated: _onMapCreated,
                  markers: _markers,
                  initialCameraPosition: CameraPosition(
                      target:
                          LatLng(restaurants.first.lat, restaurants.first.lng),
                      zoom: restaurants.first.zoom),
            onTap: (latlang) {
              setState(() {
                restName = ''; // should check  with multiple data markers
                restAddress = '';
                pinPillPosition = -110;
              });
            },
                )
              : GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(0.toDouble(), 0.toDouble()),
                      zoom: 0.toDouble()),
                ),
          AnimatedPositioned(
              top: pinPillPosition, right: 0, left: 0,
              duration: Duration(milliseconds: 200),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                blurRadius: 20,
                                offset: Offset.zero,
                                color: Colors.grey.withOpacity(0.5)
                            )]
                      ),
                      child: Column(
                                children: <Widget>[
                                  ListTile(
                                    title: Text(
                                      restName ?? '',
                                      style: TextStyle(
                                          color: HexColor.fromHex('#4f95c7'),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    subtitle: Text(
                                      restAddress ?? '',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: HexColor.fromHex('#363636')
                                      ),
                                    ),
                                  ),
                                ],
                              )
                  )  // end of Container
              )  // end of Align
          )
        ]));
  }
}
