import 'package:swe2109537_swe311_assm1/models/userModel.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  bool isLiked;
  final bool unread;

  Message(this.sender, this.time, this.text, this.isLiked, this.unread);
}

// CURRENT USER
final User currentUser = User(0, "Current User", 'assets/images/zzangHao.png');

// USERS
final User zhanghao = User(1, "zhanghao", 'assets/images/zzangHao.png');
final User edward = User(2, "edward", 'assets/images/friend/friend_1.png');
final User yuqi = User(3, "yuqi", 'assets/images/friend/friend_2.png');
final User daniel = User(4, "daniel", 'assets/images/friend/friend_3.png');
final User nahyeon = User(5, "nahyeon", 'assets/images/friend/friend_5.png');

// FAVORITE CONTACTS
List<User> favorites = [zhanghao, edward, yuqi, daniel, nahyeon];

// EXAMPLE MESSAGES IN CHAT SCREEN BETWEEN ZHANGHAO AND EDWARD
List<Message> messages = [
  Message(
    edward,
    '22:04',
    '但是我有点东西要忙先咧',
    false,
    true,
  ),
  Message(
    currentUser,
    '22:02',
    '你最好不是又翘掉cloud了！',
    false,
    true,
  ),
  Message(
    edward,
    '22:00',
    '应该在',
    false,
    true,
  ),
  Message(
    currentUser,
    '21:59',
    '很奇怪嘞 我的gestureDetector里的setState改variable的值 每次改完我print到log里 确实是有改的 可是UI上就是不会更新！',
    false,
    true,
  ),
  Message(
    currentUser,
    '21:58',
    '我需要你！',
    false,
    true,
  ),
  Message(
    currentUser,
    '21:57',
    '你明天中间那几个小时是不是也在图书馆！',
    false,
    true,
  ),
];