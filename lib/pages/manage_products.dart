import 'package:flutter/material.dart';
import 'package:flutter_course/pages/create_or_edit_product_page.dart';
import 'package:flutter_course/pages/my_products_page.dart';

import '../productPojo.dart';

class ManageProductPage extends StatelessWidget {
  final Function _addProduct;
  final Function updateProduct;
  final List<ProductPojo> _products;

  ManageProductPage(this._addProduct, this.updateProduct, this._products);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: Drawer(
            elevation: 8.0,
            child: Column(
              children: <Widget>[
                AppBar(
                  automaticallyImplyLeading: false,
                  title: Text('Choose'),
                ),
                ListTile(
                    leading: Icon(
                      Icons.shop,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text('All Products'),
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, "/home"))
              ],
            ),
          ),
          appBar: AppBar(
            title: Text('Manage Products'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Create Product',
                  icon: Icon(Icons.create),
                ),
                Tab(
                  text: 'My Products',
                  icon: Icon(Icons.list),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ProductCreateOrEditPage(
                addProduct: _addProduct,
              ),
              MyProductsPage(
                products: _products, updateProduct: updateProduct,),
            ],
          ),
        ));
  }
}
