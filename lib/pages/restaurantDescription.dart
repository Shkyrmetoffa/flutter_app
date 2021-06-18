import 'dart:io';
// import 'package:image/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_app/components/starDisplay.dart';
import 'package:provider/provider.dart';
import '../extensions/extensions.dart';

class RestautantDescription extends StatefulWidget {
  final data;
  RestautantDescription({this.data});

  @override
  State<StatefulWidget> createState() => RestautantDescriptionState();
}

class RestautantDescriptionState extends State<RestautantDescription> {
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

  getStatusColor(statusCertificate) {
    switch (statusCertificate?.first.value) {
      case 'renewed':
        return '#189ADB';
      case 'withdrawn':
        return '#DB2D2D';
      case 'expired':
        return '#DB2D2D';
      case 'valid':
        return '#28934B';
      default:
        return '#fffff';
    }
  }

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    var localized = Provider.of<LocalizedData>(context);

    final restaurants =
        localized.data['${appLanguage.appLocal}Restaurants']?.toUpperCase() ??
            '';
    final certCheckIdNo =
        localized.data['${appLanguage.appLocal}MobileCertIdNo'];
    final certCheckStatus =
        localized.data['${appLanguage.appLocal}MobileCertStatus'];
    final certValidUntil =
        localized.data['${appLanguage.appLocal}MobileCertValidUntil'];

    final logo = widget.data.logo_restaurants != null
        ? widget.data.logo_restaurants.url.toString()
        : '';
    final restaurantName = widget.data.name_of_restaurant != null
        ? widget.data.name_of_restaurant.toString()
        : '';
    final restaurantDescription = widget.data.description_restaurants != null
        ? widget.data.description_restaurants.toString()
        : '';
    final idCertificate = widget.data.id_certificate.toString();
    final dateUntil = widget.data.date_until.toString();
    final muslimFriendly = widget.data.muslim_friendly;
    final addressRestaurant =
        widget.data.address_restaurants.address.toString();
    final emailRestaurant =
        widget.data.contacts_restaurants.email_restaurants.toString();
    final phoneRestaurant =
        widget.data.contacts_restaurants.phone_restaurants.toString();
    final additionalFieldRestaurants = widget.data.contacts_restaurants != null
        ? widget.data.contacts_restaurants.additional_field_restaurants
            .toString()
        : '';
    final galleryRestaurants = widget.data.gallery_restaurants != null
        ? widget.data.gallery_restaurants
        : null;
    final languagesRestaurants = widget.data.languages_restaurants != null
        ? widget.data.languages_restaurants
        : null;
    final daysWeekRestaurants = widget.data.working_time_restaurants != null
        ? widget.data.working_time_restaurants.days_week_restaurants.toList()
        : null;
    final timeFromRestaurants = widget.data.working_time_restaurants != null
        ? widget.data.working_time_restaurants.time_from_restaurants.toString()
        : null;
    final timeUntilRestaurants = widget.data.working_time_restaurants != null
        ? widget.data.working_time_restaurants.time_until_restaurants.toString()
        : null;
    final statusCertificate = widget.data.status_certificate != null
        ? widget.data.status_certificate.toList()
        : null;
    final certificateImage = widget.data.certificate_list != null
        ? widget.data.certificate_list[0].certificate_image.toString()
        : '';
    final muslimFriendlyStatus = widget.data.muslim_friendly_status != null
        ? widget.data.muslim_friendly_status.toList()
        : null;
    final servicesRestaurant = widget.data.services_restaurants != null
        ? widget.data.services_restaurants.toList()
        : null;
    final statusColor = getStatusColor(statusCertificate);

    print(muslimFriendly);
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
          actions: <Widget>[],
          backgroundColor: HexColor.fromHex('#4f95c7')),
      body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: <Widget>[
              Container(
                color: HexColor.fromHex('#363636'),
                padding: EdgeInsets.only(top: 58, bottom: 58),
                child: Center(child: getImageType(logo)),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: HexColor.fromHex('#404040'),
                padding: EdgeInsets.only(top: 16, bottom: 16),
                child: ListTile(
                  title: Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(restaurantName,
                          style: TextStyle(
                              color: HexColor.fromHex('#57c7ff'),
                              fontSize: 18,
                              fontWeight: FontWeight.w600))),
                  contentPadding: EdgeInsets.only(left: 16),
                  subtitle: Text(restaurantDescription,
                      style: TextStyle(
                          color: HexColor.fromHex('#f4f4f4'),
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                  onTap: () {},
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(children: [
                    CarouselSlider.builder(
                        carouselController: buttonCarouselController,
                        itemCount: galleryRestaurants.length,
                        itemBuilder: (context, index, realIdx) {
                          return Container(
                            child: Center(
                                child: Image.network(
                                    galleryRestaurants[index].imageRestaurants,
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width)),
                          );
                        },
                        options: CarouselOptions(
                          viewportFraction: 1,
                        )),
                    Positioned.fill(
                        child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                          onTap: () => buttonCarouselController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.linear),
                          child: Padding(
                            padding: EdgeInsets.only(right: 14),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white60,
                              size: 40, // add custom icons also
                            ),
                          )),
                    )),
                    Positioned.fill(
                        child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                          onTap: () => buttonCarouselController.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.linear),
                          child: Padding(
                            padding: EdgeInsets.only(left: 14),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white60,
                              size: 40, // add custom icons also
                            ),
                          )),
                    )),
                  ])),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: HexColor.fromHex('#404040'),
                      border: Border(
                          bottom: BorderSide(
                              width: 1.0, color: HexColor.fromHex('#363636')))),
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(right: 6),
                                    child: Icon(Icons.location_on_outlined,
                                        color: Colors.white)),
                                Flexible(
                                    child: Text(
                                  addressRestaurant,
                                  style: TextStyle(
                                    color: HexColor.fromHex('#f4f4f4'),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ))
                              ])),
                      Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(right: 6),
                                    child:
                                        Icon(Icons.mail, color: Colors.white)),
                                Flexible(
                                    child: Text(
                                  emailRestaurant,
                                  style: TextStyle(
                                    color: HexColor.fromHex('#f4f4f4'),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ))
                              ])),
                      Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(right: 6),
                                    child: Icon(Icons.phone_in_talk,
                                        color: Colors.white)),
                                Flexible(
                                    child: Text(
                                  phoneRestaurant,
                                  style: TextStyle(
                                    color: HexColor.fromHex('#f4f4f4'),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ))
                              ])),
                      additionalFieldRestaurants.length > 0
                          ? Padding(
                              padding: EdgeInsets.only(bottom: 15),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Flexible(
                                        child: Text(
                                      additionalFieldRestaurants,
                                      style: TextStyle(
                                        color: HexColor.fromHex('#f4f4f4'),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),
                                  ]))
                          : SizedBox(
                              height: 0,
                            ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Working time'.toUpperCase(),
                            style: TextStyle(
                              color: HexColor.fromHex('#989898'),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      Column(
                        children: <Widget>[
                          SizedBox(
                              child: ListView.builder(
                                  padding:
                                      EdgeInsets.only(top: 13.0, bottom: 20),
                                  itemCount: daysWeekRestaurants.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, ind) {
                                    var item = daysWeekRestaurants[ind];
                                    return Padding(
                                        padding: EdgeInsets.only(bottom: 8),
                                        child: Row(children: <Widget>[
                                          Container(
                                              width: 16,
                                              height: 16,
                                              margin: EdgeInsets.only(right: 8),
                                              decoration: BoxDecoration(
                                                  color: HexColor.fromHex(
                                                      '#96c42d'),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(4))),
                                              child: SizedBox()),
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                item.label,
                                                style: TextStyle(
                                                  color: HexColor.fromHex(
                                                      '#f4f4f4'),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )),
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                '$timeFromRestaurants - $timeUntilRestaurants',
                                                style: TextStyle(
                                                  color: HexColor.fromHex(
                                                      '#f4f4f4'),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ))
                                        ]));
                                  })),
                        ],
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'LANGUAGES'.toUpperCase(),
                            style: TextStyle(
                              color: HexColor.fromHex('#989898'),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      ListView.builder(
                          padding: EdgeInsets.only(top: 12.0, bottom: 8),
                          itemCount: languagesRestaurants.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, ind) {
                            var item = languagesRestaurants[ind];
                            return Padding(
                                padding: EdgeInsets.only(bottom: 12),
                                child: Text(
                                  item.languageRestaurants,
                                  style: TextStyle(
                                    color: HexColor.fromHex('#f4f4f4'),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ));
                          })
                    ],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width,
                  color: HexColor.fromHex('#363636'),
                  padding: EdgeInsets.all(20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('$certCheckIdNo ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      height: 1.2,
                                      color: Colors.white)),
                              Text(idCertificate,
                                  style: TextStyle(
                                      fontSize: 18,
                                      height: 1.2,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('$certCheckStatus ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      height: 1.2,
                                      color: Colors.white)),
                              Text(
                                  statusCertificate?.first.label.toString() ??
                                      '',
                                  style: TextStyle(
                                      fontSize: 18,
                                      height: 1.2,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor.fromHex(statusColor))),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('$certValidUntil ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      height: 1.2,
                                      color: Colors.white)),
                              Text(dateUntil,
                                  style: TextStyle(
                                      fontSize: 18,
                                      height: 1.2,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ]),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Image.network(
                            certificateImage,
                          ),
                        ),
                      ])),
              Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: HexColor.fromHex('#404040'),
                      border: Border(
                          top: BorderSide(
                              width: 1.0, color: HexColor.fromHex('#363636')))),
                  padding: EdgeInsets.all(20),
                  child: Column(children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('MUSLIM FRIENDLY TIER: '.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 14,
                                  height: 1.71,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                          Text(muslimFriendlyStatus.first.label.toString(),
                              style: TextStyle(
                                  fontSize: 14,
                                  height: 1.71,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                        ]),
                    ListView.builder(
                        padding: EdgeInsets.only(top: 12.0),
                        itemCount: servicesRestaurant.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, ind) {
                          var item = servicesRestaurant[ind];
                          return Padding(
                              padding: EdgeInsets.only(bottom: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(right: 12),
                                      child: SvgPicture.network(
                                        item.icon_services_restaurants,
                                        width: 64,
                                        height: 64,
                                        // )
                                      )),
                                  Expanded(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 6, bottom: 8),
                                          child: Text(
                                            item.description_services_restaurants,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        Container(
                                          child: Divider(
                                            color: Colors.white,
                                            height: 1,
                                          ),
                                        )
                                      ]))
                                ],
                              ));
                        })
                  ]))
            ],
          )),
    );
  }
}
