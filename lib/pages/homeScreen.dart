import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app_localizations.dart';
import 'package:flutter_app/components/homePageButton.dart';
import 'package:provider/provider.dart';
import '../extensions/extensions.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppLanguage appLanguage = AppLanguage();
  LocalizedData localizedData = LocalizedData();

  @override
  void initState() {
    super.initState();
    localizedData.getDataFromInitRequest();
  }

  @override
  Widget build(BuildContext context) {
    final appLanguage = Provider.of<AppLanguage>(context);
    final localized = Provider.of<LocalizedData>(context);

    final copyrights =
        localized.data['${appLanguage.appLocal}Copyrights'] != null
            ? localized.data['${appLanguage.appLocal}Copyrights']
            : '';
    final eNumbers = localized.data['${appLanguage.appLocal}Enumbers'] != null
        ? localized.data['${appLanguage.appLocal}Enumbers']?.toUpperCase()
        : '';
    final restaurants = localized.data['${appLanguage.appLocal}Restaurants'] !=
            null
        ? localized.data['${appLanguage.appLocal}Restaurants']?.toUpperCase()
        : '';
    final hotels = localized.data['${appLanguage.appLocal}Hotels'] != null
        ? localized.data['${appLanguage.appLocal}Hotels']?.toUpperCase()
        : '';
    final products = localized.data['${appLanguage.appLocal}Products'] != null
        ? localized.data['${appLanguage.appLocal}Products']?.toUpperCase()
        : '';
    final certificateCheckBtn =
        localized.data['${appLanguage.appLocal}CertificateCheckBtn'] != null
            ? localized.data['${appLanguage.appLocal}CertificateCheckBtn']
                ?.toUpperCase()
            : '';

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
          // Positioned(
          //   child:
          AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/menu');
              },
              child: Icon(Icons.menu, size: 30),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: <Widget>[
              ButtonBar(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('images/united-kingdom.png'),
                    onPressed: () {
                      appLanguage.changeLanguage(Locale("en"));
                    },
                    tooltip: 'Share',
                  ),
                  IconButton(
                    icon: Image.asset('images/russia.png'),
                    onPressed: () {
                      if (localized.data.keys.contains('ru')) {
                        appLanguage.changeLanguage(Locale("ru"));
                      } else {
                        appLanguage.changeLanguage(Locale("en"));
                      }
                    },
                    tooltip: 'Share',
                  ),
                ],
              ),
              IconButton(
                icon: Image.asset('images/lithuania.png'),
                onPressed: () {
                  if (localized.data.keys.contains('lt')) {
                    appLanguage.changeLanguage(Locale("lt"));
                  } else {
                    appLanguage.changeLanguage(Locale("en"));
                  }
                },
                tooltip: 'Share',
              ),
              IconButton(
                icon: Image.asset('images/uz.png'),
                onPressed: () {
                  if (localized.data.keys.contains('uz')) {
                    appLanguage.changeLanguage(Locale("uz"));
                  } else {
                    appLanguage.changeLanguage(Locale("en"));
                  }
                },
                tooltip: 'Share',
              ),
              IconButton(
                icon: Image.asset('images/estonia.png'),
                onPressed: () {
                  if (localized.data.keys.contains('et')) {
                    appLanguage.changeLanguage(Locale("et"));
                  } else {
                    appLanguage.changeLanguage(Locale("en"));
                  }
                },
                tooltip: 'Share',
              ),
            ],
          ),
          // ),
          Container(
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Image.asset(
                      'images/home_logo.png',
                      // scale: 2.5,
                      height: 120,
                      width: 102,
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: HomePageButton(
                                image: AssetImage('images/e_num.png'),
                                color: HexColor.fromHex('#ea8834'),
                                label: eNumbers,
                                onPress: () {
                                  Navigator.pushNamed(context, '/enumbers');
                                })),
                        SizedBox(width: 30),
                        Expanded(
                            flex: 1,
                            child: HomePageButton(
                                image: AssetImage('images/restaurant_img.png'),
                                color: HexColor.fromHex('#4f95c7'),
                                label: restaurants,
                                onPress: () {
                                  Navigator.pushNamed(context, '/restaurants');
                                })),
                      ]),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: HomePageButton(
                              image: AssetImage('images/hotel_img.png'),
                              color: HexColor.fromHex('#8358ad'),
                              label: hotels,
                              onPress: () {
                                Navigator.pushNamed(context, '/hotels');
                              })),
                      SizedBox(width: 30),
                      Expanded(
                          child: HomePageButton(
                              image: AssetImage('images/prod_img.png'),
                              color: HexColor.fromHex('#96c42d'),
                              label: products,
                              onPress: () {
                                Navigator.pushNamed(context, '/products');
                              })),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/certificate');
                      },
                      child: Text(certificateCheckBtn ?? ''),
                      color: HexColor.fromHex('#db2d2d'),
                      textColor: Colors.white,
                    ),
                  ),
                ]),
          ),
          // ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: MediaQuery.of(context).size.width / 30,
            child: Opacity(
                opacity: 0.5,
                child: Text(
                  copyrights ?? '',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                )),
          )
        ],
      ),
    );
  }
}
