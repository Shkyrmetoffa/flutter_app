import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_app/app_localizations.dart';
import 'package:flutter_app/models/post_model.dart';
import 'package:provider/provider.dart';
import '../extensions/extensions.dart';

class EnumbersScreen extends StatefulWidget {
  @override
  _EnumbersScreenState createState() => _EnumbersScreenState();
}

class _EnumbersScreenState extends State<EnumbersScreen> {
  AppLanguage appLanguage = AppLanguage();
  LocalizedData localizedData = LocalizedData();
  static List _data = [];
  List<ENumbersData> ENumbers = [];
  List<ENumbersData> filteredENumbers = [];
  TextEditingController idController = TextEditingController();

  @override
  void initState() {
    loadAsset();
    // setState(() {
    //   ENumbers = _makeENumbersDataList(_data);
    //   filteredENumbers = ENumbers;
    // });
    super.initState();
  }

  loadAsset() async {
    final myData = await rootBundle.loadString("assets/E100.csv");

    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);

    setState(() {
      _data = csvTable;
      ENumbers = _makeENumbersDataList(_data);
      filteredENumbers = ENumbers;
    });
  }

  static List<ENumbersData> _makeENumbersDataList(data) {
    var list = <ENumbersData>[];

    if (data.toString().length > 0) {
      data.removeAt(0); //remove column heading

      for (var line in data) {
        var splitedLine = line.toString().split(';');
        list.add(ENumbersData.fromList(splitedLine));
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    var localized = Provider.of<LocalizedData>(context);

    final eNumbers =
    localized.data['${appLanguage.appLocal}Enumbers']?.toUpperCase();

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: () async {
              await loadAsset();
            }),
        appBar: AppBar(
          title: Text(eNumbers ?? ''),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back, // add custom icons also
            ),
          ),
          backgroundColor: HexColor.fromHex('#ea8834'),
        ),
        body: Container(
            color: HexColor.fromHex('#363636'),
            child: Column(children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10.0),
                color: HexColor.fromHex('#565656'),
                child: TextField(
                  controller: idController,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      ),
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search E numbers',
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 199, 199, 199),
                          fontSize: 16)),
                  onChanged: (value) {
                    setState(() {
                      filteredENumbers = ENumbers.where((element) => (element
                          .number
                          .toLowerCase()
                          .contains(value.toLowerCase()))).toList();
                    });
                  },
                ),
              ),
              Expanded(
                child: filteredENumbers.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        padding: EdgeInsets.only(top: 10.0),
                        itemCount: filteredENumbers.length,
                        itemBuilder: (context, ind) {
                          var number = filteredENumbers[ind].number.toString();
                          var name = filteredENumbers[ind].name.toString();
                          var group = filteredENumbers[ind].group.toString();
                          var description =
                              filteredENumbers[ind].description.toString();
                          var status = filteredENumbers[ind].status.toString();
                          Color getColor() {
                            if (status == 'Halal]') {
                              return HexColor.fromHex('#96c42d');
                            } else if (status == 'Haram]') {
                              return HexColor.fromHex('#db2d2d');
                            } else {
                              return HexColor.fromHex('#999999');
                            }
                          }

                          return Card(
                            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10,),
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(10.0),
                                    color: getColor(),
                                    child: Center(
                                        child: Text('${number} - ${status.toUpperCase()}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white
                                                ))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:16.0, left:16.0, right: 16.0),
                                    child: Text(
                                      name,
                                      style: TextStyle(
                                          color: HexColor.fromHex('#363636'),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:12.0, left: 16.0, right: 16.0),
                                    child: Text(
                                      group,
                                      style: TextStyle(
                                        color: HexColor.fromHex('#363636'),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      description,
                                      style: TextStyle(
                                        color: HexColor.fromHex('#363636'),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal
                                      ),
                                    ),
                                  ),
                                ],
                              ));
                        },
                      ),
              )
            ])));
  }
}
