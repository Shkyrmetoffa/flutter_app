import 'package:flutter/material.dart';
import 'package:flutter_app/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import '../extensions/extensions.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  AppLanguage appLanguage = AppLanguage();
  LocalizedData localizedData = LocalizedData();

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    var localized = Provider.of<LocalizedData>(context);

    final halalControlLithuania = localized.data['${appLanguage.appLocal}HalalControlLithuania']?.toUpperCase();
    final aboutUs = localized.data['${appLanguage.appLocal}AboutUs'];
    final aboutUsTerms = localized.data['${appLanguage.appLocal}AboutUsTerms'];
    final aboutUsPrivacy = localized.data['${appLanguage.appLocal}AboutUsPrivacy'];
    final aboutUsTermsLink = localized.data['${appLanguage.appLocal}AboutUsTermsLink'];
    final aboutUsPrivacyLink = localized.data['${appLanguage.appLocal}AboutUsPrivacyLink'];
    final copyrights = localized.data['${appLanguage.appLocal}Copyrights'];

    return Scaffold(
      appBar: AppBar(
          title: Text(
            halalControlLithuania ?? '',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back, // add custom icons also
            ),
          ),
          backgroundColor: HexColor.fromHex('#28934b')),
      body: Stack(children: <Widget>[
        Container(
          color: HexColor.fromHex('#363636'),
          // padding: EdgeInsets.only(left: 30.0, right: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Image.asset(
                  'images/home_logo.png',
                  scale: 4,
                ),
              ),
              Stack(children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 30),
                        child: Text(
                          aboutUs ?? '',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        decoration: BoxDecoration(
                            border: Border(
                          top: BorderSide(color: HexColor.fromHex('#565656')),
                          bottom:
                              BorderSide(color: HexColor.fromHex('#565656')),
                        )),
                        child: Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.spaceAround,
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset('images/telegram.png'),
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/contact'),
                            ),
                            IconButton(
                              icon: Image.asset('images/browser.png'),
                              onPressed: () =>
                                  _launchURL('https://halalcontrol.lt/'),
                            ),
                            IconButton(
                              icon: Image.asset('images/facebook.png'),
                              onPressed: () => _launchURL(
                                  'https://www.facebook.com/halalcontrollithuania/'),
                            ),
                            IconButton(
                              icon: Image.asset('images/insta.png'),
                              onPressed: () => _launchURL(
                                  'https://www.instagram.com/accounts/login/?next=/halalcontrollithuania/'),
                            ),
                            IconButton(
                              icon: Image.asset('images/linkedin.png'),
                              onPressed: () => _launchURL(
                                  'https://www.linkedin.com/company/halal-control-lt/'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(top: 20.0, bottom: 20),
                        child: Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.spaceAround,
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {
                                _launchURL(
                                    aboutUsTermsLink);
                              },
                              child: Text(
                                aboutUsTerms ?? '',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                            FlatButton(
                              onPressed: () {
                                _launchURL(
                                    aboutUsPrivacyLink);
                              },
                              child: Text(
                                aboutUsPrivacy ?? '',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // ),
              ])
            ],
          ),
        ),
        // ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          bottom: 20,
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
      ]),
    );
  }
}
