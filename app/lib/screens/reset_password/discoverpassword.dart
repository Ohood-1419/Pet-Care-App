
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

import 'package:adobe_xd/page_link.dart';
import 'package:app/screens/root.dart';




class Passwordrecover1 extends StatelessWidget {
 
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f7fa),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 76.0, end: 75.0),
            Pin(size: 224.0, middle: 0.2823),
            child:
                // Adobe XD layer: 'Mobile-rafiki (1)' (shape)
                Container(
              decoration: BoxDecoration(
                //here we put image ******
                image: DecorationImage(
                  //wrong image **  image   **
               image: const AssetImage('assets/recovering.png'),
                fit: BoxFit.fill,
                ),
              ),
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
                            Pinned.fromPins(
                              Pin(size: 42.0, start: 2.0),
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
                        Pin(start:4.0, end: 0.0),
                        Pin(size: 13.0, middle: 0.5),
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
            Pin(start: 24.0, end: 24.0),
            Pin(size: 48.0, middle: 0.7919),
            child:
                // Adobe XD layer: 'Button' (group)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
      pageBuilder: () => Root(),
                ),
              ],
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child:
                        // Adobe XD layer: 'Area' (shape)
                        Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000.0),
                        color: const Color(0xff8a56ac),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x1a34ffc8),
                            offset: Offset(0, 8),
                            blurRadius: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 50.0, middle: 0.5015),
            Pin(size: 30.0, end: 175.0),
            child: Text(
              'Got It',
              style: TextStyle(
                fontFamily: 'Cambria Math',
                fontSize: 17,
                color: const Color(0xfff1f0f2),
                letterSpacing: -0.2732143135070801,
                height: 1.1764705882352942,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 297.0, middle: 0.5),
            Pin(start: 690.0, end: 120.0),
            child: Text(
              'Did not receive the email? Check your spam filter.',
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
          Container(),
          Pinned.fromPins(
            Pin(size: 264.0, middle: 0.5045),
            Pin(start: 388.0, end: 388.0),
            child: Text(
              'We have sent a password recover\ninstructions to your email.',
              style: TextStyle(
                fontFamily: 'Cambria Math',
                fontSize: 15,
                color: const Color(0xff533467),
                letterSpacing: -0.28928574371337895,
                height: 1,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
