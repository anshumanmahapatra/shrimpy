import 'package:flutter/material.dart';
import 'package:shrimpy/constants/products.dart';
import 'package:shrimpy/widgets/drawer.dart';
import 'package:shrimpy/widgets/product_tile.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gridData = productData;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        key: _scaffoldKey,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            elevation: 0.0,
            title: const Text("Shrimpy"),
            actions: const [
              Icon(Icons.search),
              SizedBox(width: 10),
              Icon(Icons.shopping_cart),
              SizedBox(width: 10),
            ],
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
            bottom: const TabBar(
              isScrollable: true,
              indicatorWeight: 3,
              tabs: [
                Tab(child: Text("All")),
                Tab(child: Text("Nets")),
                Tab(child: Text("Traps")),
                Tab(child: Text("Feed")),
                Tab(child: Text("Pumps")),
                Tab(child: Text("Vessels")),
              ],
            )),
        drawer: DrawerHelpers().showDrawer(context),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Column(
                  children: [
                    GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 4,
                          childAspectRatio: 0.5,
                        ),
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: gridData.length,
                        itemBuilder: (context, index) {
                          final products = gridData[index];
                          return ProductTile()
                              .buildProductGrid(context, products);
                        }),
                  ],
                ),
              ),
            ),
            const SizedBox(child: Text("Empty")),
            const SizedBox(child: Text("Empty")),
            const SizedBox(child: Text("Empty")),
            const SizedBox(child: Text("Empty")),
            const SizedBox(child: Text("Empty")),
          ],
        ),
      ),
    );
  }
}
