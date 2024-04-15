import 'package:gem_app2/feature/customer/workout/model/workout_model.dart';

List<WorkOutModel> fakeWorkOuts = <WorkOutModel>[
  WorkOutModel(
    title: 'Biceps & Forearms Blast',
    url: "https://www.youtube.com/watch?v=s1x4qcoGE94",
    workOutList: <WorkOutListItem>[
      WorkOutListItem(
        name: 'Barbell Curl',
        startTime: '0:00',
        endTime: '0:32',
      ),
      WorkOutListItem(
        name: 'Dumbbell Incline Curl',
        startTime: '00:32',
        endTime: '1:00',
      ),
      WorkOutListItem(
        name: 'Preacher Curl Db',
        startTime: '1:00',
        endTime: '1:28',
      ),
      WorkOutListItem(
        name: "Hammer Curl Db",
        startTime: '1:28',
        endTime: '1:57',
      ),
      WorkOutListItem(
        name: 'Concentration Curl Db',
        startTime: "1:57",
        endTime: '2:25',
      ),
      WorkOutListItem(
        name: 'Seated Wrist Curl',
        startTime: "2:25",
        endTime: '2:53',
      ),
      WorkOutListItem(
        name: 'Reverse Wrist Curl Db ',
        startTime: "2:53",
        endTime: '3:21',
      ),
    ],
  ),
];
