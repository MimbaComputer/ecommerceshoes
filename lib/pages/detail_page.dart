import 'package:ecommerceshoes/core/const.dart';
import 'package:ecommerceshoes/models/shoe_model.dart';
import 'package:ecommerceshoes/widgets/app_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:math' as math;

class DetailPage extends StatefulWidget {
  final ShoeModel shoeModel;

  DetailPage({this.shoeModel});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.shoeModel.color,
        appBar: AppBar(
          backgroundColor: widget.shoeModel.color,
          elevation: 0,
          title: Text("CATEGORIES"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width,
                  child: ClipPath(
                    clipper: AppClipper(
                        cornerSize: 50,
                        diagonalHeight: 180,
                        roundedBottom: false),
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(top: 180, left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 300,
                            child: Text(
                              "${widget.shoeModel.name}",
                              style: TextStyle(
                                fontSize: 32,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          _buildRating(),
                          SizedBox(height: 24),
                          Text(
                            "DETAILS",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 18),
                          Text(
                            "${widget.shoeModel.desc}",
                            style: TextStyle(
                              color: Colors.black38,
                            ),
                          ),
                          SizedBox(height: 18),
                          Text(
                            "COLOR OPTIONS",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Row(
                            children: [
                              _buildColorOption(AppColors.blueColor),
                              _buildColorOption(AppColors.greenColor),
                              _buildColorOption(AppColors.orangeColor),
                              _buildColorOption(AppColors.redColor),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: _buildBottom(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Hero(
                  tag: "assets/images/shoes/${widget.shoeModel.imgPath}",
                  child: Transform.rotate(
                    angle: -math.pi / 7,
                    child: Image(
                      width: MediaQuery.of(context).size.width * 0.9,
                      image: AssetImage(
                          "assets/images/shoes/${widget.shoeModel.imgPath}"),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget _buildBottom() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "PRICE",
                style: TextStyle(
                  color: Colors.black26,
                ),
              ),
              Text(
                "\$${widget.shoeModel.price.toInt()}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 50,
            ),
            decoration: BoxDecoration(
              color: AppColors.greenColor,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: Text(
              "ADD CART",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildColorOption(Color color) {
  return Container(
    width: 20,
    height: 20,
    margin: EdgeInsets.only(right: 8),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(
        Radius.circular(50),
      ),
    ),
  );
}

Widget _buildRating() {
  return Row(
    children: [
      RatingBar(
        initialRating: 3,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemSize: 20,
        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
      SizedBox(
        width: 16,
      ),
      Text(
        "123 Reviews",
        style: TextStyle(
          color: Colors.black26,
        ),
      )
    ],
  );
}
