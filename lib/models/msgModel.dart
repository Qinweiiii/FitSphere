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
    'You can try to use key, but not sure whether will work',
    false,
    true,
  ),
  Message(
    currentUser,
    '22:02',
    'But my page needs them! Or the functionality cannot realize!',
    false,
    true,
  ),
  Message(
    edward,
    '22:00',
    'Maybe because you pile too many drawers in one page.',
    false,
    true,
  ),
  Message(
    currentUser,
    '21:59',
    'I use setState() to change the state, actually the variable value already changed inside the system, but the UI remains same!',
    false,
    true,
  ),
  Message(
    currentUser,
    '21:58',
    "It's so weird!",
    false,
    true,
  ),
  Message(
    currentUser,
    '21:57',
    'Do you know how to force the flutter to refresh the UI?',
    false,
    true,
  ),
];
