import 'package:flutter/material.dart';

import 'package:adobe_xd/pinned.dart';

import 'package:adobe_xd/page_link.dart';
import 'package:app/screens/sign_up/sign_up.dart';
import '../../widgets/hero_image.dart';
import 'localWidgets/sign_in_form.dart';
import '../../widgets/hero_title.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // // shows header title
        // HeroTitle(
        //   title: 'Welcome!',
        //   subtitle: 'Enter email and password to login...',
        // ),
        // // shows image
        // HeroImage(
        //   path: 'assets/loginHero.svg',
        //   sementicLabel: 'Login Hero',
        // ),
        Pinned.fromPins(
            Pin(start: 20.0, end: 14.7), Pin(size: 94.0, start: 15.0),
            child: Stack(
              children: <Widget>[
                Container(),
                Pinned.fromPins(
                  Pin(size: 113.0, middle: 0.5015),
                  Pin(size: 42.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'Tabs' (group)
                      Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(size: 45.0, end: 0.0),
                        Pin(start: 0.0, end: 0.0),
                        child:
                            // Adobe XD layer: 'Tab Item' (group)
                            PageLink(
                          links: [
                            PageLinkInfo(
                              transition: LinkTransition.Fade,
                              ease: Curves.easeOut,
                              duration: 0.2,
                              //    onPressed: () => Get.to(() => SignUp())
                              pageBuilder: () => SignUp(),
                            ),
                          ],
                          child: Stack(
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
                                    color: const Color(0xffa7a0ad),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 44.0, start: 0.0),
                        Pin(start: 0.0, end: 0.0),
                        child:
                            // Adobe XD layer: 'Tab Item' (group)
                            Stack(
                          children: <Widget>[
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(start: 0.0, end: 0.0),
                              child:
                                  // Adobe XD layer: 'Area' (group)
                                  Stack(
                                children: <Widget>[
                                  Pinned.fromPins(
                                    Pin(start: 2.0, end: 0.0),
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
                                    Pin(start: 0.0, end: 2.0),
                                    Pin(size: 2.0, end: 5.0),
                                    child:
                                        // Adobe XD layer: 'Bar [STATE:ACTIVE]' (shape)
                                        Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1000.0),
                                        color: const Color(0xff8a56ac),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(start: 2.0, end: 1.0),
                              Pin(size: 11.0, middle: 0.6129),
                              child:
                                  // Adobe XD layer: 'Label' (text)
                                  Text(
                                'SIGN IN',
                                style: TextStyle(
                                  fontFamily: 'Cambria Math',
                                  fontSize: 11,
                                  color: const Color(0xff8a56ac),
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),

        // shows textfields and buttons
        SignInForm(),
      ],
    );
  }
}
