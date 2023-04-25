import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailControll = TextEditingController();
  final _passwordControll = TextEditingController();
  final _confirmpwControll = TextEditingController();
  final _nameControll = TextEditingController();
  final _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  bool _isEmailValid = true;
  bool _signUpPass = false;

  Future signUp() async {
    if (!_emailRegex.hasMatch(_emailControll.text.trim())) {
      setState(() {
        _isEmailValid = false;
      });
      return;
    }

    if (passwordConfirmed()) {
      // create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailControll.text.trim(),
        password: _passwordControll.text.trim(),
      );
      // add user details
      addUserDetails(_nameControll.text.trim(), _emailControll.text.trim());
      _signUpPass = true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Password and Confirm Password do not match, please try again'),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future addUserDetails(String name, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'email': email,
    });
  }

  bool passwordConfirmed() {
    if (_passwordControll.text.trim() == _confirmpwControll.text.trim()) {
      return true;
    } else {
      return false;
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
              mainAxisAlignment: MainAxisAlignment.center,
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
                    "Register",
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
                const SizedBox(height: 20),

                // --> comfirm password part <--
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _confirmpwControll,
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
                      hintText: "Confirm Password",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // --> name part <--
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _nameControll,
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
                      hintText: "Display Name",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(height: 50),

                // --> sign up button <--
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      String email = _emailControll.text.trim();
                      String password = _passwordControll.text.trim();
                      String cfpassword = _confirmpwControll.text.trim();
                      if (password.isEmpty ||
                          email.isEmpty ||
                          cfpassword.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: const Text(
                                  'Please input your information completely before sign up'),
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
                        signUp();
                        if(_signUpPass){
                          Navigator.pushNamed(context, '/login');
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
                          "Sign Up",
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

                // --> login button <--
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/login'),
                      child: const Text(
                        " Login",
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
