import 'dart:io';
// import 'package:image/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/components/starDisplay.dart';
import 'package:provider/provider.dart';
import '../extensions/extensions.dart';

class HotelDescription extends StatefulWidget {
  final data;
  HotelDescription({this.data});

  @override
  State<StatefulWidget> createState() => HotelDescriptionState();
}

class HotelDescriptionState extends State<HotelDescription> {
  AppLanguage appLanguage = AppLanguage();
  LocalizedData localizedData = LocalizedData();

  @override
  void initState() {
    super.initState();
  }

  getImageType(str) {
    var type = LastChars(str).lastChars(3);
    if (type == 'png' || type == 'jpg') {
      print('png');
      return Image.network(str);
    } else {
      print('svg');
      return SvgPicture.network(
        str,
        height: 140,
        width: 360,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    var localized = Provider.of<LocalizedData>(context);

    final hotels = localized.data['${appLanguage.appLocal}Hotels'] != null
        ? localized.data['${appLanguage.appLocal}Hotels']?.toUpperCase()
        : '';
    final logo = widget.data.logoHotels != null ? widget.data.logoHotels.url.toString() : '';
    final stars = int.parse(widget.data.hotelStars ?? '');
    final hotelName = widget.data.nameOfHotels.toString();

    return Scaffold(
        appBar: AppBar(
            title: Text(hotels ?? ''),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back, // add custom icons also
              ),
            ),
            actions: <Widget>[
            ],
            backgroundColor: HexColor.fromHex('#8358ad')),
        body: Column(
          children: <Widget>[
            Container(
                color: HexColor.fromHex('#363636'),
                padding:
                    EdgeInsets.only(top: 30,),
                child: Column(
                  children: <Widget>[
                    Center(
                        child: getImageType(logo)),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 16, right: 16),
                            child: StarDisplayWidget(
                          value: stars,
                          filledStar: Icon(Icons.star,
                              color: HexColor.fromHex('#ffaf41')),
                          unfilledStar: Icon(Icons.star,
                              color: HexColor.fromHex('#e5e5e5')),
                        ))
                    )
                  ],
                )),
            Container(
                width: MediaQuery.of(context).size.width,
              color: HexColor.fromHex('#404040'),
              padding: EdgeInsets.all(16),
              child: ListTile(
                title: Text(hotelName,
                    style: TextStyle(
                        color: HexColor.fromHex(
                            '#bf7eff'),
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                    )),
                subtitle: Text('description',
                    style: TextStyle(
                        color: HexColor.fromHex(
                            '#f4f4f4'),
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                onTap: () {},
              ),
            )
          ],
        ));
  }
}
