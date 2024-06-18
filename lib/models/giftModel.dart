import 'package:flutter/material.dart';

class GiftsModel {
  String name;
  int coins;
  String image;

  GiftsModel({
    required this.name,
    required this.coins,
    required this.image,
  });

  static List<GiftsModel> getAllGifts(){
    List<GiftsModel> giftsModel = [];

    giftsModel.add(
        GiftsModel(
          name: "Hamburger",
          coins: 5,
          image: 'assets/images/friend/gift_1.png',
        )
    );

    giftsModel.add(
        GiftsModel(
          name: " HotPot",
          coins: 8,
          image: 'assets/images/friend/gift_2.png',
        )
    );

    giftsModel.add(
        GiftsModel(
          name: "Pizza",
          coins: 10,
          image: 'assets/images/friend/gift_3.png',
        )
    );

    giftsModel.add(
        GiftsModel(
          name: "Hamburger",
          coins: 5,
          image: 'assets/images/friend/gift_1.png',
        )
    );

    giftsModel.add(
        GiftsModel(
          name: " HotPot",
          coins: 8,
          image: 'assets/images/friend/gift_2.png',
        )
    );

    giftsModel.add(
        GiftsModel(
          name: "Pizza",
          coins: 10,
          image: 'assets/images/friend/gift_3.png',
        )
    );

    return giftsModel;

  }
}