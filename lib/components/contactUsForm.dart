import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/app_localizations.dart';
import 'package:flutter_app/http_service.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:core';
import '../extensions/extensions.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:backendless_sdk/backendless_sdk.dart';

class ContactUsForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ContactUsFormState();
}

class ContactUsFormState extends State<ContactUsForm> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final HttpService httpService = HttpService();
  AppLanguage appLanguage = AppLanguage();
  LocalizedData localizedData = LocalizedData();

  // String APPLICATION_ID = 'FE1A16B4-9A09-6D89-FF75-29FAB8CB0800';
  // String ANDROID_API_KEY = '62567217-323E-4FE9-98CC-51D9BBCE7568';
  // String IOS_API_KEY = 'A6B6A7EA-AE8F-4072-9735-54D9DD7D3699';

  @override
  void initState() {
    super.initState();
    // Backendless.initApp(APPLICATION_ID, ANDROID_API_KEY, IOS_API_KEY);
  }

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    var localized = Provider.of<LocalizedData>(context);

    final contactUs =
    localized.data['${appLanguage.appLocal}ContactUs'].toUpperCase();
    final contactFormName =
    localized.data['${appLanguage.appLocal}ContactFormName'];
    final contactFormEmail =
    localized.data['${appLanguage.appLocal}ContactFormEmail'];
    final contactFormPhoneNumber =
    localized.data['${appLanguage.appLocal}ContactFormPhoneNumber'];
    final contactFormSubject =
    localized.data['${appLanguage.appLocal}ContactFormSubject'];
    final contactFormMessage =
    localized.data['${appLanguage.appLocal}ContactFormMessage'];
    final contactFormText =
    localized.data['${appLanguage.appLocal}ContactFormText'];
    final contactFormTerms =
    localized.data['${appLanguage.appLocal}ContactFormTerms'];
    final contactFormAnd =
    localized.data['${appLanguage.appLocal}ContactFormAnd'];
    final contactFormPrivacy =
    localized.data['${appLanguage.appLocal}ContactFormPrivacy'];
    final contactFormLasttext =
    localized.data['${appLanguage.appLocal}ContactFormLastText'];
    final termsLink = localized.data['${appLanguage.appLocal}AboutUsTermsLink'];
    final privacyLink = localized.data['${appLanguage.appLocal}AboutUsPrivacyLink'];
    final sendFormError = localized
        .data['${appLanguage.appLocal}SendFormError'];
    final sendFormMessage = localized
        .data['${appLanguage.appLocal}SendFormMessage'];
    final sendMessageBtn = localized
        .data['${appLanguage.appLocal}SendMessageBtn'].toUpperCase();

    return Scaffold(
        appBar: AppBar(
            title: Text(
              contactUs,
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
                readOnly: false,
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
                                contactFormName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 6),
                              FormBuilderTextField(
                                attribute: 'name',
                                style: TextStyle(
                                    color: HexColor.fromHex('#363636'),
                                    fontSize: 18,
                                    backgroundColor: Colors.white),
                                decoration: InputDecoration(
                                  // contentPadding: EdgeInsets.only(top: 13, bottom: 14, left: 16),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                  errorStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: HexColor.fromHex('#ff3b30'),
                                  ),
                                ),
                                validators: [
                                  FormBuilderValidators.required(errorText:
                                  sendFormError),
                                ],
                              ),
                            ])),
                    Container(
                        padding: EdgeInsets.only(bottom: 16.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                contactFormEmail,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 6),
                              FormBuilderTextField(
                                attribute: 'email',
                                style: TextStyle(
                                    color: HexColor.fromHex('#363636'),
                                    fontSize: 18,
                                    backgroundColor: Colors.white),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 13, bottom: 14, left: 16),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                  errorStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: HexColor.fromHex('#ff3b30')
                                  ),
                                ),
                                validators: [
                                  FormBuilderValidators.required(errorText:
                                  sendFormError),
                                  FormBuilderValidators.email()
                                ],
                              ),
                            ])),
                    Container(
                        padding: EdgeInsets.only(bottom: 16.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                contactFormPhoneNumber,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 6),
                              FormBuilderTextField(
                                attribute: 'mobile',
                                style: TextStyle(
                                    color: HexColor.fromHex('#363636'),
                                    fontSize: 18,
                                    backgroundColor: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 13, bottom: 14, left: 16),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                  errorStyle: TextStyle(
                                      fontSize: 16.0,
                                    color: HexColor.fromHex('#ff3b30')
                                  ),
                                ),
                                validators: [
                                  FormBuilderValidators.required(
                                      errorText: sendFormError
                                  ),
                                  FormBuilderValidators.numeric(
                                      errorText:
                                      "Please enter your Phone number"
                                  )
                                ],
                              ),
                            ])),
                    Container(
                        padding: EdgeInsets.only(bottom: 16.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                contactFormSubject,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 6),
                              FormBuilderTextField(
                                attribute: 'subject',
                                style: TextStyle(
                                    color: HexColor.fromHex('#363636'),
                                    fontSize: 18,
                                    backgroundColor: Colors.white),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 13, bottom: 14, left: 16),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                  errorStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: HexColor.fromHex('#ff3b30')
                                  ),
                                ),
                                validators: [
                                  FormBuilderValidators.required(
                                      errorText: sendFormError
                                  ),
                                ],
                              ),
                            ])),
                    Container(
                        padding: EdgeInsets.only(bottom: 30.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                contactFormMessage,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 6),
                              FormBuilderTextField(
                                attribute: 'message',
                                keyboardType: TextInputType.multiline,
                                maxLines: 4,
                                style: TextStyle(
                                    color: HexColor.fromHex('#363636'),
                                    fontSize: 18,
                                    backgroundColor: Colors.white),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 13, bottom: 14, left: 16),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                  errorStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: HexColor.fromHex('#ff3b30')
                                  ),
                                ),
                                validators: [
                                  FormBuilderValidators.required(
                                      errorText: sendFormError
                                  ),
                                ],
                              ),
                            ])),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            text: '$contactFormText\n',
                          ),
                          TextSpan(
                            style: TextStyle(
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                            ),
                            text: contactFormTerms,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                final url =
                                    termsLink;
                                if (await canLaunch(url)) {
                                  await launch(
                                    url,
                                    forceSafariVC: false,
                                  );
                                }
                              },
                          ),
                          TextSpan(
                            style: TextStyle(fontSize: 16),
                            text: ' $contactFormAnd ',
                          ),
                          TextSpan(
                            style: TextStyle(
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                            ),
                            text: '$contactFormPrivacy\n',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                final url =
                                    privacyLink;
                                if (await canLaunch(url)) {
                                  await launch(
                                    url,
                                    forceSafariVC: false,
                                  );
                                }
                              },
                          ),
                          TextSpan(
                            style: TextStyle(fontSize: 16),
                            text: contactFormLasttext,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    RaisedButton.icon(
                      onPressed: () {
                        String mailBody = '';

                        _fbKey.currentState.save();
                        _fbKey.currentState.value.forEach((key, value) {
                          mailBody +=
                              '<table border="1" cellpadding="0"cellspacing="0" width="100" style="background: grey">'
                              '<tr>'
                              '<td>$key</td>'
                              '<td>$value</td></tr></table>';
                        });

                        if (_fbKey.currentState.validate()) {
                          httpService.sendMail(
                              'hclmobapp@gmail.com',
                              'Hcl_mob_34858316',
                              'shkyrmetova1@gmail.com',// recipient email 'info@halalcontrol.lt'
                              'Contact us form data',
                              mailBody,
                              []);
                          // Backendless.messaging.sendHTMLEmail(
                          //     "Reminder",
                          //     mailBody,
                          //     ["shkyrmetova1@gmail.com"]).then((response) {
                          //   print("Email has been sent");
                          //
                          // });
                          Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (context) {
                                Future.delayed(Duration(seconds: 5), () {
                                  Navigator.of(context).pop(true);
                                });
                                return AlertDialog(
                                  content: Text(sendFormMessage,
                                    style: TextStyle(fontSize: 16, color: HexColor.fromHex('#363636')),),
                                );
                              });
                        } else {
                          print(_fbKey.currentState.value);
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
                      label: Text(sendMessageBtn),
                      color: HexColor.fromHex('#db2d2d'),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              )),
        ]));
  }
}
