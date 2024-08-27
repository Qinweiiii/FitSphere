import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:swe2109537_swe311_assm1/login_page.dart';
import 'package:swe2109537_swe311_assm1/db_users.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  bool _hasFocus1 = false;
  bool _hasFocus2 = false;
  bool _hasFocus3 = false;

  List<Map<String, dynamic>> _users = [];
  // TextEditingController可以控制和监听TextField里面的内容
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    focusNode1.addListener(() {
      if (_hasFocus1 != focusNode1.hasFocus) {
        setState(() {
          _hasFocus1 = focusNode1.hasFocus;
        });
      }
    });

    focusNode2.addListener(() {
      if (_hasFocus2 != focusNode2.hasFocus) {
        setState(() {
          _hasFocus2 = focusNode2.hasFocus;
        });
      }
    });

    focusNode3.addListener(() {
      if (_hasFocus3 != focusNode3.hasFocus) {
        setState(() {
          _hasFocus3 = focusNode3.hasFocus;
        });
      }
    });
  }

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
        body: SingleChildScrollView(
          child: Container(
            alignment: const Alignment(0.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Image.asset('assets/images/Fit.gif'),
                ),
                Text(
                  "Sign Up to Start",
                  style: GoogleFonts.lato(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 3.0,
                        color: Colors.black,
                        offset: Offset(1, 1),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40.0),
                  height: 60,
                  child: TextField(
                    controller: _emailController,
                    focusNode: focusNode1,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: _hasFocus1 ? Colors.deepPurple : Colors.white,
                        fontSize: 16,
                      ),
                      hintText: "Please enter your email",
                      hintStyle: TextStyle(
                        color: Colors.black12,
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: _hasFocus1 ? Colors.deepPurple : Colors.white,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _hasFocus1 ? Colors.deepPurple : Colors.white,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40.0),
                  height: 60,
                  child: TextField(
                    controller: _unameController,
                    focusNode: focusNode2,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: "Username",
                      labelStyle: TextStyle(
                        color: _hasFocus2 ? Colors.deepPurple : Colors.white,
                        fontSize: 16,
                      ),
                      hintText: "Please enter your username",
                      hintStyle: TextStyle(
                        color: Colors.black12,
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(
                        Icons.people,
                        color: _hasFocus2 ? Colors.deepPurple : Colors.white,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _hasFocus2 ? Colors.deepPurple : Colors.white,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40.0),
                  height: 60,
                  child: TextField(
                    controller: _passwordController,
                    focusNode: focusNode3,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: _hasFocus3 ? Colors.deepPurple : Colors.white,
                        fontSize: 16,
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: _hasFocus3 ? Colors.deepPurple : Colors.white,
                      ),
                      border: InputBorder.none,
                    ),
                    obscureText: true,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _hasFocus3 ? Colors.deepPurple : Colors.white,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                const SizedBox(height: 15,),
                Container(
                  width: 130,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){
                      _addItem();
                    },
                    child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 20
                        )
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return LoginPage();
                    }));
                  },
                  child: Container(
                    child: RichText(
                      text: TextSpan( // TextSpan: 用于定义每个文本样式
                        children: [
                          TextSpan(
                            text: 'Already have an account?',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: '  ',
                          ),
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _refreshUsers() async {
    final data = await DatabaseUsers.getItems();
    setState(() {
      _users = data;
    });
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _addItem() async {
    try {
      if (_emailController.text.isEmpty || _unameController.text.isEmpty || _passwordController.text.isEmpty) {
        _showSnackBar('Email, Username and Password cannot be empty');
        return;
      }

      final username = _unameController.text.trim();
      final password = _passwordController.text.trim();

      final db = await DatabaseUsers.db();
      debugPrint('Database opened successfully');

      final user = await db.query(
        'items',
        where: 'uname = ?',
        whereArgs: [username],
      );

      if (user.isNotEmpty) {
        _showSnackBar("Username is already registered, please sign in.");
        return;
      } else {
        await DatabaseUsers.createItem(_unameController.text, _emailController.text, _passwordController.text);
        debugPrint('User added successfully');
        _refreshUsers(); // Refresh the user list after adding a new user
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return LoginPage();
        }));
      }
    } catch (e) {
      debugPrint('Error in _addItem: $e');
      _showSnackBar('An error occurred. Please try again. Error is $e');
    }
  }


  Future<void> _clearAllUsers() async {
    await DatabaseUsers.deleteAllItems();
    _showSnackBar('All data in the database is cleared.');
    _refreshUsers(); // Refresh the user list after clearing all users
  }

  Widget _buildUserList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _users.length,
      itemBuilder: (context, index) => Card(
          color: Color(0xFFFEFFE2),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: ListTile(
            title: Text(
                _users[index]['uname'],
                style: GoogleFonts.comicNeue(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                )
            ),
            subtitle: Text(
                _users[index]['password'],
                style: GoogleFonts.comicNeue(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )
            ),
          ),
      ),
    );
  }
}
