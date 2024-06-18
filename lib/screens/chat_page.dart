import 'package:flutter/material.dart';
import 'package:swe2109537_swe311_assm1/models/msgModel.dart';
import 'package:swe2109537_swe311_assm1/screens/friend_page.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {

  const ChatPage({super.key});

  @override
  ChatPageState createState() => new ChatPageState();

}

class ChatPageState extends State<ChatPage>{

  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      margin: isMe
        ? EdgeInsets.only(top: 15, bottom: 15, left: 100)
        : EdgeInsets.only(top: 15, bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: isMe ? Color(0xC988B8).withOpacity(0.55) : Color(0xFFA19FDD).withOpacity(0.55),
        borderRadius: isMe
          ? BorderRadius.only(topLeft: Radius.circular(25), bottomLeft: Radius.circular(25))
          : BorderRadius.only(topRight: Radius.circular(25), bottomRight: Radius.circular(25))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              message.time,
              style: GoogleFonts.comicNeue(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              )
          ),
          const SizedBox(height: 5),
          Text(
              message.text,
              style: GoogleFonts.comicNeue(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: [
        msg,
        IconButton(
          icon: message.isLiked
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),
          iconSize: 30.0,
          color: message.isLiked
            ? Colors.deepPurple
            : Colors.blueGrey,
          onPressed: () {
            setState(() {
              if (message.isLiked == true) message.isLiked = false;
              else message.isLiked = true;
            });
          },
        )
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(hintText: "Send a message..."),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFE8CBC0),
        centerTitle: false,
        title: Text(
            "Ng Ju Peng",
            style: GoogleFonts.breeSerif(
              fontSize: 20,
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
        elevation: 20.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
            Color(0xFFE8CBC0).withOpacity(0.85),
            Color(0xFF636FA4).withOpacity(0.85),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
        ),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0)
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                    ),
                    child: ListView.builder(
                      reverse: true,
                      padding: EdgeInsets.only(top: 15),
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index){
                        final Message message = messages[index];
                        bool isMe = message.sender.id == currentUser.id;
                        return _buildMessage(message, isMe);
                      },
                    ),
                  ),
                ),
              ),
              _buildMessageComposer()
            ],
          ),
        ),
      ),
    );
  }

}