import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indexed/indexed.dart';
import 'package:swe2109537_swe311_assm1/models/tasksModel.dart';

class TodayPage extends StatefulWidget{
  const TodayPage({super.key});

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage>{
  int colIndex = 0;
  int coins = 15;
  List<bool> checkList = List.filled(6, false, growable: false);
  //bool _checkboxSelected = false;

  List<TasksModel> tasksModel = [];
  @override
  void initState() {
    super.initState();
    _getInitialInfo();
  }
  void _getInitialInfo(){
    setState(() {
      tasksModel = TasksModel.getAllTasks();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 360,
                height: 210,
                decoration: BoxDecoration(
                  //border: Border.all(color: Colors.black, width: 0.5),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 5),
                    Container(
                      width: 160,
                      height: 170,
                      decoration: BoxDecoration(
                        //border: Border.all(color: Colors.black, width: 0.5),
                      ),
                      child: Image.asset('assets/images/zzangHao.png', fit: BoxFit.cover,),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        //border: Border.all(color: Colors.black, width: 0.5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 7),
                          Text(
                              'Zhang Hao',
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
                          const SizedBox(height: 8),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                            child: Table(
                              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                              columnWidths: {
                                0: FlexColumnWidth(1.3),
                                1: FlexColumnWidth(1),
                              },
                              children: [
                                TableRow(
                                    children: [
                                      Container(
                                        child: Text(
                                            "Height",
                                            style: GoogleFonts.comicNeue(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.black,
                                            )
                                        ),
                                        height: 25,
                                      ),
                                      Container(
                                        child: Text(
                                            '180cm',
                                            style: GoogleFonts.comicNeue(
                                              fontSize: 16,
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
                                            "Weight",
                                            style: GoogleFonts.comicNeue(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.black,
                                            )
                                        ),
                                        height: 25,
                                      ),
                                      Container(
                                        child: Text(
                                            '60kg',
                                            style: GoogleFonts.comicNeue(
                                              fontSize: 16,
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
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.black,
                                            )
                                        ),
                                        height: 25,
                                      ),
                                      Container(
                                        child: Text(
                                            '18bpm',
                                            style: GoogleFonts.comicNeue(
                                              fontSize: 16,
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
                          const SizedBox(height: 8),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(width: 5),
                                Icon(Icons.monetization_on_outlined, ),
                                const SizedBox(width: 5),
                                Text(
                                    '$coins coins',
                                    style: GoogleFonts.comicNeue(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                    )
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
              const SizedBox(height: 5),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  //border: Border.all(color: Colors.black, width: 0.5)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 30),
                    buildContainer('EXERCISE', 50, 0),
                    const SizedBox(width: 20),
                    buildContainer('DIETS', 40, 1),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              buildFrames(
                  tasksModel[colIndex*3].img,
                  tasksModel[colIndex*3].exercise,
                  tasksModel[colIndex*3].time,
                  tasksModel[colIndex*3].coins,
                  colIndex*3,
              ),
              const SizedBox(height: 18),
              buildFrames(
                tasksModel[colIndex*3+1].img,
                tasksModel[colIndex*3+1].exercise,
                tasksModel[colIndex*3+1].time,
                tasksModel[colIndex*3+1].coins,
                colIndex*3+1,
              ),
              const SizedBox(height: 18),
              buildFrames(
                tasksModel[colIndex*3+2].img,
                tasksModel[colIndex*3+2].exercise,
                tasksModel[colIndex*3+2].time,
                tasksModel[colIndex*3+2].coins,
                colIndex*3+2,
              ),
            ],
          ),
        ),
    );
  }

  Widget buildContainer(String text, double width, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          colIndex = index;
        });
      },
      child: Container(
        width: 130,
        decoration: BoxDecoration(
          //border: Border.all(color: Colors.black, width: 0.5),
        ),
        child: Column(
          children: [
            Container(
              child: Text(
                text,
                style: GoogleFonts.comicNeue(
                  fontSize: 18,
                  fontWeight: colIndex == index ? FontWeight.w700 : FontWeight.w600,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: colIndex == index ? 3.0 : 0,
                      color: Colors.black,
                      offset: colIndex == index ? Offset(1, 1) : Offset(0, 0),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              width: width,
              height: colIndex == index ? 3 : 0,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFrames(String img, String exercise, String time, int coin, int idx) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      height: 90,
      width: 320,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 10),
          Container(
            width: 60,
            decoration: BoxDecoration(
              //border: Border.all(color: Colors.black, width: 0.5),
            ),
            child: Image.asset(img, fit: BoxFit.cover),
          ),
          const SizedBox(width: 15),
          Container(
            width: 175,
            decoration: BoxDecoration(
              //border: Border.all(color: Colors.black, width: 0.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.black, width: 0.5),
                  ),
                  child: Text(
                      exercise,
                      style: GoogleFonts.comicNeue(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
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
                ),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.black, width: 0.5),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                          //border: Border.all(color: Colors.black, width: 0.5),
                        ),
                        child: Text(
                            time,
                            style: GoogleFonts.comicNeue(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.7),
                            )
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                          //border: Border.all(color: Colors.black, width: 0.5),
                        ),
                        child: Text(
                            '$coin coins',
                            style: GoogleFonts.comicNeue(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.7),
                            )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 5),
          Container(
              width: 50,
              decoration: BoxDecoration(
                //border: Border.all(color: Colors.black, width: 0.5),
              ),
              child: Transform.scale(
                scale: 1.5,
                child: Checkbox(
                  value: checkList[idx],
                  activeColor: Colors.deepPurple.withOpacity(0.8), //选中时的颜色
                  onChanged:(value){
                    setState(() {
                      checkList[idx]=value!;
                      if (checkList[idx] == true) coins += tasksModel[idx].coins;
                      else coins -= tasksModel[idx].coins;
                    });
                  },
                ),
              )
          ),
        ],
      ),
    );
  }
}