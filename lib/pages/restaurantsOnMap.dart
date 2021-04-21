import 'package:flutter/material.dart';
import 'package:flutter_app/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../extensions/extensions.dart';

class RestaurantOnMapScreen extends StatefulWidget {
  final List restaurantsList;

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

  @override
  void initState() {
    super.initState();
    widget.restaurantsList.forEach((item) {
      if (item.description_restaurants != null) {
        setState(() {
          restaurants.add(item.address_restaurants);
          _markers.add(Marker(
              markerId: MarkerId(item.address_restaurants.placeId),
              position: LatLng(
                  item.address_restaurants.lat, item.address_restaurants.lng),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueCyan),
              onTap: (){
              }
          ));
        });
      }
    }
    );
  }

  void _onMapCreated(GoogleMapController controller) {

  }



  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    var localized = Provider.of<LocalizedData>(context);
    final RestaurantsOnMap =
    localized.data['${appLanguage.appLocal}RestaurantsOnMap'] != null
        ? localized.data['${appLanguage.appLocal}RestaurantsOnMap'].toUpperCase()
        : '';

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
        body: _markers.length != 0 ?
        GoogleMap(
          onMapCreated: _onMapCreated,
          markers: _markers.length != 0 ? _markers : [],
          initialCameraPosition: CameraPosition(target:
          LatLng(restaurants.first.lat, restaurants.first.lng), zoom: restaurants.first.zoom),
        ) : GoogleMap(
          onMapCreated: _onMapCreated,
          // markers: _markers.length != 0 ? _markers : [],
          initialCameraPosition: CameraPosition(target:
          LatLng(0.toDouble(), 0.toDouble()), zoom: 0.toDouble()),
        ));
  }
}
