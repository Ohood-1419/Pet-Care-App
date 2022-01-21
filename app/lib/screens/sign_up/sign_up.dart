import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/hero_title.dart';
import 'package:app/widgets/rounded_text_formfield.dart';

import '../../config.dart';
import '../root.dart';
import 'localWidgets/sign_up_buttons.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FocusNode myFocusNode = new FocusNode();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff8a56ac),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Config.screenWidth! * 0.04),
          child: Form(
            key: _formKey,
            child: Stack(
              children: [
                Stack(
                  children: <Widget>[
                    Pinned.fromPins(
                      Pin(size: 111.0, middle: 0.5152),
                      Pin(size: 42.0, start: 67.0),
                      child:
                          // Adobe XD layer: 'Tabs' (group)
                          Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(size: 45.0, end: 0.0),
                            Pin(start: 0.0, end: 0.0),
                            child:
                                // Adobe XD layer: 'Tab Item' (group)
                                Stack(
                              children: <Widget>[
                                Pinned.fromPins(
                                  Pin(start: 0.0, end: 3.0),
                                  Pin(start: 0.0, end: 0.0),
                                  child:
                                      // Adobe XD layer: 'Area' (group)
                                      Stack(
                                    children: <Widget>[
                                      Pinned.fromPins(
                                        Pin(start: 0.0, end: 0.0),
                                        Pin(start: 0.0, end: 0.0),
                                        child:
                                            // Adobe XD layer: 'Placement Area' (shape)
                                            Container(
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                      Pinned.fromPins(
                                        Pin(start: 0.0, end: 0.0),
                                        Pin(size: 2.0, end: 0.0),
                                        child:
                                            // Adobe XD layer: 'Bar' (shape)
                                            Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(1000.0),
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(start: 0.0, end: 0.0),
                                  Pin(size: 11.0, middle: 0.6129),
                                  child:
                                      // Adobe XD layer: 'Label' (text)
                                      Text(
                                    'SIGN UP',
                                    style: TextStyle(
                                      fontFamily: 'Cambria',
                                      fontSize: 11,
                                      color: const Color(0xffffffff),
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 5.0),
                            Pin(start: 0.0, end: 0.0),
                            child:
                                // Adobe XD layer: 'Tab Item' (group)
                                Stack(children: <Widget>[
                              Pinned.fromPins(
                                Pin(start: 0.0, end: 0.0),
                                Pin(start: 0.0, end: 0.0),
                                child:
                                    // Adobe XD layer: 'Area' (group)
                                    Stack(
                                  children: <Widget>[
                                    Pinned.fromPins(
                                      Pin(size: 42.0, start: 0.0),
                                      Pin(start: 0.0, end: 0.0),
                                      child:
                                          // Adobe XD layer: 'Placement Area [STA…' (shape)
                                          Container(
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                    Pinned.fromPins(
                                      Pin(size: 42.0, end: 0.0),
                                      Pin(size: 2.0, end: 5.0),
                                      child:
                                          // Adobe XD layer: 'Bar [STATE:ACTIVE]' (shape)
                                          Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1000.0),
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 41.0, start: 0.0),
                                Pin(size: 11.0, middle: 0.6129),
                                child:
                                    // Adobe XD layer: 'Label' (text)
                                    PageLink(
                                  links: [
                                    PageLinkInfo(
                                      transition: LinkTransition.Fade,
                                      ease: Curves.easeOut,
                                      duration: 0.3,
                                      pageBuilder: () => Root(),
                                    ),
                                  ],
                                  child: Text(
                                    'SIGN IN',
                                    style: TextStyle(
                                      fontFamily: 'Cambria Math',
                                      fontSize: 11,
                                      color: const Color(0xffa7a0ad),
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),

                              /// here to add text filed
                              ///
                              ///
                              ///
                              ///
                              ///
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

//
                SizedBox(
                  height: 30,
                ),
                buildTextFormFields(),
                SignUpButtons(
                    formKey: _formKey,
                    nameController: _nameController,
                    emailController: _emailController,
                    passwordController: _passwordController),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildTextFormFields() {
    return Expanded(
      flex: 11,
      child: Column(
        children: [
          SizedBox(
            height: 170,
          ),
          // Flexible(
          //   flex: 1,
          //   child: SizedBox(height: Config.screenHeight! * 0.08),
          // ),
          TextFormField(
            // | for text  to write any thing
            cursorColor: Colors.white70,
            focusNode: myFocusNode,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: const Color(0xFFF1DCFF),
                    width: 2.0,
                  ),
                ),
                icon: Icon(Icons.supervised_user_circle_rounded,
                    size: IconTheme.of(context).size, color: Colors.white70),
                labelText: 'Owner Name',
                labelStyle: TextStyle(
                    color: myFocusNode.hasFocus
                        ? const Color(0xFFF1DCFF)
                        : Colors.white70),
                //  errorBorder: errorMessage,
                counterText: '',
                hintText: "Ohood",
                hintStyle: TextStyle(color: Colors.black12),
                fillColor: Colors.white70),
            keyboardType: TextInputType.emailAddress,
            maxLength: 70,

            controller: _nameController,

            validator: (value) {
              if (value.toString().length <= 2) {
                return 'Enter valid name.';
              }
              return null;
            },
          ),
          SizedBox(height: Config.screenHeight! * 0.02),
          TextFormField(
            // | for text  to write any thing
            cursorColor: Colors.white70,

            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: const Color(0xFFF1DCFF),
                    width: 2.0,
                  ),
                ),
                icon: Icon(Icons.email,
                    size: IconTheme.of(context).size, color: Colors.white70),
                labelText: 'Email.',
                labelStyle: TextStyle(
                    color: myFocusNode.hasFocus
                        ? const Color(0xFFF1DCFF)
                        : Colors.white70),
                counterText: '',
                hintText: "test@gmail.com",
                hintStyle: TextStyle(color: Colors.black12),
                fillColor: Colors.white70),

            keyboardType: TextInputType.emailAddress,
            maxLength: 70,

            controller: _emailController,
            validator: (value) {
              bool _isEmailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value!);
              if (!_isEmailValid) {
                return 'Invalid email.';
              }
              return null;
            },
          ),

          //
          SizedBox(height: Config.screenHeight! * 0.02),

          TextFormField(
            // | for text  to write any thing
            cursorColor: Colors.white70,
            obscureText: true,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: const Color(0xFFF1DCFF),
                    width: 2.0,
                  ),
                ),
                icon: Icon(Icons.password,
                    size: IconTheme.of(context).size, color: Colors.white70),
                labelText: 'Password ',
                labelStyle: TextStyle(
                    color: myFocusNode.hasFocus
                        ? const Color(0xFFF1DCFF)
                        : Colors.white70),
                counterText: '',
                hintText: "********",
                hintStyle: TextStyle(color: Colors.black12),
                fillColor: Colors.white70),
            keyboardType: TextInputType.emailAddress,
            maxLength: 70,
            controller: _passwordController,
            validator: (value) {
              if (value.toString().length < 6) {
                return 'Password should be longer or equal to 6 characters.';
              }
              return null;
            },
          ),
          SizedBox(height: Config.screenHeight! * 0.02),
          TextFormField(
            // | for text  to write any thing
            cursorColor: Colors.white70,
            obscureText: true,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: const Color(0xFFF1DCFF),
                    width: 2.0,
                  ),
                ),
                icon: Icon(Icons.password,
                    size: IconTheme.of(context).size, color: Colors.white70),
                labelText: 'Confirm Password',
                labelStyle: TextStyle(
                    color: myFocusNode.hasFocus
                        ? const Color(0xFFF1DCFF)
                        : Colors.white70),
                counterText: '',
                hintText: "********",
                hintStyle: TextStyle(color: Colors.black12),
                fillColor: Colors.white70),
            keyboardType: TextInputType.emailAddress,
            maxLength: 70,
  
   validator: (value) {
              if (value!.trim() != _passwordController.text.trim()) {
                return 'Passwords does not match!';
              }

              return null;
            },
          ),
        ],
      ),
    );
  }
}
