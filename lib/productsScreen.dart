import 'package:flutter/material.dart';
import 'package:flutter_app/http_service.dart';
import 'models/post_model.dart';
import 'extensions/extensions.dart';

class ProductsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductsScreenState();
}

class ProductsScreenState extends State<ProductsScreen> {
  List<Product> products = List();
  List<Product> filteredProducts = List();
  final HttpService httpService = HttpService();
  TextEditingController idController = TextEditingController();

  @override
  void initState() {
    super.initState();
    httpService.getProducts().then((postFromServer) {
      setState(() {
        products = postFromServer;
        filteredProducts = products;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PRODUCTS'),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: idController,
                    style: TextStyle(backgroundColor: Colors.white),
                    onChanged: (value) {
                      setState(() {
                        filteredProducts = products.where((element) {
                          return element
                              .categories_products.first.category_product
                              .toString()
                              .toLowerCase()
                              .contains(value.toLowerCase());
                        }).toList();
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  child: filteredProducts.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: filteredProducts.length,
                          itemBuilder: (context, ind) {
                            var item = filteredProducts[ind];
                            if (item.categories_products != null) {
                              var category = item
                                  .categories_products.first.category_product
                                  .toString();
                              return Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                        title: Text(
                                          category,
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
