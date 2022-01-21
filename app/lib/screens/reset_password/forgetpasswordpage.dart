import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

import 'package:adobe_xd/page_link.dart';
import 'package:get/get.dart';
import 'package:app/screens/root.dart';

import 'discoverpassword.dart';

class Forgotpassword1 extends StatefulWidget {
  @override
  _Forgotpassword1State createState() => _Forgotpassword1State();
}

class _Forgotpassword1State extends State<Forgotpassword1> {
  late String _email;

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(),
          Pinned.fromPins(
            Pin(size: 40.0, start: 28.0),
            Pin(size: 17.0, middle: 0.322),
            child:
                // Adobe XD layer: 'content' (group)
                Stack(
              children: <Widget>[
                Container(),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 14.7),
            Pin(size: 16.0, start: 15.0),
            child:
                // Adobe XD layer: 'top' (group)
                Stack(
              children: <Widget>[
                Container(),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 85.0, middle: 0.5034),
            Pin(size: 42.0, start: 67.0),
            child:
                // Adobe XD layer: 'Tabs' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 0.0, end: 17.0),
                  Pin(size: 0.0, start: 0.0),
                  child:
                      // Adobe XD layer: 'Tab Item' (group)
                      Stack(
                    children: <Widget>[],
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'Tab Item' (group)
                      Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 2.0),
                        Pin(start: 0.0, end: 0.0),
                        child:
                            // Adobe XD layer: 'Area' (group)
                            Stack(
                          children: <Widget>[
                            Pinned.fromPins(Pin(size: 42.0, start: 2.0),
                                Pin(start: 0.0, end: 0.0),
                                child:
                                    // Adobe XD layer: 'Placement Area [STA…' (shape)
                                    Container()),
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(size: 2.0, end: 5.0),
                              child:
                                  // Adobe XD layer: 'Bar [STATE:ACTIVE]' (shape)
                                  Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1000.0),
                                  color: const Color(0xff8a56ac),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(start: 5.0, end: 0.0),
                        Pin(size: 18.0, middle: 0.6129),
                        child:
                            // Adobe XD layer: 'Label' (text)
                            Text(
                          'Forgot Password',
                          style: TextStyle(
                            fontFamily: 'Cambria Math',
                            fontSize: 10,
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
          Pinned.fromPins(
            Pin(size: 290.0, middle: 0.5534),
            Pin(start: 160.0, end: 617.0),
            child: Text(
              'Enter the email associated with your account \nand we\'ll send an email with instructions to\nreset your password.',
              style: TextStyle(
                fontFamily: 'Cambria Math',
                fontSize: 14,
                color: const Color(0xffa7a0ad),
                letterSpacing: -0.2250000228881836,
                height: 1.4285714285714286,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
          ),

///// here ****

          Pinned.fromPins(
              Pin(size: 16.5, start: 23.0), Pin(size: 13.9, middle: 0.075),
              child: Container(
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Get.to(()=>Root()),
                ),
              )),
          Pinned.fromPins(
            Pin(start: 24.0, end: 24.0),
            Pin(size: 48.0, middle: 0.4463),
            child:
                // Adobe XD layer: 'Button' (group)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.1,
                  pageBuilder: () => Root(),
                ),
              ],
              child: Stack(
                children: <Widget>[],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 180.0, middle: 0.502),
            Pin(size: 45.0, end: 460.0),
            child: RaisedButton(
              splashColor: const Color(0xff8a56ac),
              //    colorBrightness:  const Color(0xff8a56ac),
              // padding: EdgeInsets.all(12.0),
              child: Text(
                '  Send Request  ',
                style: TextStyle(
                  fontFamily: 'Cambria Math',
                  fontSize: 20,
                  color: const Color(0xfff1f0f2),
                  letterSpacing: -0.1732143135070801,
                  height: 1.1764705882352942,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0),
                side: BorderSide(color: const Color(0xff8a56ac)),
              ),
              onPressed: () {
                auth.sendPasswordResetEmail(email: _email);
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Passwordrecover1()));
              },
              color: Theme.of(context).accentColor,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 24.0),
            Pin(size: 40.0, end: 537.0),

            // Adobe XD layer: 'bg' (shape)

            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
