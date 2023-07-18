import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:irriot/helper/show_snack_bar.dart';

import 'package:irriot/screens/Sensors_Screen.dart';
import 'package:irriot/screens/home_screen.dart';
import 'package:irriot/screens/signup_page.dart';
import 'package:irriot/screens/welcome_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../components/authentication_button.dart';
import '../components/custom_text_field.dart';
import '../constants.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool rememberMe = false;
  String Email = '';
  String password = '';
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Material(
        child: Form(
          key: formKey,
          child: Stack(
            alignment: Alignment.bottomRight,
            fit: StackFit.expand,
            children: [
              // First Child in the stack

              Container(
                decoration:const BoxDecoration(color: Colors.white),
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/20),
                child: Image.asset(
                  'assets/images/1026.png',
                  alignment: Alignment.topCenter,
                  fit: BoxFit.contain,
                  
                ),
              ),

              // Positioned(
              //   top: 30.0,
              //   left: 20.0,
              //   child: CircleAvatar(
              //     backgroundColor: Colors.white,
              //     radius: 20.0,
              //     child: IconButton(
              //       onPressed: () {
              //         exit(0);
              //       },
              //       icon: Icon(
              //         Icons.arrow_back_ios_new,
              //         color: kDarkGreenColor,
              //         size: 24.0,
              //       ),
              //     ),
              //   ),
              // ),
// MediaQuery.of(context).size.height*0.4
              // Second Child in the stack
            
               Positioned(
                    height: MediaQuery.of(context).size.height * 0.68,
                    width: MediaQuery.of(context).size.width,
                    child: Scaffold(
                      body: SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white),
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height * 0.67,
                            maxWidth: MediaQuery.of(context).size.width,
                          ),
                          child: Container(
                            padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/22),
                            child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // First Column
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Water wisely, irrigate smartly',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.roboto(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w600,
                                          color: gColor,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/17),
                                        child: Text(
                                          'Login to your account',
                                          style: GoogleFonts.poppins(
                                            color: kGreyColor,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                        
                                  // Second Column
                                  Container(
                                    padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/22),
                                    child: Column(
                                      
                                      children: [
                                        CustomTextField(
                                          hintText: 'Email',
                                          icon: Icons.email,
                                          keyboardType: TextInputType.name,
                                          onChanged: (value) {
                                            Email = value;
                                          },
                                        ),
                                        CustomTextField(
                                          hintText: 'Password',
                                          icon: Icons.lock,
                                          obscureText: true,
                                          keyboardType: TextInputType.visiblePassword,
                                          onChanged: (value) {
                                            password = value != '' ? value : '';
                                          },
                                        ),
                                        //     Padding(
                                        //       padding: const EdgeInsets.symmetric(
                                        //           horizontal: 10.0),
                                        //       child: Row(
                                        //         mainAxisAlignment:
                                        //             MainAxisAlignment.spaceBetween,
                                        //         children: [
                                        //           Row(
                                        //             children: [
                                        //               Checkbox(
                                        //                 checkColor: Colors.white,
                                        //                 fillColor: MaterialStateProperty.all(
                                        //                     kDarkGreenColor),
                                        //                 value: rememberMe,
                                        //                 onChanged: (value) {
                                        //                   setState(() {
                                        //                     rememberMe = value!;
                                        //                   });
                                        //                 },
                                        //               ),
                                        //               Text(
                                        //                 'Remember Me',
                                        //                 style: TextStyle(
                                        //                   color: kGreyColor,
                                        //                   fontSize: 14.0,
                                        //                 ),
                                        //               )
                                        //             ],
                                        //           ),
                                        //           TextButton(
                                        //             onPressed: () {},
                                        //             style: ButtonStyle(
                                        //               foregroundColor:
                                        //                   MaterialStateProperty.all(
                                        //                       kDarkGreenColor),
                                        //             ),
                                        //             child: const Text(
                                        //               'Forgot Password ?',
                                        //             ),
                                        //           )
                                        //         ],
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
                                  
                                        // Third Column
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 20.0,
                                            right: 20.0,
                                            bottom: 20.0,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              AuthenticationButton(
                                                  label: 'Log In',
                                                  onPressed: () async {
                                                    if (formKey.currentState!
                                                        .validate()) {
                                                      isloading = true;
                                  
                                                      setState(() {});
                                  
                                                      try {
                                                        await LoginUser();
                                                        showSnackBar(
                                                            context, 'Welcome');
                                                        Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                HomeScreen(),
                                                          ),
                                                        );
                                                        isloading = false;
                                                        setState(() {});
                                                      } on FirebaseAuthException catch (e) {
                                                        if (e.code ==
                                                            'user-not-found') {
                                                          showSnackBar(context,
                                                              'No user found for that email.');
                                                        } else if (e.code ==
                                                            'wrong-password') {
                                                          showSnackBar(context,
                                                              'Wrong password provided for that user.');
                                                        }
                                                      }
                                                      isloading = false;
                                                      setState(() {});
                                                    }
                                                  }),
                                              //                   Container(
                                              // height: 100,
                                              // alignment: Alignment.center,
                                              // padding: EdgeInsets.all(20),
                                              // child: ElevatedButton.icon(
                                              //     onPressed: () async {
                                              //      await signInWithGoogle();
                                              //                   showSnackBar(context, 'Welcome');
                                              //                         Navigator.pushReplacement(
                                              //                           context,
                                              //                           MaterialPageRoute(
                                              //                             builder: (context) =>
                                              //                                 HomeScreen(),
                                              //                           ),
                                              //                         );
                                              //     },
                                              //     icon: Icon(Icons.lock_open),  //icon data for elevated button
                                              //     label: Text("Or Sign in with Google"), //label text
                                              //     style: ElevatedButton.styleFrom(
                                              //        backgroundColor: Colors.red //elevated btton background color
                                              //     ),
                                              // ),
                                              // ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(top: 10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Text(
                                                      'Don\'t have an account ?',
                                                      style:
                                                          TextStyle(fontSize: 14.0),
                                                    ),
                                                    TextButton(
                                                      style: ButtonStyle(
                                                        foregroundColor:
                                                            MaterialStateProperty.all(
                                                                kDarkGreenColor),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    SignupScreen()));
                                                      },
                                                      child: const Text(
                                                        'Sign up',
                                                        style:
                                                            TextStyle(fontSize: 14.0),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    )),
              
            ],
          ),
        ),
      ),
    );
  }

  Future<void> LoginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: Email, password: password);
  }

//   Future<UserCredential> signInWithGoogle() async {
//     isloading = true;
//     // Trigger the authentication flow
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication? googleAuth =
//         await googleUser?.authentication;

//     // Create a new credential
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );

//     // Once signed in, return the UserCredential
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }
// }
}
