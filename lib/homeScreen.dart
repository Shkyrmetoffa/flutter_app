import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/home.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            child: AppBar(
              leading: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/info');
                },
                child: Icon(Icons.menu, size: 30),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: <Widget>[
                IconButton(
                  icon: Image.asset('images/united-kingdom.png'),
                  onPressed: () {},
                  tooltip: 'Share',
                ),
              ],
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            top: MediaQuery.of(context).size.width * 0.20,
            child: Container(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('images/home_logo.png', scale: 2.5),
                    ListTile(
                      contentPadding: EdgeInsets.only(
                          top: 30, bottom: 30), //change for side padding
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                              child: RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/info');
                            },
                            child: Column(
                              children: <Widget>[
                                Image(
                                  image: AssetImage('images/e_num.png'),
                                  height: 60,
                                  width: 60,
                                ),
                                Text("E NUMBERS")
                              ],
                            ),
                            color: Color.fromARGB(255, 234, 136, 52),
                            textColor: Colors.white,
                          )),
                          Expanded(
                              child: RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/info');
                            },
                            child: Column(
                              children: <Widget>[
                                Image(
                                  image:
                                      AssetImage('images/restaurant_img.png'),
                                  height: 60,
                                  width: 60,
                                ),
                                Text("RESTAURANTS")
                              ],
                            ),
                            color: Color.fromARGB(255, 79, 149, 199),
                            textColor: Colors.white,
                          )),
                        ],
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(bottom: 30),
                      title: Row(
                        children: <Widget>[
                          Expanded(
                              child: RaisedButton(
                            onPressed: () {},
                            child: Column(
                              children: <Widget>[
                                Image(
                                  image: AssetImage('images/hotel_img.png'),
                                  height: 60,
                                  width: 60,
                                ),
                                Text("HOTELS")
                              ],
                            ),
                            color: Color.fromARGB(255, 79, 149, 199),
                            textColor: Colors.white,
                          )),
                          Expanded(
                              child: RaisedButton(
                            onPressed: () {},
                            child: Column(
                              children: <Widget>[
                                Image(
                                  image: AssetImage('images/prod_img.png'),
                                  height: 60,
                                  width: 60,
                                ),
                                Text("PRODUCTS")
                              ],
                            ),
                            color: Color.fromARGB(255, 150, 196, 45),
                            textColor: Colors.white,
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text("CERTIFICATE CHECK"),
                        color: Color.fromARGB(255, 219, 45, 45),
                        textColor: Colors.white,
                      ),
                    ),
                   
                  ]),
            ),
          ),
           Positioned(
                        bottom: 20,
                            child: Opacity(
                          opacity: 0.5,
                          child: Center(child: Text(
                            "© 2015 - 2020 Halal Control Lithuania",
                          style: TextStyle(
                            color: Colors.white,
                          )
                            ),
                          )
                        ))
        ],
      ),
    );
  }
}
