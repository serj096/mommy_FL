import 'package:flutter/material.dart';
import 'package:mommy/pages//authentication.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

import 'home.dart';
final auth = Authentication();
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'SanFrancisco',
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
        body: LoginScreen(),
        bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Company name, Inc",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            )),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  bool _isVisible = false;

  final TapGestureRecognizer _gestureRecognizer = TapGestureRecognizer()
    ..onTap = () {
      if (kDebugMode) {
        print("Hello world from _gestureRecognizer");
      }
    };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        reverse: true,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 60,
              width: 200,
            ),

            // Login text Widget
            Center(
              child: Container(
                height: 200,
                width: 400,
                alignment: Alignment.center,
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                  // textAlign: TextAlign.center,
                ),
              ),
            ),

            SizedBox(
              height: 60,
              width: 10,
            ),

            // Wrong Password text
            Visibility(
              visible: _isVisible,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(10),
                child: Text(
                  "Wrong credentials entered",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 10,
                  ),
                ),
              ),
            ),

            // Textfields for username and password fields
            Container(
              height: 70,
              width: 530,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onTap: () {
                      setState(() {
                        _isVisible = false;
                      });
                    },
                    controller: usernameController, // Controller for Username
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Telephone number",
                        contentPadding: EdgeInsets.all(20)),
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  ),

                ],
              ),
            ),

            // Submit Button
            Container(
              width: 570,
              height: 70,
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  child: Text("Submit", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    if (auth.fetchCredentials(
                        usernameController.text, passwordController.text)) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                            (Route<dynamic> route) => false,
                      );
                    } else {
                      setState(() {
                        _isVisible = true;
                      });
                    }
                  }),
            ),

            // Register
            Container(
                padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Dont have an account? ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(
                              text: " Register here",
                              style: TextStyle(
                                  color: Colors.blue, fontWeight: FontWeight.bold),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignupPage()),
                                  )
                                }),
                        ],
                      ),
                    ))),
            Padding(padding: EdgeInsets.all(10)),
            Container(
              color: Colors.white,
                child: TextFormField(

                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Kod",
                    contentPadding: EdgeInsets.all(20),

                  ),)
            ),
          ],
        ));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Home();
     /* Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                  height: 400,
                  width: 200,
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: Text(
                    "Successfull login!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
            ),
            Container(
              height: 100,
              width: 570,
              padding: EdgeInsets.all(20),
              child: RaisedButton(
                  color: Colors.pink,
                  child: Text("Logout", style: TextStyle(color: Colors.white)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                          (Route<dynamic> route) => false,
                    );
                  }),
            )
          ],
        ));*/
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
      body: SignupPageContent(),
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Company name, Inc",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}

class SignupPageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignupPageContent();
}

class _SignupPageContent extends State<SignupPageContent> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  TextEditingController telNum = TextEditingController();
  bool _isVisible = false;
  bool _isVisible2 = true;
  bool _isObscure2 = true;
  String returnVisibilityString = "";

  bool returnVisibility(String password1, String password2, String username) {
    if (password1 != password2) {
      returnVisibilityString = "Passwords do not match";
    } else if (username == "") {
      returnVisibilityString = "Username cannot be empty";
    } else if (password1 == "" || password2 == "") {
      returnVisibilityString = "Password fields cant be empty";
    } else if (!auth.isPasswordCompliant(password1)) {
      returnVisibilityString = "Not password compliant";
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Sized Box
          SizedBox(
            height: 37.5,
            width: 400,
          ),

          // Signup Text
          Center(
            child: Container(
              height: 245,
              width: 400,
              alignment: Alignment.center,
              child: Text(
                "Signup",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Wrong password text
          Visibility(
            visible: _isVisible,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                returnVisibilityString,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 10,
                ),
              ),
            ),
          ),

          // Signup Info
          Container(
            height: 215,
            width: 530,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white),
            child: Column(
              children: <Widget>[
                TextFormField(
                  onTap: () {
                    setState(() {
                      _isVisible = false;
                    });
                  },
                  controller: usernameController, // Controller for Username
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "ou shet",
                      contentPadding: EdgeInsets.all(20)),
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                ),
                Divider(
                  thickness: 3,
                ),
                TextFormField(
                  onTap: () {
                    setState(() {
                      _isVisible = false;
                    });
                  },

                  controller: passwordController1, // Controller for Password
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Kod",

                      contentPadding: EdgeInsets.all(20),

                      // Adding the visibility icon to toggle visibility of the password field
                      ),

                ),
                Divider(
                  thickness: 3,
                ),
                TextFormField(
                  onTap: () {
                    setState(() {
                      _isVisible = false;
                    });
                  },

                  controller: passwordController2, // Controller for Password
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Re-enter Password",
                      contentPadding: EdgeInsets.all(20),
                      // Adding the visibility icon to toggle visibility of the password field
                      suffixIcon: IconButton(
                        icon: Icon(_isObscure2
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isObscure2 = !_isObscure2;
                          });
                        },
                      )),
                  obscureText: _isObscure2,
                ),
              ],
            ),
          ),

          // Signup Submit button
          Container(
            width: 570,
            height: 70,
            padding: EdgeInsets.only(top: 20),
            child: ElevatedButton(
                child: Text("Submit", style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  if (kDebugMode) {
                    print(
                        "Username: ${usernameController.text}\npassword: ${passwordController1.text}\nretry password ${passwordController2.text}");
                  }

                  if (usernameController.text != "" &&
                      passwordController1.text == passwordController2.text &&
                      passwordController2.text != "" &&
                      auth.isPasswordCompliant(passwordController1.text)) {
                    print("I got in here");
                    if (!auth.checkUserRepeat(usernameController.text)) {
                      auth.insertCredentials(
                          usernameController.text, passwordController1.text);

                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) =>Home()),
                            (Route<dynamic> route) => false,
                      );
                    } else {
                      setState(() {
                        returnVisibilityString = "Username already exists";
                        _isVisible = true;
                      });
                    }
                  } else {
                    setState(() {
                      _isVisible = returnVisibility(passwordController1.text,
                          passwordController2.text, usernameController.text);
                    });
                  }
                }),
          ),
          TextFormField(
            onTap: () {
              setState(() {
                _isVisible = true;
              });
            },
            controller: telNum, // Controller for Username
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Kod",
                contentPadding: EdgeInsets.all(20)),
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
          ),
        ],
      ),
    );
  }
}

