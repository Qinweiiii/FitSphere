import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:swe2109537_swe311_assm1/models/exerciseVideo.dart';
import 'package:flutter/services.dart';

class SportPage extends StatefulWidget{
  const SportPage({super.key});

  @override
  State<SportPage> createState() => _SportPageState();
}

class _SportPageState extends State<SportPage>{
  int selectedIndex = 1;

  List<ExerciseVideo> exerciseVideos = [];
  @override
  void initState() {
    super.initState();
    _getInitialInfo();
    //SystemChrome.setEnabledSystemUIOverlays([]);
  }
  void _getInitialInfo(){
    setState(() {
      exerciseVideos = ExerciseVideo.getAllExerciseVideos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
            padding: EdgeInsets.only(left: 27, right: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(
                    "Good morning, Haohao",
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
                const SizedBox(height: 20),
                Text(
                    "Popular HIIT Video For You",
                    style: GoogleFonts.comicNeue(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.black,
                            offset: Offset(1.5, 1.5),
                          )
                        ],
                    )
                ),
                const SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 10),
                  width: 345,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
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
                    onTap: () => _launchURL('https://www.youtube.com/watch?v=LcxzO9FSLfQ'),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('assets/images/sport/pamela_endorphins.jpg', fit: BoxFit.cover,),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                    "Exercises Paths For You",
                    style: GoogleFonts.comicNeue(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 2.0,
                            color: Colors.black.withOpacity(0.8),
                            offset: Offset(1.3, 1.3),
                          )
                        ],
                    )
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildContainer("Recommendation", 130, 0),
                      const SizedBox(width: 10),
                      buildContainer("Full Body", 78, 1),
                      const SizedBox(width: 10),
                      buildContainer("Leg", 40, 2),
                      const SizedBox(width: 10),
                      buildContainer("AB Muscle", 85, 3),
                      const SizedBox(width: 10),
                      buildContainer("Stretch", 60, 4),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 10),
                  width: 330,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
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
                    onTap: () => _launchURL(exerciseVideos[selectedIndex*2].link),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(exerciseVideos[selectedIndex*2].addr, fit: BoxFit.cover,),
                    ),
                  ),

                ),
                const SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 10),
                  width: 345,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
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
                    onTap: () => _launchURL(exerciseVideos[selectedIndex*2+1].link),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(exerciseVideos[selectedIndex*2+1].addr, fit: BoxFit.cover,),
                    ),
                  ),
                ),
              ],
            )
        )
    );
  }

  Widget buildContainer(String text, double width, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          print("The current seleted index is: " + selectedIndex.toString());
          print("The current length is: " + exerciseVideos.length.toString());
          print("The first image is at index: " + exerciseVideos[selectedIndex*2].addr);
          print("The second image is at index: " + exerciseVideos[selectedIndex*2 + 1].addr);
        });
      },
      child: Container(
        width: width,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.white, width: selectedIndex == index ? 2.0 : 0.8),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.comicNeue(
              fontSize: 15,
              fontWeight: selectedIndex == index ? FontWeight.w900 : FontWeight
                  .w400,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _launchURL(String _url) async {
    final Uri url = Uri.parse(_url);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

}