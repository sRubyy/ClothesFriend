import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailControll = TextEditingController();
  final _passwordControll = TextEditingController();
  final _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  bool _isEmailValid = true;
  bool _signInPass = false;

  Future<void> signIn() async {
    if (!_emailRegex.hasMatch(_emailControll.text.trim())) {
      setState(() {
        _isEmailValid = false;
      });
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailControll.text.trim(),
        password: _passwordControll.text.trim(),
      );
      _signInPass = true;
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Login Failed';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found with this email';
      } else {
        errorMessage = 'Login failed, please check your password';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage, style: const TextStyle(fontSize: 14.0)),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 158, 97),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.width * 0.5,
                      child: Image.asset(
                        'assets/images/logo2.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                // --> login text <--
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // --> body text <--
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    "Join to find the experience with clothesfriend",
                    style: TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                // --> email part <--
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailControll,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Email",
                      fillColor: Colors.grey[200],
                      filled: true,
                      errorText: _isEmailValid
                          ? null
                          : 'Please enter a valid email format',
                      errorStyle: const TextStyle(
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 240, 33, 33),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // --> password part <--
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _passwordControll,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Password",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                // --> sign in button <--
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      String email = _emailControll.text.trim();
                      String password = _passwordControll.text.trim();
                      if (password.isEmpty && email.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: const Text(
                                  'Please enter your email and password'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else if (email.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: const Text('Please enter your email'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else if (password.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: const Text('Please enter your password'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        signIn();
                        if(_signInPass){
                          Navigator.pushNamed(context, '/home');
                        }
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // --> register button <--
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/regis'),
                      child: const Text(
                        " Register",
                        style: TextStyle(
                          color: Color.fromARGB(255, 11, 131, 223),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
