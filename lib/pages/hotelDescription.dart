import 'dart:io';
// import 'package:image/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
    switch (statusCertificate
        ?.first
        .value) {
      case 'renewed':
        return '#189ADB';
      case 'withdrawn':
        return '#DB2D2D';
      case 'expired':
        return '#DB2D2D';
      case 'valid':
        return '#28934B';
      default: return '#fffff';
    }
  }

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    var localized = Provider.of<LocalizedData>(context);

    final hotels = localized.data['${appLanguage.appLocal}Hotels'] != null
        ? localized.data['${appLanguage.appLocal}Hotels']?.toUpperCase()
        : '';
    final certCheckIdNo =
        localized.data['${appLanguage.appLocal}MobileCertIdNo'];
    final certCheckStatus =
        localized.data['${appLanguage.appLocal}MobileCertStatus'];
    final certValidUntil =
        localized.data['${appLanguage.appLocal}MobileCertValidUntil'];

    final logo = widget.data.logoHotels != null
        ? widget.data.logoHotels.url.toString()
        : '';
    final stars = int.parse(widget.data.hotelStars ?? '');
    final idCertificate = widget.data.idCertificate.toString();
    final dateUntil = widget.data.dateUntil.toString();
    final hotelName = widget.data.nameOfHotels.toString();
    final addressHotels = widget.data.addressHotels.address.toString();
    final descriptionHotels = widget.data.descriptionHotels.toString();
    final emailHotels = widget.data.contactsHotels.emailHotels.toString();
    final phoneHotels = widget.data.contactsHotels.phoneHotels.toString();
    final additionalFieldHotels = widget.data.contactsHotels != null
        ? widget.data.contactsHotels.additionalFieldHotels.toString()
        : '';
    final galleryHotels =
        widget.data.galleryHotels != null ? widget.data.galleryHotels : null;
    final languagesHotels = widget.data.languagesHotels != null
        ? widget.data.languagesHotels.toList()
        : null;
    final statusCertificate = widget.data.statusCertificate != null
        ? widget.data.statusCertificate.toList()
        : null;
    final certificateImage = widget.data.certificateList != null
        ? widget.data.certificateList[0].certificate_image.toString()
        : '';
    final muslimFriendlyStatus = widget.data.muslimFriendlyStatus != null
        ? widget.data.muslimFriendlyStatus.toList()
        : null;
    final servicesHotels = widget.data.servicesHotels != null
        ? widget.data.servicesHotels.toList()
        : null;
    final statusColor = getStatusColor(statusCertificate);

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
          actions: <Widget>[],
          backgroundColor: HexColor.fromHex('#8358ad')),
      body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: <Widget>[
              Container(
                  color: HexColor.fromHex('#363636'),
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    children: <Widget>[
                      Center(child: getImageType(logo)),
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
                              )))
                    ],
                  )),
              Container(
                width: MediaQuery.of(context).size.width,
                color: HexColor.fromHex('#404040'),
                padding: EdgeInsets.only(top: 16, bottom: 16),
                child: ListTile(
                  title: Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(hotelName,
                          style: TextStyle(
                              color: HexColor.fromHex('#bf7eff'),
                              fontSize: 18,
                              fontWeight: FontWeight.w600))),
                  contentPadding: EdgeInsets.only(left: 16),
                  subtitle: Text(descriptionHotels,
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
                        itemCount: galleryHotels.length,
                        itemBuilder: (context, index, realIdx) {
                          return Container(
                            child: Center(
                                child: Image.network(
                                    galleryHotels[index].imageHotels,
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
                  decoration: BoxDecoration(
                      color: HexColor.fromHex('#404040'),
                      border: Border(bottom: BorderSide(width: 1.0, color: HexColor.fromHex('#363636')))
                  ),
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
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
                                  addressHotels,
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
                                  emailHotels,
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
                                  phoneHotels,
                                  style: TextStyle(
                                    color: HexColor.fromHex('#f4f4f4'),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ))
                              ])),
                      additionalFieldHotels.length > 0
                          ? Padding(
                              padding: EdgeInsets.only(bottom: 15),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Flexible(
                                        child: Text(
                                      additionalFieldHotels,
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
                            'LANGUAGES'.toUpperCase(),
                            style: TextStyle(
                              color: HexColor.fromHex('#989898'),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      ListView.builder(
                          padding: EdgeInsets.only(top: 12.0, bottom: 8.0),
                          itemCount: languagesHotels.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, ind) {
                            var item = languagesHotels[ind];
                            return  Padding(
                                padding: EdgeInsets.only(bottom: 12.0),
                            child: Text(
                              item.languageHotels,
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
                                    color: HexColor.fromHex(
                                        statusColor)
                                  )),
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
                      border: Border(top: BorderSide(width: 1.0, color: HexColor.fromHex('#363636')))
                  ),
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
                        itemCount: servicesHotels.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, ind) {
                          var item = servicesHotels[ind];
                          return Padding(
                            padding:
                                EdgeInsets.only(bottom: 12),
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: SvgPicture.network(
                                    item.iconServicesHotels,
                                    width: 64,
                                    height: 64,
                                  // )
                          )),
                              Expanded(
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container (
                                          padding: EdgeInsets.only(top: 6, bottom: 8),
                                          child: Text(
                                          item.descriptionServicesHotels,
                                          style: TextStyle(color: Colors.white),
                                        ),),
                                        Container(child: Divider(
                                          color: Colors.white,
                                          height: 1,
                                        ),)

                                  ]))
                            ],
                          )
                          );
                        })
                  ]))
            ],
          )),
    );
  }
}
