import 'package:flutter/material.dart';

class TasksModel {
  String img;
  String exercise;
  String time;
  int coins;

  TasksModel({
    required this.img,
    required this.exercise,
    required this.time,
    required this.coins,
  });

  static List <TasksModel> getAllTasks(){
    List <TasksModel> tasksModel = [];

    tasksModel.add(
        TasksModel(
          img: 'assets/images/today/arm.png',
          exercise: 'Arm',
          time: '10mins',
          coins: 5,
        )
    );

    tasksModel.add(
        TasksModel(
          img: 'assets/images/today/abm.png',
          exercise: 'AB Muscle',
          time: '10mins',
          coins: 5,
        )
    );

    tasksModel.add(
        TasksModel(
          img: 'assets/images/today/fullbody.png',
          exercise: 'Full Body',
          time: '20mins',
          coins: 20,
        )
    );

    tasksModel.add(
        TasksModel(
          img: 'assets/images/today/vegetable.png',
          exercise: 'Vegetables',
          time: '200g',
          coins: 5,
        )
    );

    tasksModel.add(
        TasksModel(
          img: 'assets/images/today/chicken.png',
          exercise: 'Protein',
          time: '200g',
          coins: 10,
        )
    );

    tasksModel.add(
        TasksModel(
          img: 'assets/images/today/carbohydrates.png',
          exercise: 'Carbohydrates',
          time: '400g',
          coins: 5,
        )
    );

    return tasksModel;
  }
}

