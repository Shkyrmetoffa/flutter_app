import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_app/generated/l10n.dart';
import '../extensions/extensions.dart';

class MenuScreen extends StatelessWidget {
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final delegate = S.of(context);

    return Scaffold(
      appBar: AppBar(
          title: Text(
            delegate.appTitle.toUpperCase(),
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
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          top: MediaQuery.of(context).size.width * 0.10,
          child: Container(
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Image.asset('images/home_logo.png', scale: 2.5),
                ),
                Positioned(
                  child: Container(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Halal Control Lithuania is a certification authority founded in February 2015.',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 30),
                          child: Text(
                            'We provides the services of Halal certification in Europe and EU countries, Middle East, ASEAN and Asian Countries, Middle Asia countries.',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          bottom: MediaQuery.of(context).size.width * 0.30,
          child: Container(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(color: HexColor.fromHex('#565656')),
              bottom: BorderSide(color: HexColor.fromHex('#565656')),
            )),
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                    icon: Image.asset('images/telegram.png'),
                    onPressed: () => Navigator.pushNamed(context, '/contact'),
                ),
                IconButton(
                  icon: Image.asset('images/browser.png'),
                  onPressed: () => _launchURL('https://halalcontrol.lt/'),
                ),
                IconButton(
                  icon: Image.asset('images/facebook.png'),
                  onPressed: () => _launchURL('https://www.facebook.com/halalcontrollithuania/'),
                ),
                IconButton(
                  icon: Image.asset('images/insta.png'),
                  onPressed: () => _launchURL('https://www.instagram.com/accounts/login/?next=/halalcontrollithuania/'),
                ),
                IconButton(
                  icon: Image.asset('images/linkedin.png'),
                  onPressed: () => _launchURL('https://www.linkedin.com/company/halal-control-lt/'),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          bottom: MediaQuery.of(context).size.width * 0.10,
          child: Container(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                   Navigator.pop(context);
                  },
                  child: Text(
                    "Terms of Service",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    /*...*/
                  },
                  child: Text(
                    "Privacy Policy",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          bottom: 20,
          child: Opacity(
              opacity: 0.5,
              child: Text(
                "© 2015 - 2020 Halal Control Lithuania",
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
