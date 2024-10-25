// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:news_app/common/colors.dart';
// import 'package:news_app/common/common_button.dart';
// import 'package:news_app/common/common_textfield.dart';
// import 'package:news_app/screens/home_screen.dart';
// import 'package:news_app/screens/signup_screen.dart';
// import 'package:page_transition/page_transition.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController _emailController = TextEditingController();
//     TextEditingController _passwordController = TextEditingController();

//     signIn(String email, String password) async {
//       try {
//         if (email == "" || password == "") {
//           showDialog(
//               context: context,
//               builder: (context) {
//                 return AlertDialog(
//                   title: Text("Enter required fields"),
//                 );
//               });
//         } else {
//           UserCredential? userCredential = await FirebaseAuth.instance
//               .signInWithEmailAndPassword(email: email, password: password)
//               .then((value) {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => HomeScreen()));
//           });
//         }
//       } on FirebaseException catch (e) {
//         showDialog(
//             context: context,
//             builder: (context) => AlertDialog(
//                   title: Text(e.toString()),
//                 ));
//       }
//     }

//     return SafeArea(
//       child: Scaffold(
//           backgroundColor: CommonColor.primaryColor,
//           body: Stack(
//             children: [
//               Positioned(
//                 left: 5,
//                 child: IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.arrow_back,
//                       color: Colors.white,
//                       size: 30,
//                     )),
//               ),
//               Positioned(
//                 top: 80,
//                 child: Container(
//                   padding: EdgeInsets.only(left: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Welcome Back!",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 30,
//                             fontWeight: FontWeight.w600),
//                       ),
//                       Text(
//                         "Log In!",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 30,
//                             fontWeight: FontWeight.w600),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(40),
//                       topRight: Radius.circular(40),
//                     ),
//                     color: Colors.white,
//                   ),
//                   height: MediaQuery.of(context).size.height * 0.67,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20),
//                     child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           SizedBox(
//                             height: 30,
//                           ),
//                           CommonTextfield(
//                             controller: _emailController,
//                             labelText: "Email",
//                             hintText: "example@gmail.com",
//                             isObscure: false,
//                             suffixIcon: Icons.email_outlined,
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           CommonTextfield(
//                             controller: _passwordController,
//                             labelText: "Password",
//                             hintText: "**********",
//                             isObscure: true,
//                             suffixIcon: Icons.lock_clock_outlined,
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             "Forget Password?",
//                             style: TextStyle(
//                                 decoration: TextDecoration.underline,
//                                 decorationColor: CommonColor.primaryColor,
//                                 color: CommonColor.primaryColor,
//                                 fontSize: 17),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Divider(
//                             color: CommonColor.primaryColor,
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Center(
//                             child: CommonButton(
//                               onPressed: () {
//                                 signIn(_emailController.text,
//                                     _passwordController.text);
//                               },
//                               buttonName: "Log In",
//                               horizontalPadding: 145,
//                               verticalPadding: 10,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Divider(
//                             color: CommonColor.primaryColor,
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Center(
//                             child: Text(
//                               "OR",
//                               style: TextStyle(
//                                   color: CommonColor.primaryColor,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Container(
//                                   decoration: BoxDecoration(
//                                       color: CommonColor.primaryColor,
//                                       borderRadius: BorderRadius.circular(5)),
//                                   padding: EdgeInsets.all(15),
//                                   child: FaIcon(
//                                     color: Colors.white,
//                                     FontAwesomeIcons.google,
//                                   )),
//                               Container(
//                                   decoration: BoxDecoration(
//                                       color: CommonColor.primaryColor,
//                                       borderRadius: BorderRadius.circular(5)),
//                                   padding: EdgeInsets.all(15),
//                                   child: FaIcon(
//                                     color: Colors.white,
//                                     FontAwesomeIcons.facebook,
//                                   )),
//                               Container(
//                                   decoration: BoxDecoration(
//                                       color: CommonColor.primaryColor,
//                                       borderRadius: BorderRadius.circular(5)),
//                                   padding: EdgeInsets.all(15),
//                                   child: FaIcon(
//                                     color: Colors.white,
//                                     FontAwesomeIcons.apple,
//                                   )),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 40,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Don't have an account? ",
//                                 style: TextStyle(
//                                     color: CommonColor.primaryColor,
//                                     fontSize: 16),
//                               ),
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               SignupScreen()));
//                                 },
//                                 child: Text(
//                                   "SignUp",
//                                   style: TextStyle(
//                                       decoration: TextDecoration.underline,
//                                       decorationColor: CommonColor.primaryColor,
//                                       color: CommonColor.primaryColor,
//                                       fontSize: 16),
//                                 ),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/common/colors.dart';
import 'package:news_app/common/common_alert_dialogue_box.dart';
import 'package:news_app/common/common_button.dart';
import 'package:news_app/common/common_textfield.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/signup_screen.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool isPasswordObscure = true; // Variable to manage loading state

  signIn(String email, String password) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        showDialog(
            context: context,
            builder: (context) {
              return CommonAlertDialogueBox(title: "Enter required fields");
            });
      } else {
        setState(() {
          _isLoading = true; // Set loading to true when starting sign-in
        });

        UserCredential? userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        setState(() {
          _isLoading = false; // Set loading to false after sign-in
        });

        // Navigate to HomeScreen after successful sign-in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } on FirebaseException catch (e) {
      setState(() {
        _isLoading = false; // Set loading to false if an error occurs
      });
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: Colors.blue,
                title: Text(
                  e.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: CommonColor.primaryColor,
          body: Stack(
            children: [
              Positioned(
                left: 5,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    )),
              ),
              Positioned(
                top: 80,
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Log In!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height * 0.67,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 30),
                          CommonTextfield(
                            controller: _emailController,
                            labelText: "Email",
                            hintText: "example@gmail.com",
                            isObscure: false,
                            suffixIcon: Icons.email_outlined,
                          ),
                          SizedBox(height: 20),
                          CommonTextfield(
                            controller: _passwordController,
                            labelText: "Password",
                            hintText: "**********",
                            isObscure: isPasswordObscure,
                            suffixIcon: Icons.visibility,
                            onSuffixIconPressed: () {
                              setState(() {
                                isPasswordObscure = !isPasswordObscure;
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Forget Password?",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: CommonColor.primaryColor,
                                color: CommonColor.primaryColor,
                                fontSize: 17),
                          ),
                          const SizedBox(height: 20),
                          Divider(color: CommonColor.primaryColor),
                          const SizedBox(height: 20),
                          Center(
                            child:
                                _isLoading // Show CircularProgressIndicator when loading
                                    ? CircularProgressIndicator()
                                    : CommonButton(
                                        onPressed: () {
                                          signIn(_emailController.text,
                                              _passwordController.text);
                                        },
                                        buttonName: "Log In",
                                        horizontalPadding: 145,
                                        verticalPadding: 10,
                                      ),
                          ),
                          const SizedBox(height: 20),
                          Divider(color: CommonColor.primaryColor),
                          const SizedBox(height: 20),
                          Center(
                            child: Text(
                              "OR",
                              style: TextStyle(
                                  color: CommonColor.primaryColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: CommonColor.primaryColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: EdgeInsets.all(15),
                                  child: FaIcon(
                                    color: Colors.white,
                                    FontAwesomeIcons.google,
                                  )),
                              Container(
                                  decoration: BoxDecoration(
                                      color: CommonColor.primaryColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: EdgeInsets.all(15),
                                  child: FaIcon(
                                    color: Colors.white,
                                    FontAwesomeIcons.facebook,
                                  )),
                              Container(
                                  decoration: BoxDecoration(
                                      color: CommonColor.primaryColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: EdgeInsets.all(15),
                                  child: FaIcon(
                                    color: Colors.white,
                                    FontAwesomeIcons.apple,
                                  )),
                            ],
                          ),
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                    color: CommonColor.primaryColor,
                                    fontSize: 16),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignupScreen()));
                                },
                                child: Text(
                                  "SignUp",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: CommonColor.primaryColor,
                                      color: CommonColor.primaryColor,
                                      fontSize: 16),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
