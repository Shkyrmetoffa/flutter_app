import 'package:flutter/material.dart';
import 'package:flutter_app/pages/restaurantsOnMap.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/app_localizations.dart';
import 'package:flutter_app/http_service.dart';
import '../models/post_model.dart';
import '../extensions/extensions.dart';

class RestaurantsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RestaurantsScreenState();
}

class RestaurantsScreenState extends State<RestaurantsScreen> {
  AppLanguage appLanguage = AppLanguage();
  LocalizedData localizedData = LocalizedData();
  List<Restaurants> restaurantsList = List();
  List<Restaurants> filteredRestaurantsList = List();
  final HttpService httpService = HttpService();
  TextEditingController idController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final locale = context.read<AppLanguage>().appLocal.toString();

    httpService.getRestaurants(locale).then((dataFromServer) {
      setState(() {
        restaurantsList = dataFromServer;
        filteredRestaurantsList = restaurantsList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    var localized = Provider.of<LocalizedData>(context);

    final restaurants =
    localized.data['${appLanguage.appLocal}Restaurants'].toUpperCase();

    return Scaffold(
        appBar: AppBar(
            title: Text(restaurants),
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
                    RestaurantOnMapScreen(restaurantsList: filteredRestaurantsList))),
                tooltip: 'Restaurants on map',
              ),
            ],
            backgroundColor: HexColor.fromHex('#4f95c7')),
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
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Search restaurants',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 199, 199, 199),
                            fontSize: 18)),
                    onChanged: (value) {
                      setState(() {
                        filteredRestaurantsList = restaurantsList.where((element) {
                          return element.description_restaurants
                              .toString()
                              .toLowerCase()
                              .contains(value.toLowerCase());
                        }).toList();
                      });
                    },
                  ),
                ),
                Expanded(
                    child: Container(
                  child: filteredRestaurantsList.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          padding: EdgeInsets.only(top: 10.0),
                          itemCount: filteredRestaurantsList.length,
                          itemBuilder: (context, ind) {
                            var item = filteredRestaurantsList[ind];
                            if (item.description_restaurants != null) {
                              var category =
                                  item.description_restaurants.toString();
                              var address = item.address_restaurants.address.toString();
                              return Card(
                                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 10,),
                                  clipBehavior: Clip.antiAlias,
                                  child: Container(
                                    padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                                      child: Column(
                                    children: <Widget>[
                                      ListTile(
                                        title: Text(
                                          category,
                                          style: TextStyle(
                                            color: HexColor.fromHex('#4f95c7'),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                        subtitle: Text(
                                            address,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: HexColor.fromHex('#363636')
                                          ),
                                        ),
                                      ),
                                    ],
                                  )));
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
