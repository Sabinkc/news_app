// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:news_app/common/colors.dart';
// import 'package:news_app/common/common_button.dart';
// import 'package:news_app/common/common_textfield.dart';
// import 'package:news_app/screens/home_screen.dart';
// import 'package:news_app/screens/login_screen.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController _emailController = TextEditingController();
//     TextEditingController _passwordController = TextEditingController();
//     bool isPasswordObscure = true;
//     bool isConfirmPasswordObscure = true;

//     Future SignUp(String email, String password) async {
//       if (email == "" || password == "") {
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text("Enter the required field"),
//           ),
//         );
//       } else {
//         try {
//           UserCredential? _userCredential = await FirebaseAuth.instance
//               .createUserWithEmailAndPassword(email: email, password: password)
//               .then((value) {
//             showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                       backgroundColor: Colors.blue,
//                       title: Text(
//                         "Signed Up Successflully!",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ));
//             Future.delayed(Duration(seconds: 1), () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => HomeScreen()));
//             });
//           });
//         } on FirebaseAuthException catch (e) {
//           showDialog(
//               context: context,
//               builder: ((context) => AlertDialog(
//                     backgroundColor: Colors.blue,
//                     title: Text(e.toString(),
//                         style: TextStyle(color: Colors.white)),
//                   )));
//         }
//         ;
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
//                 top: 60,
//                 child: Container(
//                   padding: EdgeInsets.only(left: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Welcome!",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 30,
//                             fontWeight: FontWeight.w600),
//                       ),
//                       Text(
//                         "Sign Up!",
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
//                   height: MediaQuery.of(context).size.height * 0.73,
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
//                             isObscure: isPasswordObscure,
//                             suffixIcon: Icons.visibility,
//                             onSuffixIconPressed: () {
//                               setState(() {
//                                 isPasswordObscure = !isPasswordObscure;
//                               });
//                             },
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           CommonTextfield(
//                             labelText: "Confirm Password",
//                             hintText: "**********",
//                             isObscure: isConfirmPasswordObscure,
//                             suffixIcon: Icons.visibility,
//                             onSuffixIconPressed: () {
//                               setState(() {
//                                 isConfirmPasswordObscure =
//                                     !isConfirmPasswordObscure;
//                               });
//                             },
//                           ),
//                           SizedBox(
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
//                                 SignUp(_emailController.text,
//                                     _passwordController.text);
//                               },
//                               buttonName: "SignUp",
//                               horizontalPadding: 135,
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
//                             height: 30,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Already have an account? ",
//                                 style: TextStyle(
//                                     color: CommonColor.primaryColor,
//                                     fontSize: 16),
//                               ),
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: Text(
//                                   "LogIn",
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
import 'package:news_app/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future SignUp(String email, String password) async {
    if (email == "" || password == "") {
      showDialog(
          context: context,
          builder: (context) =>
              CommonAlertDialogueBox(title: "Enter the required fields"));
    } else {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        showDialog(
            context: context,
            builder: (context) =>
                CommonAlertDialogueBox(title: "Signed Up Successfully!"));
        // Pop the dialog and navigate to HomeScreen after a short delay
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pop(context); // To close the dialog
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        });
      } on FirebaseAuthException catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.blue,
            title: Center(
              child: Text(e.message ?? "Signup failed",
                  style: const TextStyle(color: Colors.white)),
            ),
          ),
        );
      }
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
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Positioned(
              top: 60,
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Welcome!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Sign Up!",
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
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                height: MediaQuery.of(context).size.height * 0.73,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(height: 30),
                        CommonTextfield(
                          controller: _emailController,
                          labelText: "Email",
                          hintText: "example@gmail.com",
                          isObscure: false,
                          suffixIcon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 20),
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
                        const SizedBox(height: 20),
                        CommonTextfield(
                          labelText: "Confirm Password",
                          hintText: "**********",
                          controller: _confirmPasswordController,
                          isObscure: isConfirmPasswordObscure,
                          suffixIcon: Icons.visibility,
                          onSuffixIconPressed: () {
                            setState(() {
                              isConfirmPasswordObscure =
                                  !isConfirmPasswordObscure;
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
                          child: CommonButton(
                            onPressed: () {
                              if (_passwordController.text !=
                                  _confirmPasswordController.text) {
                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        CommonAlertDialogueBox(
                                            title: 'Passwords do not match'));
                              } else {
                                SignUp(_emailController.text,
                                    _passwordController.text);
                              }
                            },
                            buttonName: "SignUp",
                            horizontalPadding: 135,
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
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.all(15),
                              child: const FaIcon(
                                color: Colors.white,
                                FontAwesomeIcons.google,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: CommonColor.primaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.all(15),
                              child: const FaIcon(
                                color: Colors.white,
                                FontAwesomeIcons.facebook,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: CommonColor.primaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.all(15),
                              child: const FaIcon(
                                color: Colors.white,
                                FontAwesomeIcons.apple,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(
                                  color: CommonColor.primaryColor,
                                  fontSize: 16),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "LogIn",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: CommonColor.primaryColor,
                                  color: CommonColor.primaryColor,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
