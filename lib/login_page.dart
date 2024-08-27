import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:swe2109537_swe311_assm1/db_users.dart';
import 'package:swe2109537_swe311_assm1/register_page.dart';
import 'package:swe2109537_swe311_assm1/screens/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<Map<String, dynamic>> _users = [];
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  bool _hasFocus1 = false;
  bool _hasFocus2 = false;

  @override
  void initState() {
    super.initState();
    _refreshUsers();
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFE8CBC0),
            Color(0xFF636FA4),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            alignment: const Alignment(0.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 35),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Image.asset('assets/images/Fit.gif'),
                ),
                const SizedBox(height: 5),
                Text(
                  "WELCOME",
                  style: GoogleFonts.lato(
                    fontSize: 36,
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
                Text(
                  "Sign in to continue",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40.0),
                  height: 60,
                  child: TextField(
                    controller: _unameController,
                    focusNode: focusNode1,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: "Username",
                      labelStyle: TextStyle(
                        color: _hasFocus1 ? Colors.deepPurple : Colors.white,
                        fontSize: 16,
                      ),
                      hintText: "Please enter your username",
                      hintStyle: TextStyle(
                        color: Colors.black12,
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(
                        Icons.people,
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
                const SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40.0),
                  height: 60,
                  child: TextField(
                    controller: _passwordController,
                    focusNode: focusNode2,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: _hasFocus2 ? Colors.deepPurple : Colors.white,
                        fontSize: 16,
                      ),
                      hintText: "Please enter your password",
                      hintStyle: TextStyle(
                        color: Colors.black12,
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: _hasFocus2 ? Colors.deepPurple : Colors.white,
                      ),
                      border: InputBorder.none,
                    ),
                    obscureText: true,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _hasFocus2 ? Colors.deepPurple : Colors.white,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: 130,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){
                      _login();
                    },
                    child: const Text('Login',
                        style: TextStyle(fontSize: 20)),
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return RegisterPage();
                    }));
                  },
                  child: Container(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Have no account?',
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
                            text: 'Sign Up',
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
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> _refreshUsers() async {
    final data = await DatabaseUsers.getItems();
    setState(() {
      _users = data;
    });
  }

  Future<void> _login() async {
    final username = _unameController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      _showSnackBar("Neither Username nor Password can be empty.");
      return;
    }

    final db = await DatabaseUsers.db();
    final user = await db.query(
      'items',
      where: 'uname = ?',
      whereArgs: [username],
    );

    if (user.isEmpty) {
      _showSnackBar("Username doesn't exist, please sign up first.");
      return;
    } else {
      final storedPassword = user[0]['password'];
      if (password != storedPassword) {
        _showSnackBar("Invalid username or password");
        return;
      } else {
        // Successful login logic here
        _showSnackBar("Login successful");
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return HomePage();
        }));
      }
    }
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
            ),
          ),
          subtitle: Text(
            _users[index]['password'],
            style: GoogleFonts.comicNeue(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

}
