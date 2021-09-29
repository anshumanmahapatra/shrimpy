import 'package:flutter/material.dart';
import 'package:shrimpy/constants/marketing_constant.dart';
import 'package:shrimpy/widgets/marketing_tile.dart';

class Marketing extends StatelessWidget {
  const Marketing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var marketing = marketingData;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Marketing"),
        elevation: 0,
        centerTitle: true,
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.sort),
          SizedBox(
            width: 10,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: marketing.length,
          itemBuilder: (context, index) {
            final data = marketing[index];
            return Column(
              children: [
                MarketingTile(
                  marketingConstant: data,
                ),
                const Divider(
                  color: Colors.black,
                ),
              ],
            );
          }),
    );
  }
}
