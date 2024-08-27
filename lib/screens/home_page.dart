import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swe2109537_swe311_assm1/login_page.dart';
import 'package:swe2109537_swe311_assm1/screens/mood_page.dart';
import 'package:swe2109537_swe311_assm1/screens/friend_page.dart';
import 'package:swe2109537_swe311_assm1/screens/today_page.dart';
import 'package:swe2109537_swe311_assm1/screens/sport_page.dart';
import 'package:swe2109537_swe311_assm1/screens/chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Index variable and list variable to store the screens
  int myCurrentIndex = 0;
  // list里面要有page index才不会invalid
  List pages = const [
    SportPage(),
    TodayPage(),
    FriendPage(),
    MoodPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFFE8CBC0),
          Color(0xFF636FA4),
        ], begin: Alignment.topCenter,
          end: Alignment.bottomCenter)
      ),
      child: Scaffold(
        // The app name at the top of the page
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          centerTitle: false,
          title: RichText( // RichText: 用于组合多个文本样式
            text: TextSpan( // TextSpan: 用于定义每个文本样式
              children: [
                TextSpan(
                  text: '   Fit',
                  style: TextStyle(
                      fontFamily: 'serif',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(1.0, 1.0),
                        )
                      ],
                  ),
                ),
                TextSpan(
                  text: 'Sphere',
                  style: GoogleFonts.oleoScript(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(1.0, 1.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          // 创建一个对称的边距：左右外边距20像素，上下外边距也各20像素
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 25, // 阴影的模糊半径，值越大阴影越模糊、越扩散
                    offset: const Offset(5, 10) // 阴影的位置偏移量：向右偏移8像素，向下偏移20像素
                )
              ]
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BottomNavigationBar(
                //backgroundColor: Color(0xFFEBD1F9).withOpacity(0.75),
                // icon被选的时候是橙的
                selectedItemColor: Color(0xFFA035B4),
                // icon没被选的时候是黑色的
                unselectedItemColor: Colors.black,
                // 记录当前页面的index
                currentIndex: myCurrentIndex,
                // 当用户点击不同的导航栏按钮时，通过更新'myCurrentIndex'来改变当前显示的页面或内容
                onTap: (index) {
                  setState(() {
                    myCurrentIndex = index;
                  });
                },
                items: const [
                  // bar里面要放的icon图案
                  BottomNavigationBarItem(icon: Icon(Icons.sports_cricket), label: "Sport"),
                  BottomNavigationBarItem(icon: Icon(Icons.task_rounded),label: "Today"),
                  BottomNavigationBarItem(icon: Icon(Icons.people_alt), label: "Friend"),
                  BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Mood"),
                ],
              //fixedColor: Colors.white,
            ),
          ),
        ),
        body: pages[myCurrentIndex],
      ),
    );
  }
}