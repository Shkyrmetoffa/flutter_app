import 'package:flutter/material.dart';
import 'package:flutter_app/app_localizations.dart';
import 'package:flutter_app/http_service.dart';
import 'package:provider/provider.dart';
import '../models/post_model.dart';
import '../extensions/extensions.dart';

class ProductsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductsScreenState();
}

class ProductsScreenState extends State<ProductsScreen> {
  AppLanguage appLanguage = AppLanguage();
  LocalizedData localizedData = LocalizedData();
  List<Product> productsList = List();
  List<Product> filteredProductsList = List();
  final HttpService httpService = HttpService();
  TextEditingController idController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final locale = context.read<AppLanguage>().appLocal.toString();

    httpService.getProducts(locale).then((postFromServer) {
      setState(() {
        productsList = postFromServer;
        filteredProductsList = productsList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    var localized = Provider.of<LocalizedData>(context);

    final products =
    localized.data['${appLanguage.appLocal}Products'].toUpperCase();

    return Scaffold(
        appBar: AppBar(
          title: Text(products),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back, // add custom icons also
            ),
          ),
          backgroundColor: HexColor.fromHex('#96c42d'),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              color: HexColor.fromHex('#363636'),
              child: Column(children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10.0),
                  color: HexColor.fromHex('#565656'),
                  child: TextField(
                    controller: idController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Search products',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 199, 199, 199),
                            fontSize: 16)),
                    onChanged: (value) {
                      setState(() {
                        filteredProductsList = productsList.where((element) {
                          return element
                              .categories_products.first.category_product
                              .toString()
                              .toLowerCase()
                              .contains(value.toLowerCase());
                        }).toList();
                      });
                    },
                  ),
                ),
                Expanded(
                    child: Container(
                  child: filteredProductsList.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          padding: EdgeInsets.only(top: 10.0),
                          itemCount: filteredProductsList.length,
                          itemBuilder: (context, ind) {
                            var item = filteredProductsList[ind];
                            if (item.categories_products != null) {
                              var category = item
                                  .categories_products.first.category_product
                                  .toString();
                              return Card(
                                margin: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                                  clipBehavior: Clip.antiAlias,
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                        title: Text(
                                          category,
                                          style: TextStyle(
                                            color: HexColor.fromHex('#96c42d'),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ),
                                    ],
                                  ));
                            }
                            return Container(height: 0, width: 0);
                          },
                        ),
                ))
              ]),
            ),
          ],
        ));
  }
}
