import 'package:flutter/material.dart';
import 'package:flutter_app/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../extensions/extensions.dart';

class HotelOnMapScreen extends StatefulWidget {
  final List hotelList;

  HotelOnMapScreen({this.hotelList});

  @override
  State<StatefulWidget> createState() => HotelOnMapScreenState();
}

class HotelOnMapScreenState extends State<HotelOnMapScreen> {
  final GlobalKey scaffoldKey = GlobalKey();
  AppLanguage appLanguage = AppLanguage();
  LocalizedData localizedData = LocalizedData();
  Set<Marker> _markers = {};
  List addresses = [];

  @override
  void initState() {
    super.initState();

    widget.hotelList.forEach((item) {
      if (item.description_hotels != null) {
        setState(() {
          addresses.add(item.address_hotels);
          _markers.add(Marker(
              markerId: MarkerId(item.address_hotels.placeId),
              position: LatLng(
                  item.address_hotels.lat, item.address_hotels.lng),
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
    final hotelsOnMap =
        localized.data['${appLanguage.appLocal}HotelsOnMap'] != null
            ? localized.data['${appLanguage.appLocal}HotelsOnMap'].toUpperCase()
            : '';

    return Scaffold(
        appBar: AppBar(
            title: Text(hotelsOnMap),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back, // add custom icons also
              ),
            ),
            backgroundColor: HexColor.fromHex('#8358ad')),
        body:
        _markers.length != 0 ? GoogleMap(
          onMapCreated: _onMapCreated,
          markers: _markers,
          initialCameraPosition: CameraPosition(target:
          LatLng(addresses.first.lat, addresses.first.lng), zoom: addresses.first.zoom),
        ) : Center(child: CircularProgressIndicator()));

  }
}
