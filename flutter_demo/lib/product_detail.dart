import 'package:flutter/material.dart';
import 'product.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  // In the constructor, require a Todo
  ProductDetail({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Color.fromRGBO(172, 44, 36, 1.0),
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(product.productName.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  //       background: Image.asset(product.productImage.toString(),fit: BoxFit.cover,),
                ),
              ),
            ];
          },
          body: Center(
            child: ListView(
              children: <Widget>[
                    Hero(
                    tag: product.productId,
                    child: Image.asset(
                      product.productImage.toString(),
                      fit: BoxFit.contain,
                      height: 200.0,
                    )),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(product.productDesc.toString(),style: TextStyle(fontSize: 16.0),),
                ),
                  ],
            ),
          ),
        ),
      ),
    );
  }
}
