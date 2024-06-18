import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indexed/indexed.dart';
import 'package:flutter/services.dart';

import 'package:swe2109537_swe311_assm1/screens/chat_page.dart';
import 'package:swe2109537_swe311_assm1/models/friendModel.dart';
import 'package:swe2109537_swe311_assm1/models/giftModel.dart';

class FriendPage extends StatefulWidget{
  const FriendPage({super.key});

  @override
  State<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage>{

  int coin = 30;
  int num = 0;
  int selGiftIdx = 0;

  List<FriendsModel> friendsModel = [];
  List<GiftsModel> giftsModel = [];
  @override
  void initState() {
    super.initState();
    _getInitialInfo();
  }
  void _getInitialInfo(){
    setState(() {
      friendsModel = FriendsModel.getAllFriends();
      giftsModel = GiftsModel.getAllGifts();
      num = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 22, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text(
                  " Friends' List",
                  style: GoogleFonts.breeSerif(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(2.0, 2.0),
                      )
                    ],
                  )
              ),
              const SizedBox(height: 10),
              buildContainer(0, context),
              const SizedBox(height: 5),
              buildContainer(1, context),
              const SizedBox(height: 5),
              buildContainer(2, context),
              const SizedBox(height: 5),
              buildContainer(3, context),
              const SizedBox(height: 5),
            ],
          )
        ),
    );
  }

  Widget buildContainer(int friendIdx, BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 360,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.transparent,
              //color: Colors.transparent,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15),
              //border: Border.all(color: Colors.black26, width: 0.5),
            ),
            child: Stack(
              children: [
                Container(
                  width: 360,
                  height: 200,
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.black26, width: 0.5),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        width: 360,
                        height: 160,
                        decoration: BoxDecoration(
                          //border: Border.all(color: Colors.black26, width: 0.5),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 272,
                              height: 160,
                              decoration: BoxDecoration(
                                color: Colors.white70.withOpacity(0.85),
                                //color: Colors.transparent,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: const Offset(3.0, 3.0),
                                    blurRadius: 2.0,
                                    spreadRadius: 1.0,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  // frame leave for people image
                                  Container(
                                    width: 110,
                                    height: 160,
                                    decoration: BoxDecoration(
                                      //border: Border.all(color: Colors.black26, width: 0.5),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  // frame for friend's body data
                                  Container(
                                    width: 140,
                                    height: 160,
                                    decoration: BoxDecoration(
                                      //border: Border.all(color: Colors.black26, width: 0.5),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 15),
                                        Text(
                                            friendsModel[friendIdx].name,
                                            style: GoogleFonts.comicNeue(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              shadows: [
                                                Shadow(
                                                  blurRadius: 3.0,
                                                  color: Colors.black,
                                                  offset: Offset(1, 1),
                                                )
                                              ],
                                            )
                                        ),
                                        const SizedBox(height: 15),
                                        Container(
                                          padding: EdgeInsets.symmetric(vertical: 2.0),
                                          child: Table(
                                            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                            columnWidths: {
                                              0: FlexColumnWidth(1),
                                              1: FlexColumnWidth(1),
                                            },
                                            children: [
                                              TableRow(
                                                  children: [
                                                    Container(
                                                      child: Text(
                                                          "Height",
                                                          style: GoogleFonts.comicNeue(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w900,
                                                            color: Colors.black,
                                                          )
                                                      ),
                                                      height: 25,
                                                    ),
                                                    Container(
                                                      child: Text(
                                                          friendsModel[friendIdx].height.toString()+"cm",
                                                          style: GoogleFonts.comicNeue(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w600,
                                                            color: Colors.black,
                                                          )
                                                      ),
                                                      height: 25,
                                                    ),
                                                  ]
                                              ),
                                              TableRow(
                                                  children: [
                                                    Container(
                                                      child: Text(
                                                          "Calories",
                                                          style: GoogleFonts.comicNeue(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w900,
                                                            color: Colors.black,
                                                          )
                                                      ),
                                                      height: 25,
                                                    ),
                                                    Container(
                                                      child: Text(
                                                          friendsModel[friendIdx].calories.toString()+"kcal",
                                                          style: GoogleFonts.comicNeue(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w600,
                                                            color: Colors.black,
                                                          )
                                                      ),
                                                      height: 25,
                                                    ),
                                                  ]
                                              ),
                                              TableRow(
                                                  children: [
                                                    Container(
                                                      child: Text(
                                                          "BodyFat",
                                                          style: GoogleFonts.comicNeue(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w900,
                                                            color: Colors.black,
                                                          )
                                                      ),
                                                      height: 25,
                                                    ),
                                                    Container(
                                                      child: Text(
                                                          friendsModel[friendIdx].bpm.toString()+"bpm",
                                                          style: GoogleFonts.comicNeue(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w600,
                                                            color: Colors.black,
                                                          )
                                                      ),
                                                      height: 25,
                                                    ),
                                                  ]
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 65,
                              height: 160,
                              decoration: BoxDecoration(
                                //border: Border.all(color: Colors.black26, width: 0.5),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 62,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: Colors.white70.withOpacity(0.85),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: const Offset(3.0, 3.0),
                                          blurRadius: 2.0,
                                          spreadRadius: 1.0,
                                        ),
                                      ],
                                    ),
                                    child: IconButton(
                                        icon: Icon(Icons.message_outlined),
                                        iconSize: 32,
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const ChatPage()),
                                          );
                                        }
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    width: 62,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: Colors.white70.withOpacity(0.85),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: const Offset(3.0, 3.0),
                                          blurRadius: 2.0,
                                          spreadRadius: 1.0,
                                        ),
                                      ],
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          backgroundColor: Colors.white.withOpacity(0),
                                          context: context,
                                          builder: (BuildContext context){
                                            return calComponent(friendIdx);
                                          }
                                        );
                                      },
                                      child: Icon(Icons.calendar_month_outlined, size: 32),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    width: 62,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: Colors.white70.withOpacity(0.85),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: const Offset(3.0, 3.0),
                                          blurRadius: 2.0,
                                          spreadRadius: 1.0,
                                        ),
                                      ],
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                            ),
                                            backgroundColor: Colors.white.withOpacity(0.9),
                                            context: context,
                                            builder: (BuildContext context){
                                              return giftComponent(friendIdx);
                                            }
                                        );
                                      },
                                      child: Icon(Icons.card_giftcard_rounded, size: 32),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 120,
                  height: 220,
                  child: Image.asset(friendsModel[friendIdx].addr, fit: BoxFit.cover,),
                ),
              ],
            ),

          ),
        ],
      ),
    );
  }

  Widget calComponent(int friendIdx){
    return Container(
      height: 380,
      width: double.infinity,
      child: Container(
        //padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: BoxDecoration(
          //color: Colors.white.withOpacity(0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*Text(
                friendsModel[friendIdx].name+"'s Exercise Calendar",
                style: GoogleFonts.comicNeue(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                )
            ),
            const SizedBox(height: 10),*/
            Container(
              height: 380,
              width: 390,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(friendsModel[friendIdx].calImg, fit: BoxFit.fill,),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget giftComponent(int friendIdx){
    return Container(
      height: 260,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.yellowAccent.shade100.withOpacity(0.3),
            Colors.white.withOpacity(0.8),
          ], begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Container(
        //padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: BoxDecoration(
          //color: Colors.white.withOpacity(0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 18, top: 15),
                  child: Text(
                      "Gift for "+friendsModel[friendIdx].name,
                      style: GoogleFonts.comicNeue(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      )
                  ),
                ),
                const SizedBox(width: 60),
                Container(
                  padding: EdgeInsets.only(left: 18, top: 15),
                  child: Row(
                    children: [
                      Text(
                          "Coins",
                          style: GoogleFonts.comicNeue(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          )
                      ),
                      Icon(Icons.monetization_on, size: 28, color: Colors.yellow.shade700),
                      Text(
                          ": "+ coin.toString(),
                          style: GoogleFonts.comicNeue(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          )
                      ),
                    ],
                  )
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(top: 15, left: 20),
              child: Row(
                children: [
                  indiGift(0),
                  const SizedBox(width: 20,),
                  indiGift(1),
                  const SizedBox(width: 20,),
                  indiGift(2),
                  const SizedBox(width: 20,),
                  indiGift(0),
                  const SizedBox(width: 20,),
                  indiGift(1),
                  const SizedBox(width: 20,),
                  indiGift(2),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 50,
              decoration: BoxDecoration(
                //border: Border.all(color: Colors.black12, width: 2),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 30,),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      "Amount: ",
                      style: GoogleFonts.comicNeue(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 0,),
                  Container(
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.black12, width: 2),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      iconSize: 25,
                      onPressed: () {
                        setState(() {
                          if (num >= 1) num--;
                          print("The coin count is updated to: $num");
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      num.toString(),
                      style: GoogleFonts.comicNeue(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 0,),
                  Container(
                    //padding: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.black12, width: 2),
                    ),
                    height: 28,
                    width: 28,
                    child: IconButton(
                      icon: Icon(Icons.add_circle_outline),
                      iconSize: 25,
                      //alignment: Alignment.topLeft,
                      onPressed: () {
                        setState(() {
                          num++;
                          print("The coin count is updated to: $num");
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 80,),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        int coin_consumed = giftsModel[selGiftIdx].coins * num;
                        coin -= coin_consumed;
                        print("The coin_consumed is $coin_consumed, and current coin is $coin");
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        //border: Border.all(color: Colors.black12, width: 2),
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.blueGrey,
                      ),
                      child: Text(
                        "Present",
                        style: GoogleFonts.comicNeue(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget indiGift(int giftIdx){
    return GestureDetector(
      onTap: () {
        setState(() {
          selGiftIdx = giftIdx;
          print("The current gift selected index is: $selGiftIdx");
          print("The current gift selected index is: "+ giftIdx.toString());
        });
      },
      child: Container(
        height: 130,
        width: 110,
        decoration: BoxDecoration(
          //border: Border.all(color: Colors.black26, width: 0.5),
          color: selGiftIdx == giftIdx ? Colors.grey.withOpacity(0.35) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            const SizedBox(height: 5,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              child: Image.asset(giftsModel[giftIdx].image, fit: BoxFit.fill,),
            ),
            const SizedBox(height: 5),
            Text(
                giftsModel[giftIdx].name,
                style: GoogleFonts.comicNeue(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                )
            ),
            //const SizedBox(height: 5),
            Row(
              children: [
                const SizedBox(width: 35),
                Icon(Icons.monetization_on, size: 28, color: Colors.yellow.shade700),
                const SizedBox(width: 5),
                Text(
                    giftsModel[giftIdx].coins.toString(),
                    style: GoogleFonts.comicNeue(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}