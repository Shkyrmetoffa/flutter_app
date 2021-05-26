import 'package:flutter/material.dart';
import 'package:flutter_app/app_localizations.dart';
import 'package:flutter_app/components/starDisplay.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../extensions/extensions.dart';

class HotelOnMapScreen extends StatefulWidget {
  final List? hotelList;

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
  double pinPillPosition = -110;
  String? hotelName;
  int? hotelStars;
  String? hotelAddress;

  @override
  void initState() {
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    widget.hotelList?.forEach((item) {
      if (item.nameOfHotels != null) {
        setState(() {
          addresses.add(item.addressHotels);
          _markers.add(Marker(
              markerId: MarkerId(item.addressHotels.placeId),
              position:
              LatLng(item.addressHotels.lat, item.addressHotels.lng),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueCyan),
              onTap: () {
                setState(() {
                  hotelName = item.nameOfHotels;
                  hotelStars = int.parse(item.hotelStars);
                  hotelAddress = item.addressHotels.address;
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
    final hotelsOnMap =
        localized.data['${appLanguage.appLocal}HotelsOnMap'] != null
            ? localized.data['${appLanguage.appLocal}HotelsOnMap']?.toUpperCase()
            : '';

    return Scaffold(
        appBar: AppBar(
            title: Text(hotelsOnMap ?? ''),
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
                      target: LatLng(addresses.first.lat, addresses.first.lng),
                      zoom: addresses.first.zoom),
            onTap: (latlang) {
              setState(() {
                hotelName = ''; // should check  with multiple data markers
                hotelStars = 0;
                hotelAddress = '';
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
              top: pinPillPosition,
              right: 0,
              left: 0,
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
                                color: Colors.grey.withOpacity(0.5))
                          ]),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              hotelName ?? '',
                              style: TextStyle(
                                  color: HexColor.fromHex('#4f95c7'),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                             hotelAddress ?? '',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: HexColor.fromHex('#363636')),
                            ),
                              trailing: StarDisplayWidget(
                                value: hotelStars ?? 0,
                                filledStar: Icon(Icons.star,
                                    color: HexColor.fromHex(
                                        '#ffaf41')),
                                unfilledStar: Icon(Icons.star,
                                    color: HexColor.fromHex(
                                        '#e5e5e5')),
                              )
                          ),
                        ],
                      )) // end of Container
                  ) // end of Align
              )
        ]));
  }
}
