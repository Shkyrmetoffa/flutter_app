import 'package:flutter/material.dart';
import 'package:flutter_app/components/starDisplay.dart';
import 'package:flutter_app/http_service.dart';
import 'models/post_model.dart';
import 'extensions/extensions.dart';

class HotelScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HotelScreenState();
}

class HotelScreenState extends State<HotelScreen> {
  List<Hotels> hotels = List();
  List<Hotels> filteredHotels = List();
  final HttpService httpService = HttpService();
  TextEditingController idController = TextEditingController();

  @override
  void initState() {
    super.initState();
    httpService.getHotels().then((dataFromServer) {
      setState(() {
        hotels = dataFromServer;
        filteredHotels = hotels;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('HOTELS'),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back, // add custom icons also
              ),
            ),
            backgroundColor: HexColor.fromHex('#8358ad')),
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
                        filteredHotels = hotels.where((element) {
                          return element.description_hotels
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
                  child: filteredHotels.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: filteredHotels.length,
                          itemBuilder: (context, ind) {
                            var item = filteredHotels[ind];
                            if (item.description_hotels != null) {
                              var category = item.description_hotels.toString();
                              var stars = int.parse(item.hotel_stars);
                              var address = item.address_hotels.toString();
                              return Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                          title: Text(
                                            category,
                                          ),
                                          subtitle: Text(address),
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
