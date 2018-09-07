import 'package:flutter/material.dart';
import 'product_detail.dart';
import 'product.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardState createState() => new _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Product> productsArray = [];
  List<Product> dealsArray = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    dealsArray.add(Product(51, "images/rayban.jpg", "Rayban Sunglass", 1997,
        "Ray-Ban is an Italian brand of sunglasses and eyeglasses created in 1937 by the American company Bausch & Lomb. The brand is known for their Wayfarer and Aviator lines of sunglasses. In 1999, Bausch & Lomb sold the brand to the Italian eyewear conglomerate, Luxottica Group, for a reported US\$640 million."));
    dealsArray.add(Product(
        52,
        "images/sandisk.jpeg",
        "SanDisk Pendrive 32 gb",
        650,
        "SanDisk Cruzer Blade 32 GB Pen Drive (Red, Black). Whether it is our favourite tracks and videos or important business-related files, these days we prefer to easily access of digital stuff wherever we go. With this compact and portable 32GB SanDisk Cruzer Blade pen drive, you will get all the space you need to carry your digital files on the go."));

    productsArray.add(Product(1, "images/macbook.jpeg", "MacBook Air", 52000,
        "The MacBook Air is Apple’s most affordable laptop. If you’re looking for a good performing machine at low price, the MacBook Air fits the bill."));
    productsArray.add(Product(2, "images/iphonex.jpg", "iPhone X", 84000,
        "Apple iPhone X smartphone was launched in September 2017. The phone comes with a 5.80-inch touchscreen display with a resolution of 1125 pixels by 2436 pixels."));
    productsArray.add(Product(3, "images/watch.jpg", "Apple watch", 27000,
        "The Apple Watch is a smartwatch that operates as a small wearable computing device worn on a user's wrist. The Apple Watch was officially announced on September 9th, 2014, with availability of the new device expected in early 2015."));
    productsArray.add(Product(4, "images/oneplus6.jpg", "One Plus 6", 34999,
        "The phone comes with a 6.28-inch touchscreen display with a resolution of 1080 pixels by 2280 pixels. OnePlus 6 price in India starts from Rs. 34,999. The OnePlus 6 is powered by 2.8GHz octa-core processor and it comes with 8GB of RAM. The phone packs 128GB of internal storage that cannot be expanded."));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: new Scaffold(
            appBar: new AppBar(
              backgroundColor: Color.fromRGBO(172, 44, 36, 1.0),
              title: new Text(widget.title),
              bottom: TabBar(indicatorColor: Colors.white, tabs: [
                Tab(
                  child: Text("Featured Products"),
                ),
                Tab(child: Text("Today's Deals")),
              ]),
            ),
            body: TabBarView(children: [
              GridView.count(
                crossAxisCount: 2,
                children: _getWidgetsArray(productsArray),
              ),
              ListView(
                children: _getDealsWidgetArray(dealsArray),
              )
            ])
            // This trailing comma makes auto-formatting nicer for build methods.
            ),
      ),
    );
  }

  List<Widget> _getWidgetsArray(List<Product> products) {
    List<Widget> widgetsArray = [];
    for (int i = 0; i < products.length; i++) {
      widgetsArray.add(
        InkWell(
          child: Card(
            child: Column(
              children: <Widget>[
                Expanded(
                    child: Hero(
                        tag: products[i].productId,
                        child: Image.asset(products[i].productImage))),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(products[i].productName),
                          Text("Rs " + products[i].productPrice.toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetail(product: products[i]),
              ),
            );
          },
        ),
      );
    }
    return widgetsArray;
  }

  List<Widget> _getDealsWidgetArray(List<Product> products) {
    List<Widget> widgetsArray = [];
    for (int i = 0; i < products.length; i++) {
      widgetsArray.add(ListTile(
        leading: Hero(
            tag: products[i].productId,
            child: Image.asset(
              dealsArray[i].productImage,
              height: 50.0,
              width: 50.0,
            )),
        title: Text(dealsArray[i].productName),
        trailing: Text("Rs " + dealsArray[i].productPrice.toString()),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetail(product: products[i]),
            ),
          );
        },
      ));
    }
    return widgetsArray;
  }
}
