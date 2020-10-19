import 'package:flutter/material.dart';
import 'package:flutter_app/http_service.dart';
import 'models/post_model.dart';
import 'extensions/extensions.dart';

// class RestaurantsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text('RESTAURANTS'),
//           leading: GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Icon(
//               Icons.arrow_back, // add custom icons also
//             ),
//           ),
//           backgroundColor: HexColor.fromHex('#4f95c7')
//       ),
//       body: Text('Rerstaurants'),
//     );
//   }
// }
class RestaurantsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RestaurantsScreenState();
}

class RestaurantsScreenState extends State<RestaurantsScreen> {
  List<Restaurants> restaurants = List();
  List<Restaurants> filteredRestaurants = List();
  final HttpService httpService = HttpService();
  TextEditingController idController = TextEditingController();

  @override
  void initState() {
    super.initState();
    httpService.getRestaurants().then((dataFromServer) {
      setState(() {
        restaurants = dataFromServer;
        filteredRestaurants = restaurants;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('RESTAURANTS'),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back, // add custom icons also
              ),
            ),
            backgroundColor: HexColor.fromHex('#4f95c7')),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/home.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.7), BlendMode.srcOver)),
              ),
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: idController,
                    style: TextStyle(backgroundColor: Colors.white),
                    onChanged: (value) {
                      setState(() {
                        filteredRestaurants = restaurants.where((element) {
                          return element.description_restaurants
                              .toString()
                              .toLowerCase()
                              .contains(value.toLowerCase());
                        }).toList();
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                      child: filteredRestaurants.isEmpty
                          ? Center(
                        child: CircularProgressIndicator(),
                      )
                          : ListView.builder(
                        itemCount: filteredRestaurants.length,
                        itemBuilder: (context, ind) {
                          var item = filteredRestaurants[ind];
                          if (item.description_restaurants != null) {
                            var category = item.description_restaurants.toString();
                            var address = item.address_restaurants.toString();
                            return Card(
                                clipBehavior: Clip.antiAlias,
                                child: Column(
                                  children: <Widget>[
                                    ListTile(
                                        title: Text(
                                          category,
                                        ),
                                        subtitle: Text(address),
                                        ),
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
