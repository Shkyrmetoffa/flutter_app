import 'package:flutter/material.dart';
import 'package:flutter_app/app_localizations.dart';
import 'package:flutter_app/components/starDisplay.dart';
import 'package:flutter_app/http_service.dart';
import 'package:flutter_app/pages/hotelOnMap.dart';
import 'package:provider/provider.dart';
import '../models/post_model.dart';
import '../extensions/extensions.dart';

class HotelScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HotelScreenState();
}

class HotelScreenState extends State<HotelScreen> {
  AppLanguage appLanguage = AppLanguage();
  LocalizedData localizedData = LocalizedData();
  List<Hotels> hotelsList = List();
  List<Hotels> filteredHotelsList = List();
  final HttpService httpService = HttpService();
  TextEditingController idController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final locale = context.read<AppLanguage>().appLocal.toString();
    httpService.getHotels(locale).then((dataFromServer) {
      setState(() {
        hotelsList = dataFromServer;
        filteredHotelsList = hotelsList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    var localized = Provider.of<LocalizedData>(context);

    final hotels = localized.data['${appLanguage.appLocal}Hotels'] != null
        ? localized.data['${appLanguage.appLocal}Hotels'].toUpperCase()
        : '';
    return Scaffold(
        appBar: AppBar(
            title: Text(hotels),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back, // add custom icons also
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Image.asset('images/on_map.png', width: 20, height: 20),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                    HotelOnMapScreen(hotelList: filteredHotelsList))),
                tooltip: 'Hotels on map',
              ),
            ],
            backgroundColor: HexColor.fromHex('#8358ad')),
        body: Stack(
          children: <Widget>[
            Container(
              color: HexColor.fromHex('#363636'),
              child: Column(children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10.0),
                  color: HexColor.fromHex('#565656'),
                  child: TextField(
                    controller: idController,
                    onChanged: (value) {
                      setState(() {
                        filteredHotelsList = hotelsList.where((element) {
                          return element.description_hotels
                              .toString()
                              .toLowerCase()
                              .contains(value.toLowerCase());
                        }).toList();
                      });
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Search hotels',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 199, 199, 199),
                            fontSize: 16)),
                  ),
                ),
                Expanded(
                    child: Container(
                  child: filteredHotelsList.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          padding: EdgeInsets.only(top: 10.0),
                          itemCount: filteredHotelsList.length,
                          itemBuilder: (context, ind) {
                            var item = filteredHotelsList[ind];
                            if (item.description_hotels != null) {
                              var category = item.description_hotels.toString();
                              var stars = int.parse(item.hotel_stars);
                              var address = item.address_hotels.address.toString();

                              return Card(
                                margin: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0 ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                          title: Text(category,
                                              style: TextStyle(
                                                  color: HexColor.fromHex(
                                                      '#8358ad'),
                                                  fontWeight: FontWeight.w600
                                              )),
                                          subtitle: Text(address,
                                              style: TextStyle(
                                                  color: HexColor.fromHex(
                                                      '#363636'),
                                                  fontWeight: FontWeight.w600)),
                                          trailing: StarDisplayWidget(
                                            value: stars,
                                            filledStar: Icon(Icons.star,
                                                color: HexColor.fromHex(
                                                    '#ffaf41')),
                                            unfilledStar: Icon(Icons.star,
                                                color: HexColor.fromHex(
                                                    '#e5e5e5')),
                                          )),
                                      // StarDisplayWidget(
                                      //   value: stars,
                                      //   filledStar: Icon(Icons.star, color: HexColor.fromHex('#ffaf41')),
                                      //   unfilledStar: Icon(Icons.star, color: HexColor.fromHex('#e5e5e5')),
                                      // ),
                                      // ListTile(
                                      //   title: Text(address),
                                      // ),
                                    ],
                                  ));
                            }
                            return Container(height: 0, width: 0);
                          },
                        ),
                ))
              ]),
            ),
          ],
        ));
  }
}
