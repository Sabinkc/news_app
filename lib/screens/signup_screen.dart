import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/common/colors.dart';
import 'package:news_app/common/common_button.dart';
import 'package:news_app/common/common_textfield.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                top: 60,
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height * 0.73,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          CommonTextfield(
                            labelText: "Email",
                            hintText: "example@gmail.com",
                            isObscure: false,
                            suffixIcon: Icons.email_outlined,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CommonTextfield(
                            labelText: "Password",
                            hintText: "**********",
                            isObscure: true,
                            suffixIcon: Icons.lock_clock_outlined,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CommonTextfield(
                            labelText: "Confirm Password",
                            hintText: "**********",
                            isObscure: true,
                            suffixIcon: Icons.lock_clock_outlined,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Forget Password?",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: CommonColor.primaryColor,
                                color: CommonColor.primaryColor,
                                fontSize: 17),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Divider(
                            color: CommonColor.primaryColor,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: CommonButton(
                              onPressed: () {},
                              buttonName: "SignUp",
                              horizontalPadding: 135,
                              verticalPadding: 10,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Divider(
                            color: CommonColor.primaryColor,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              "OR",
                              style: TextStyle(
                                  color: CommonColor.primaryColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
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
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
                                style: TextStyle(
                                    color: CommonColor.primaryColor,
                                    fontSize: 16),
                              ),
                              Text(
                                "LogIn",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: CommonColor.primaryColor,
                                    color: CommonColor.primaryColor,
                                    fontSize: 16),
                              ),
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
