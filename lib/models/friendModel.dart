import 'package:flutter/material.dart';

class FriendsModel {
  String name;
  int height;
  int calories;
  int bpm;
  String addr;
  String calImg;

  FriendsModel({
    required this.name,
    required this.height,
    required this.calories,
    required this.bpm,
    required this.addr,
    required this.calImg,
  });

  static List<FriendsModel> getAllFriends(){
    List<FriendsModel> friendsModel = [];

    friendsModel.add(
      FriendsModel(
        name: "Edward Lai",
        height: 183,
        calories: 750,
        bpm: 18,
        addr: 'assets/images/friend/friend_1.png',
        calImg: 'assets/images/friend/Cal_1.png',
      )
    );

    friendsModel.add(
        FriendsModel(
          name: "Wuqi Song",
          height: 165,
          calories: 800,
          bpm: 17,
          addr: 'assets/images/friend/friend_2.png',
          calImg: 'assets/images/friend/Cal_2.png',
        )
    );

    friendsModel.add(
        FriendsModel(
          name: "Daniel Kang",
          height: 180,
          calories: 1000,
          bpm: 16,
          addr: 'assets/images/friend/friend_3.png',
          calImg: 'assets/images/friend/Cal_3.png',
        )
    );

    friendsModel.add(
        FriendsModel(
          name: "Nayeon Lim",
          height: 165,
          calories: 700,
          bpm: 19,
          addr: 'assets/images/friend/friend_5.png',
          calImg: 'assets/images/friend/Cal_4.png',
        )
    );

    return friendsModel;

  }
}