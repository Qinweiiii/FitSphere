import 'package:flutter/material.dart';

class ExerciseVideo {
  String addr;
  String link;
  String videoId;
  ExerciseVideo({
    required this.addr,
    required this.link,
    required this.videoId,
  });

  static List <ExerciseVideo> getAllExerciseVideos(){
    List <ExerciseVideo> exerciseVideos = [];

    // The first video under "Recommendation" option
    exerciseVideos.add(
        ExerciseVideo(
            addr: 'assets/images/sport/recommend_0.png',
            link: 'https://www.youtube.com/watch?v=CN5ZRPEgis4',
            videoId: 'CN5ZRPEgis4',
        )
    );

    // The second video under "Recommendation" option
    exerciseVideos.add(
        ExerciseVideo(
          addr: 'assets/images/sport/recommend_1.jpeg',
          link: 'https://www.youtube.com/watch?v=9g4z0gFlfpA',
          videoId: '9g4z0gFlfpA',
        )
    );

    // The first video under "Full Body" option
    exerciseVideos.add(
        ExerciseVideo(
          addr: 'assets/images/sport/fullbody_0.jpg',
          link: 'https://www.youtube.com/watch?v=6VFLKdfxA24',
          videoId: '6VFLKdfxA24',
        )
    );

    // The second video under "Full Body" option
    exerciseVideos.add(
        ExerciseVideo(
          addr: 'assets/images/sport/fullbody_1.jpg',
          link: 'https://www.youtube.com/watch?v=w8TFdU85OEc',
          videoId: 'w8TFdU85OEc',
        )
    );

    // The first video under "Leg" option
    exerciseVideos.add(
        ExerciseVideo(
          addr: 'assets/images/sport/leg_0.jpg',
          link: 'https://www.youtube.com/watch?v=CudryT2Kokg',
          videoId: 'CudryT2Kokg',
        )
    );

    // The second video under "Leg" option
    exerciseVideos.add(
        ExerciseVideo(
          addr: 'assets/images/sport/leg_1.jpg',
          link: 'https://www.youtube.com/watch?v=X-glH8lPA7Q',
          videoId: 'X-glH8lPA7Q',
        )
    );

    // The first video under "AB Muscle" option
    exerciseVideos.add(
        ExerciseVideo(
          addr: 'assets/images/sport/ab_0.jpg',
          link: 'https://www.youtube.com/watch?v=9oMZp0IUbpo',
          videoId: '9oMZp0IUbpo',
        )
    );

    // The second video under "AB Muscle" option
    exerciseVideos.add(
        ExerciseVideo(
          addr: 'assets/images/sport/ab_1.jpg',
          link: 'https://www.youtube.com/watch?v=2pLT-olgUJs',
          videoId: '2pLT-olgUJs',
        )
    );

    // The first video under "Stretch" option
    exerciseVideos.add(
        ExerciseVideo(
          addr: 'assets/images/sport/stretch_0.jpg',
          link: 'https://www.youtube.com/watch?v=YZxjP14kUBc',
          videoId: 'YZxjP14kUBc',
        )
    );

    // The second video under "Stretch" option
    exerciseVideos.add(
        ExerciseVideo(
          addr: 'assets/images/sport/stretch_1.jpg',
          link: 'https://www.youtube.com/watch?v=L_xrDAtykMI',
          videoId: 'L_xrDAtykMI',
        )
    );

    return exerciseVideos;
  }
}

