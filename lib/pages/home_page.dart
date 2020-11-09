import 'package:ecommerceshoes/core/const.dart';
import 'package:ecommerceshoes/core/my_flutter_icons.dart';
import 'package:ecommerceshoes/models/shoe_model.dart';
import 'package:ecommerceshoes/pages/detail_page.dart';
import 'package:ecommerceshoes/widgets/app_clipper.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

List<ShoeModel> shoeList = ShoeModel.list;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'by mimba',
                  style: TextStyle(
                      fontSize: 9,
                      color: Colors.orange,
                      fontStyle: FontStyle.italic),
                ),
                IconButton(
                  icon: Icon(Icons.search, color: Colors.black26),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Container(
            height: 350,
            child: ListView.builder(
                itemCount: shoeList.length,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => DetailPage(
                            shoeModel: shoeList[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 230,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: _buildBackground(index, 230),
                          ),
                          Positioned(
                            bottom: 150,
                            right: 50,
                            child: Text(
                              'by mimba',
                              style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                          Positioned(
                            bottom: 130,
                            right: 0,
                            child: Hero(
                              tag:
                                  "assets/images/shoes/${shoeList[index].imgPath}",
                              child: Transform.rotate(
                                angle: -math.pi / 7,
                                child: Image(
                                  width: 200,
                                  image: AssetImage(
                                      "assets/images/shoes/${shoeList[index].imgPath}"),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "JUST FOR YOU",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
                Text(
                  'by mimba',
                  style: TextStyle(
                      fontSize: 9,
                      color: Colors.orange,
                      fontStyle: FontStyle.italic),
                ),
                Text(
                  "VIEW ALL",
                  style: TextStyle(color: AppColors.greenColor, fontSize: 12),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          ...shoeList.map((data) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => DetailPage(
                      shoeModel: data,
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(right: 16, left: 16, bottom: 10),
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage("assets/images/shoes/${data.imgPath}"),
                      width: 100,
                      height: 60,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .4,
                            child: Text(
                              "${data.name}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "${data.brand}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black26,
                                height: 1.5),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "\$${data.price.toInt()}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 10)
            ]),
        child: BottomNavigationBar(
          selectedItemColor: AppColors.greenColor,
          unselectedItemColor: Colors.black26,
          currentIndex: 1,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.open_with),
                ),
                title: Text("data")),
            BottomNavigationBarItem(
                icon: Icon(Icons.list), title: Text("data")),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket), title: Text("data")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), title: Text("data")),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground(int index, double width) {
    return ClipPath(
      clipper: AppClipper(cornerSize: 25, diagonalHeight: 100),
      child: Container(
        color: shoeList[index].color,
        width: width,
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Icon(
                      shoeList[index].brand == 'Nike'
                          ? Icons.ac_unit
                          : MyFlutterIcons.adidas,
                      size: 30,
                      color: Colors.white),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Container(
                  width: 125,
                  child: Text("${shoeList[index].name}",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
                SizedBox(height: 8),
                Text(
                  "\$${shoeList[index].price}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: AppColors.greenColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
