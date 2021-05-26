import 'package:flutter/material.dart';
// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:pdf_viewer_jk/pdf_viewer_jk.dart';
import 'package:flutter_app/app_localizations.dart';
import 'package:flutter_app/http_service.dart';
import '../models/post_model.dart';
import '../extensions/extensions.dart';
import 'package:provider/provider.dart';

class CertificateCheckScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CertificateCheckScreenState();
}

class CertificateCheckScreenState extends State<CertificateCheckScreen> {
  AppLanguage appLanguage = AppLanguage();
  LocalizedData localizedData = LocalizedData();

  List<Post> certificates = [];
  List<Post> filteredCertificates = [];
  // List<dynamic>? checkProcess;
  final HttpService httpService = HttpService();
  final _formKey = GlobalKey<FormState>();
  TextEditingController idController = TextEditingController();
  String id = '';
  bool showData = false;
  bool noData = false;
  bool showPdf = false;
  late PDFDocument document;

  @override
  void initState() {
    super.initState();
    final locale = context.read<AppLanguage>().appLocal.toString();

    httpService.getPosts(locale).then((postFromServer) {
      setState(() {
        certificates = postFromServer;
        filteredCertificates = certificates;
      });
    });
  }

  _loadPdf() async {
    final checkedCertificate = filteredCertificates[0]
        .certificate_list
        ?.first
        .certificate_pdf
        .toString();
    document = await PDFDocument.fromURL(checkedCertificate ?? '');
    setState(() {
      showPdf = !showPdf;
    });
  }

  validationMessage(text) {}

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    var localized = Provider.of<LocalizedData>(context);

    final certificateCheck = localized
        .data['${appLanguage.appLocal}CertificateCheck']
        ?.toUpperCase();
    final certCheckBold =
        localized.data['${appLanguage.appLocal}MobileCertCheckBold'];
    final certCheckText =
        localized.data['${appLanguage.appLocal}MobileCertCheckText'];
    final certCheckBtn = localized
        .data['${appLanguage.appLocal}CertificateCheckBtn']
        ?.toUpperCase();
    final certCheckIdNo =
        localized.data['${appLanguage.appLocal}MobileCertIdNo'];
    final certCheckStatus =
        localized.data['${appLanguage.appLocal}MobileCertStatus'];
    final certValidUntil =
        localized.data['${appLanguage.appLocal}MobileCertValidUntil'];
    final certOpenInPdf =
        localized.data['${appLanguage.appLocal}OpenInPdf']?.toUpperCase();
    final certCheckNotFound =
        localized.data['${appLanguage.appLocal}CertCheckNotFound'];
    final certReportFraud =
        localized.data['${appLanguage.appLocal}ReportFraud2']?.toUpperCase();
    final certCheckEmpty =
        localized.data['${appLanguage.appLocal}CertificateCheckEmpty'];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: showData && !showPdf
          ? FloatingActionButton.extended(
              onPressed: () {
                _loadPdf();
              },
              label: Text(certOpenInPdf ?? ''),
              backgroundColor: HexColor.fromHex('#db2d2d'),
            )
          : Text(''),
      appBar: AppBar(
        title: Text(certificateCheck ?? ''),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
            setState(() {
              showData = !showData;
            });
          },
          child: Icon(
            Icons.arrow_back, // add custom icons also
          ),
        ),
        backgroundColor: HexColor.fromHex('#db2d2d'),
      ),
      body: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/home.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.7), BlendMode.srcOver)),
          ),
        ),
        showData
            ? Positioned(
                child: ListView(children: <Widget>[
                Container(
                    padding: EdgeInsets.only(left: 20.0, right: 20),
                    child: !showPdf
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: 20, bottom: 10),
                                    child: Text(
                                        filteredCertificates[0].title ?? '',
                                        style: TextStyle(
                                          color: HexColor.fromHex('#84db2d'),
                                          fontSize: 24,
                                        ))),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text('$certCheckIdNo ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              height: 1.2,
                                              color: Colors.white)),
                                      Text(
                                          filteredCertificates[0]
                                                  .id_certificate ??
                                              '',
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
                                          filteredCertificates[0]
                                                  .status_certificate
                                                  ?.first
                                                  .label
                                                  .toString() ??
                                              '',
                                          style: TextStyle(
                                              fontSize: 18,
                                              height: 1.2,
                                              fontWeight: FontWeight.bold,
                                              color: HexColor.fromHex(
                                                  filteredCertificates[0]
                                                      .color_valid
                                                      .toString()))),
                                    ]),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text('$certValidUntil ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              height: 1.2,
                                              color: Colors.white)),
                                      Text(
                                          filteredCertificates[0]
                                              .date_until
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              height: 1.2,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ]),
                                Padding(
                                  padding: EdgeInsets.only(top: 20, bottom: 20),
                                  child: Image.network(
                                    filteredCertificates[0]
                                            .certificate_list
                                            ?.first
                                            .certificate_image
                                            .toString() ??
                                        '',
                                    // height: 500,
                                  ),
                                )
                              ])
                        : SizedBox(
                            width: 300,
                            height: 600,
                            child: PDFViewer(
                              document: document,
                              showNavigation: false,
                              showIndicator: false,
                              scrollDirection: Axis.vertical,
                              showPicker: false,
                            ),
                          )),
              ]))
            : Center(
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(left: 33.0, right: 33.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            certCheckBold ?? '',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 30),
                            child: Text(
                              certCheckText ?? '',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(bottom: 40),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(bottom: 30),
                                    child: TextFormField(
                                      controller: idController,
                                      keyboardType: TextInputType.text,
                                      autofocus: true,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          prefixIconConstraints: BoxConstraints(
                                              minWidth: 0,
                                              minHeight:
                                                  0), // centered prefixIcon vertically
                                          prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 37, right: 6),
                                              child: Text(
                                                'ID:',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 38, 38, 38),
                                                  fontSize: 26.0,
                                                ),
                                              )),
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: 'HC1234567890',
                                          hintStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 199, 199, 199),
                                              fontSize: 26),
                                          errorMaxLines: 2,
                                          errorStyle: TextStyle(
                                            fontSize: 16,
                                          )),
                                      style: noData
                                          ? TextStyle(
                                              fontSize: 26, color: Colors.red)
                                          : TextStyle(
                                              fontSize: 26,
                                              color: Color.fromARGB(
                                                  255, 38, 38, 38),
                                              decoration: TextDecoration.none),
                                      validator: (value) {
                                        String pattern =
                                            r'[a-zA-Z\wа-яA-Я]{2}[0-9]{10}$'; // should check only 2 letters
                                        RegExp regex = new RegExp(pattern);
                                        if (!regex.hasMatch(value ?? '')) {
                                          return certCheckEmpty;
                                        } else {
                                          return null;
                                        }
                                      },
                                      onChanged: (text) {
                                        var idCertificate =
                                            idController.text.toUpperCase();
                                        setState(() {
                                          id = idCertificate;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.maxFinite,
                                    height: 50,
                                    child: RaisedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          final checkProcess = certificates
                                              .where((post) =>
                                                  post.id_certificate
                                                      .toString() ==
                                                  id)
                                              .toList();
                                          if (checkProcess.length != 0) {
                                            setState(() {
                                              filteredCertificates =
                                                  checkProcess;
                                              showData = !showData;
                                            });
                                          } else {
                                            FocusScope.of(context).unfocus();
                                            setState(() {
                                              noData = !noData;
                                            });
                                          }
                                        }
//                      Scaffold.of(context).showSnackBar(SnackBar(
//                        content: Text(id),
//                        backgroundColor: Colors.green,
//                      ));
                                      },
                                      child: Text(certCheckBtn ?? ''),
                                      color: Color.fromARGB(255, 219, 45, 45),
                                      textColor: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        noData
                            ? Container(
                                child: Column(
                                    // shrinkWrap: true,
                                    children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 30),
                                      child: Text(
                                        certCheckNotFound ?? '',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.red),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: RaisedButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/fraud');
                                          },
                                          padding: EdgeInsets.only(
                                              top: 9,
                                              bottom: 9,
                                              left: 16,
                                              right: 16),
                                          child: Text(certReportFraud ?? ''),
                                          color: HexColor.fromHex('#28934b'),
                                          textColor: Colors.white,
                                        ))
                                  ]))
                            : Text(''),
                      ],
                    )),
              )
      ]),
    );
  }
}
