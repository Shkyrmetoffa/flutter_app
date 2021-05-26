import 'dart:io';
import 'dart:io' as Io;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/app_localizations.dart';
import 'package:flutter_app/http_service.dart';
import 'package:flutter_app/util.dart';
import 'package:provider/provider.dart';
import 'dart:core';
import '../extensions/extensions.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:backendless_sdk/backendless_sdk.dart';

class ReportFraudForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ReportFraudFormState();
}

class ReportFraudFormState extends State<ReportFraudForm> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final HttpService httpService = HttpService();
  AppLanguage appLanguage = AppLanguage();
  LocalizedData localizedData = LocalizedData();
  // String APPLICATION_ID = 'FE1A16B4-9A09-6D89-FF75-29FAB8CB0800';
  // String ANDROID_API_KEY = '62567217-323E-4FE9-98CC-51D9BBCE7568';
  // String IOS_API_KEY = 'A6B6A7EA-AE8F-4072-9735-54D9DD7D3699';

  // File? _image;
  PickedFile? _imageFile;
  List _images = [];
  final ImagePicker _picker = ImagePicker();

  _imgFromCamera() async {
    PickedFile? image = await _picker.getImage(
        source: ImageSource.camera, maxWidth: 480, maxHeight: 600);

    setState(() {
      _imageFile = image;
      _images.add(_imageFile?.path.toString());
    });
  }

  _imgFromGallery() async {
    PickedFile? image = await _picker.getImage(
        source: ImageSource.gallery, maxWidth: 480, maxHeight: 600);

    setState(() {
      _imageFile = image;
      _images.add(_imageFile?.path.toString());
    });
  }

  Future getImage(takeAPhotoBtn, chooseFromGalleryBtn, cancelBtn) async {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(right: 8, left: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14.0)),
                    child: Wrap(children: <Widget>[
                      ListTile(
                          title: Center(
                              child: Text(takeAPhotoBtn,
                                  style: TextStyle(
                                      color: HexColor.fromHex('#007aff'),
                                      fontSize: 20))),
                          onTap: () {
                            _imgFromCamera();
                            Navigator.of(context).pop();
                          }),
                      Divider(
                        height: 0.5,
                        color: HexColor.fromHex('#888888'),
                      ),
                      ListTile(
                        title: Center(
                            child: Text(chooseFromGalleryBtn,
                                style: TextStyle(
                                    color: HexColor.fromHex('#007aff'),
                                    fontSize: 20))),
                        onTap: () {
                          _imgFromGallery();
                          Navigator.of(context).pop();
                        },
                      ),
                    ])),
                Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14.0)),
                  child: ListTile(
                    title: Center(
                        child: Text(
                          cancelBtn,
                      style: TextStyle(
                          color: HexColor.fromHex('#007aff'), fontSize: 20, fontWeight: FontWeight.w600),
                    )),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                )
              ]),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    // Backendless.initApp(APPLICATION_ID, ANDROID_API_KEY, IOS_API_KEY);
  }

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    var localized = Provider.of<LocalizedData>(context);

    final reportFraud =
        localized.data['${appLanguage.appLocal}ReportFraud']?.toUpperCase();
    final emailFraud =
        localized.data['${appLanguage.appLocal}MobileEmailFraud'];
    final uploadImageFraud =
        localized.data['${appLanguage.appLocal}MobileUploadImageFraud'];
    final typeOfFraud =
        localized.data['${appLanguage.appLocal}MobileTypeOfFraud'];
    final message = localized.data['${appLanguage.appLocal}Message'];

    final fraudType1 =
        localized.data['${appLanguage.appLocal}MobileFraudType1'];
    final fraudType2 =
        localized.data['${appLanguage.appLocal}MobileFraudType2'];
    final fraudType3 =
        localized.data['${appLanguage.appLocal}MobileFraudType3'];
    var typesOfFraud = [fraudType1, fraudType2, fraudType3];

    final sendMessageBtn =
        localized.data['${appLanguage.appLocal}SendMessageBtn']?.toUpperCase();
    final chooseImageBtn =
        localized.data['${appLanguage.appLocal}ChooseImage'];
    final takeAPhotoBtn =
        localized.data['${appLanguage.appLocal}MobileTakeAPhoto'];
    final chooseFromGalleryBtn = localized
        .data['${appLanguage.appLocal}ChooseFromGallery'];
    final cancelBtn = localized
        .data['${appLanguage.appLocal}Cancel'];
    final sendFormMessage = localized
        .data['${appLanguage.appLocal}SendFormMessage'];
    final sendFormError = localized
        .data['${appLanguage.appLocal}SendFormError'];

    return Scaffold(
        appBar: AppBar(
            title: Text(
              reportFraud ?? '',
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
              child: FormBuilder(
                key: _fbKey,
                // readOnly: false,
                child: ListView(
                  padding: EdgeInsets.all(20.0),
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(bottom: 16.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                emailFraud ?? '',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 6),
                              FormBuilderTextField(
                                name: 'email',
                                style: TextStyle(
                                    color: HexColor.fromHex('#363636'),
                                    fontSize: 18,
                                    backgroundColor: Colors.white),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      left: 16, top: 13, bottom: 14),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Info@gmail.com',
                                  hintStyle: TextStyle(
                                    color: HexColor.fromHex('#363636'),
                                    fontSize: 18,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                  // errorText: sendFormError,
                                  errorStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: HexColor.fromHex('#ff3b30')),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(context, errorText:
                                      sendFormError),
                                  FormBuilderValidators.email(context)
                                ]),
                              ),
                            ])),
                    Container(
                        padding: EdgeInsets.only(bottom: 16.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                uploadImageFraud ?? '',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 6),
                              _images.length > 0
                                  ? Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: HexColor.fromHex('#565656'),
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                3.0) //         <--- border radius here
                                            ),
                                      ),
                                      child: GridView.count(
                                          shrinkWrap: true,
                                          crossAxisCount: 3,
                                          childAspectRatio: 1,
                                          children: List.generate(
                                              _images.length, (index) {
                                            return Card(
                                              semanticContainer: true,
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              child: Stack(
                                                children: <Widget>[
                                                  Image.file(
                                                    File(_images[index]),
                                                    height: 300,
                                                    width: 300,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  Positioned(
                                                    right: 5,
                                                    top: 5,
                                                    child: InkWell(
                                                      child: Icon(
                                                          Icons
                                                              .highlight_remove_rounded,
                                                          size: 20,
                                                          color: Colors.white),
                                                      onTap: () {
                                                        setState(() {
                                                          _images
                                                              .removeAt(index);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          })),
                                    )
                                  : SizedBox(height: 0),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: RaisedButton(
                                  onPressed: () => getImage(
                                    takeAPhotoBtn,
                                    chooseFromGalleryBtn,
                                    cancelBtn,
                                  ),
                                  padding: EdgeInsets.only(
                                      top: 9, bottom: 9, left: 16, right: 16),
                                  child: Text(chooseImageBtn ?? ''),
                                  color: HexColor.fromHex('#28934b'),
                                  textColor: Colors.white,
                                ),
                              )
                            ])),
                    Container(
                        padding: EdgeInsets.only(bottom: 16.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                typeOfFraud ?? '',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 6),
                              FormBuilderDropdown(
                                name: 'type of fraud',
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: 13, bottom: 14, left: 16, right: 16),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  // errorText: sendFormError,
                                  errorStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: HexColor.fromHex('#ff3b30')),
                                ),
                                allowClear: false,
                                // initialValue: 'Male',
                                hint: Text(typesOfFraud.first ?? '',
                                    style: TextStyle(
                                      color: HexColor.fromHex('#363636'),
                                      fontSize: 18,
                                    )),
                                validator: FormBuilderValidators.compose([FormBuilderValidators.required(context, errorText: sendFormError)]),
                                items: typesOfFraud
                                    .map((type) => DropdownMenuItem(
                                          value: type.toString(),
                                          child: Text(type ?? ''),
                                        ))
                                    .toList(),
                                isExpanded: false,
                              ),
                            ])),
                    Container(
                        padding: EdgeInsets.only(bottom: 30.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                message ?? '',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 6),
                              FormBuilderTextField(
                                name: 'message',
                                keyboardType: TextInputType.multiline,
                                maxLines: 4,
                                style: TextStyle(
                                    color: HexColor.fromHex('#363636'),
                                    fontSize: 18,
                                    backgroundColor: Colors.white),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: 13, bottom: 14, left: 16),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),

                                ),

                              ),
                            ])),
                    SizedBox(height: 30),
                    RaisedButton.icon(
                      onPressed: () {
                        String mailBody = '';
                        _fbKey.currentState?.save();
                        _fbKey.currentState?.value.forEach((key, value) {
                          mailBody +=
                              '<table border="1" cellpadding="0" cellspacing="0" width="100" style="background: grey">'
                              '<tr>'
                              '<td>$key</td>'
                              '<td>$value</td></tr></table>';
                        });

                        // mailer

                        if (_fbKey.currentState!.validate()) {
                          httpService.sendMail(
                              'shkyrmetoffa@gmail.com',
                              'TimurFilipp0705',
                              'yevheniiabaidina@gmail.com', // recipient email 'info@halalcontrol.lt'
                              'Report fraud form data',
                              mailBody,
                              _images);


                          Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (context) {
                                Future.delayed(Duration(seconds: 5), () {
                                  Navigator.of(context).pop(true);
                                });
                                return AlertDialog(
                                  content: Text(
                                    sendFormMessage ?? '',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: HexColor.fromHex('#363636')),
                                  ),
                                );
                              });
                        } else {
                          print(_fbKey.currentState?.value);
                          print("validation failed");
                        }
                      },
                      padding: EdgeInsets.only(
                          top: 15, bottom: 15, right: 20, left: 20),
                      icon: Image.asset(
                        'images/send_contacts.png',
                        width: 16,
                        height: 16,
                      ),
                      label: Text(sendMessageBtn ?? ''),
                      color: HexColor.fromHex('#db2d2d'),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              )),
        ]));
  }
}
