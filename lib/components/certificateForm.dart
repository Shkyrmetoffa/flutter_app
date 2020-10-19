import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CertificateForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CertificateFormState();
}

class CertificateFormState extends State {
  TextEditingController idController = TextEditingController();
  String id = '';
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Container(
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
                      prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0), // centered prefixIcon vertically
                      prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 37, right: 6),
                          child: Text('ID:',
                              style: TextStyle(
                                color: Color.fromARGB(255, 38, 38, 38),
                                fontSize: 26.0,
                              ),
                          )
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'HC1234567890',
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 199, 199, 199),
                          fontSize: 26)),
                  style: TextStyle(
                    fontSize: 26,
                    color: Color.fromARGB(255, 38,38,38)
                  ),
                  validator: (value) {
                    Pattern pattern = r'[a-zA-Z]{2}[0-9]{10}$'; // should check only 2 letters
                    RegExp regex = new RegExp(pattern);
                    if (!regex.hasMatch(value)) {
                      return 'Please enter unique ID number in the box';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (text) {
                    setState(() {
                      id = idController.text;
                    });
                  },
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate())
                      Navigator.pushNamed(context, '/post');
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
        )
    );
  }
}
