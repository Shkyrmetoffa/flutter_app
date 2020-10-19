import 'package:flutter/material.dart';
import 'package:flutter_app/components/certificateForm.dart';
import 'package:flutter_app/http_service.dart';
import 'models/post_model.dart';
import 'extensions/extensions.dart';

class CertificateCheckScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CertificateCheckScreenState();
}

class CertificateCheckScreenState extends State<CertificateCheckScreen> {
  List<Post> certificates = [];
  List<Post> filteredCertificates = [];
  List checkProcess;
  final HttpService httpService = HttpService();
  final _formKey = GlobalKey<FormState>();
  TextEditingController idController = TextEditingController();
  String id = '';
  bool showData = false;
  bool noData = false;

  @override
  void initState() {
    super.initState();
    httpService.getPosts().then((postFromServer) {
      setState(() {
        certificates = postFromServer;
        filteredCertificates = certificates;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CERTIFICATE CHECK'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
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
                child: ListView(
    children: <Widget>[
                Container(
//                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                    Text(filteredCertificates[0].title,
                        style: TextStyle(
                            color: HexColor.fromHex('#84db2d'), fontSize: 24)),
                    Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'ID No: ',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                          TextSpan(
                              text: filteredCertificates[0].id_certificate,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Status: ',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                          TextSpan(
                              text: filteredCertificates[0]
                                  .status_certificate
                                  .first
                                  .label
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor.fromHex(
                                      filteredCertificates[0]
                                          .color_valid
                                          .toString()))),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Certificate valid until: ',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                          TextSpan(
                              text:
                                  filteredCertificates[0].date_until.toString(),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                    Image.network(
                      filteredCertificates[0]
                          .certificate_list
                          .first
                          .certificate_image
                          .toString(),
                      // height: 500,
                    )
                  ]
                    )
                )
    ])
        )
            : Positioned(
                child: Container(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'How to check the Halal Certificate',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 30),
                        child: Text(
                          'Type the unique ID number in the box to see the Certificate and its Annex.',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
//        padding: EdgeInsets.all(10.0),
                          child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 30),
                              child: TextFormField(
                                controller: idController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    prefixIconConstraints: BoxConstraints(
                                        minWidth: 0,
                                        minHeight:
                                            0), // centered prefixIcon vertically
                                    prefixIcon: Padding(
                                        padding:
                                            EdgeInsets.only(left: 37, right: 6),
                                        child: Text(
                                          'ID:',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 38, 38, 38),
                                            fontSize: 26.0,
                                          ),
                                        )),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'HC1234567890',
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 199, 199, 199),
                                        fontSize: 26)),
                                style: noData
                                    ? TextStyle(fontSize: 26, color: Colors.red)
                                    : TextStyle(
                                        fontSize: 26,
                                        color: Color.fromARGB(255, 38, 38, 38)),
                                validator: (value) {
                                  Pattern pattern =
                                      r'[a-zA-Z]{2}[0-9]{10}$'; // should check only 2 letters
                                  RegExp regex = new RegExp(pattern);
                                  if (!regex.hasMatch(value)) {
                                    return 'Please enter unique ID number in the box';
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
                              child: RaisedButton(
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    checkProcess = certificates
                                        .where((post) =>
                                            post.id_certificate.toString() ==
                                            id)
                                        .toList();
                                    if (checkProcess.length != 0) {
                                      setState(() {
                                        filteredCertificates = checkProcess;
                                        showData = !showData;
                                      });
                                    } else {
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
                                child: Text("CERTIFICATE CHECK"),
                                color: Color.fromARGB(255, 219, 45, 45),
                                textColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )),
                      noData
                          ? Column(children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 30),
                                child: Text(
                                  'Nothing found, please try different ID number',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.red),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/fraud');
                                },
                                child: Text("REPORT FRAUD"),
                                color: HexColor.fromHex('#28934b'),
                                textColor: Colors.white,
                              )
                            ])
                          : Text(''),
                    ],
                  ),
                ),
              )
      ]),
    );
  }
}
