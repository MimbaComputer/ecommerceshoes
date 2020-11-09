import 'package:ecommerceshoes/core/const.dart';
import 'package:flutter/material.dart';

class ShoeModel {
  final String name;
  final double price;
  final String desc;
  final Color color;
  final String brand;
  final String imgPath;

  ShoeModel(
      {this.name, this.price, this.desc, this.color, this.brand, this.imgPath});

  static List<ShoeModel> list = [
    ShoeModel(
        name: 'Nike Air Jordan 1 Retro High',
        desc:
            'Familar but always fresh, the iconic Air Jordan 1 is remastered for today\'s',
        color: AppColors.yellowColor,
        imgPath: "1.png",
        price: 185,
        brand: 'Nike'),
    ShoeModel(
        name: 'Converse X OPI Check Taylor',
        desc:
            'Familar but always fresh, the iconic Air Jordan 1 is remastered for today\'s',
        color: AppColors.pinkColor,
        imgPath: "5.png",
        price: 477,
        brand: 'Converse'),
    ShoeModel(
        name: 'Mimba Better 1',
        desc:
            'Familar but always fresh, the iconic Air Jordan 1 is remastered for today\'s',
        color: AppColors.blueColor,
        imgPath: "6.png",
        price: 3088,
        brand: 'Mimba'),
    ShoeModel(
        name: 'DevOps X4X',
        desc:
            'Familar but always fresh, the iconic Air Jordan 1 is remastered for today\'s',
        color: Colors.grey,
        imgPath: "7.png",
        price: 534,
        brand: 'DevOps'),
    ShoeModel(
        name: 'DevOps X4X',
        desc:
            'Familar but always fresh, the iconic Air Jordan 1 is remastered for today\'s',
        color: Colors.purple,
        imgPath: "8.png",
        price: 534,
        brand: 'DevOps'),
    ShoeModel(
        name: 'DevOps X4X',
        desc:
            'Familar but always fresh, the iconic Air Jordan 1 is remastered for today\'s',
        color: AppColors.orangeColor,
        imgPath: "10.png",
        price: 534,
        brand: 'DevOps'),
    ShoeModel(
        name: 'DevOps X4X',
        desc:
            'Familar but always fresh, the iconic  MPinker is remastered for today\'s',
        color: Colors.pink,
        imgPath: "11.png",
        price: 834,
        brand: 'MPinker'),
    ShoeModel(
        name: 'DevOps X4X',
        desc:
            'Familar but always fresh, the iconic Air Jordan 1 is remastered for today\'s',
        color: AppColors.orangeColor,
        imgPath: "12.png",
        price: 534,
        brand: 'DevOps'),
    ShoeModel(
        name: 'DevOps X4X',
        desc:
            'Familar but always fresh, the Onnana 1 is remastered for today\'s',
        color: Colors.cyan,
        imgPath: "13.png",
        price: 34,
        brand: 'Onnana'),
  ];
}
