import 'dart:io';
// import 'package:image/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_app/components/starDisplay.dart';
import 'package:provider/provider.dart';
import '../extensions/extensions.dart';

class ProductDescription extends StatefulWidget {
  final data;
  ProductDescription({this.data});

  @override
  State<StatefulWidget> createState() => ProductDescriptionState();
}

class ProductDescriptionState extends State<ProductDescription> {
  AppLanguage appLanguage = AppLanguage();
  LocalizedData localizedData = LocalizedData();
  CarouselController buttonCarouselController = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  getImageType(str) {
    var type = LastChars(str).lastChars(3);
    if (type == 'png' || type == 'jpg') {
      print('png');
      return Image.network(
        str,
        height: 140,
        width: 360,
      );
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

    final products =
    localized.data['${appLanguage.appLocal}Products']?.toUpperCase();

    final category = widget.data.categories_products.first.category_product
        .toString();

    return Scaffold(
      appBar: AppBar(
          title: Text(products ?? ''),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back, // add custom icons also
            ),
          ),
          actions: <Widget>[],
          backgroundColor: HexColor.fromHex('#96c42d')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 20, left: 20, bottom: 20),
          color: HexColor.fromHex('#363636'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(category,
                          style: TextStyle(
                              color: HexColor.fromHex('#96c42d'),
                              fontSize: 18,
                              fontWeight: FontWeight.w500))),
              Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text('CATEGORIES'.toUpperCase(),
                        style: TextStyle(
                            color: HexColor.fromHex('#989898'),
                            fontSize: 14,
                            fontWeight: FontWeight.w500))),
              Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(category,
                      style: TextStyle(
                          color: HexColor.fromHex('#f4f4f4'),
                          fontSize: 14,
                          fontWeight: FontWeight.w500))),
              // Container(
              //     width: MediaQuery.of(context).size.width,
              //     child: Stack(children: [
              //       CarouselSlider.builder(
              //           carouselController: buttonCarouselController,
              //           itemCount: galleryHotels.length,
              //           itemBuilder: (context, index, realIdx) {
              //             return Container(
              //               child: Center(
              //                   child: Image.network(
              //                       galleryHotels[index].imageHotels,
              //                       fit: BoxFit.cover,
              //                       width: MediaQuery.of(context).size.width)),
              //             );
              //           },
              //           options: CarouselOptions(
              //             viewportFraction: 1,
              //           )),
              //       Positioned.fill(
              //           child: Align(
              //             alignment: Alignment.centerRight,
              //             child: GestureDetector(
              //                 onTap: () => buttonCarouselController.nextPage(
              //                     duration: Duration(milliseconds: 300),
              //                     curve: Curves.linear),
              //                 child: Padding(
              //                   padding: EdgeInsets.only(right: 14),
              //                   child: Icon(
              //                     Icons.arrow_forward,
              //                     color: Colors.white60,
              //                     size: 40, // add custom icons also
              //                   ),
              //                 )),
              //           )),
              //       Positioned.fill(
              //           child: Align(
              //             alignment: Alignment.centerLeft,
              //             child: GestureDetector(
              //                 onTap: () => buttonCarouselController.previousPage(
              //                     duration: Duration(milliseconds: 300),
              //                     curve: Curves.linear),
              //                 child: Padding(
              //                   padding: EdgeInsets.only(left: 14),
              //                   child: Icon(
              //                     Icons.arrow_back,
              //                     color: Colors.white60,
              //                     size: 40, // add custom icons also
              //                   ),
              //                 )),
              //           )),
              //     ])),
            ],
          )
      )
    );
  }
}