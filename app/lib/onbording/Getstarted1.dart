import 'package:app/clincs/root.dart';
import 'package:app/screens/root.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:get/get.dart';

import './welcome12.dart';
import 'package:adobe_xd/page_link.dart';
import './welcome21.dart';

import 'package:flutter_svg/flutter_svg.dart';

class Getstarted1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff241332),
      body: Stack(
        children: <Widget>[
          Container(),
          Pinned.fromPins(
            Pin(start: 26.0, end: 24.0),
            Pin(size: 508.0, start: 77.0),
            child:
                // Adobe XD layer: 'content' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 34.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'stacks' (group)
                      Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(start: 15.0, end: 32.0),
                        Pin(start: 59.0, end: 0.0),
                        child:
                            // Adobe XD layer: 'bg' (shape)
                            Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(80.0),
                              bottomLeft: Radius.circular(80.0),
                            ),
                            color: const Color(0xffa3a4a4),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(start: 6.0, end: 17.0),
                        Pin(start: 49.0, end: 11.0),
                        child:
                            // Adobe XD layer: 'bg' (shape)
                            Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(80.0),
                              bottomLeft: Radius.circular(80.0),
                            ),
                            color: const Color(0xffb9b9b9),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(start: 0.0, end: 21.0),
                        child:
                            // Adobe XD layer: 'card' (group)
                            Stack(
                          children: <Widget>[
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(start: 0.0, end: 0.0),
                              child:
                                  // Adobe XD layer: 'bg' (shape)
                                  Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(80.0),
                                    bottomLeft: Radius.circular(80.0),
                                  ),
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 158.0, middle: 0.497),
                              Pin(size: 32.0, middle: 0.81),
                              child: Text(
                                'Get Started',
                                style: TextStyle(
                                  fontFamily: 'Cambria Math',
                                  fontSize: 28,
                                  color: const Color(0xff000000),
                                  letterSpacing: -0.5142857666015626,
                                  height: 2,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 96.0, middle: 0.5153),
                              Pin(size: 17.0, end: 49.0),
                              child: Text(
                                'Join us today',
                                style: TextStyle(
                                  fontFamily: 'Cambria Math',
                                  fontSize: 17,
                                  color: const Color(0xff767676),
                                  letterSpacing: -0.2732143135070801,
                                  height: 1.1764705882352942,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 47.0, middle: 0.4964),
                  Pin(size: 20.0, start: 0.0),
                  child:
                      // Adobe XD layer: 'Pagination' (group)
                      Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(size: 18.0, start: 0.0),
                        Pin(start: 0.0, end: 0.0),
                        child:
                            // Adobe XD layer: 'Item' (group)
                            Stack(
                          children: <Widget>[
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(start: 0.0, end: 0.0),
                              child:
                                  // Adobe XD layer: 'Area' (shape)
                                  Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 6.0, middle: 0.5),
                              Pin(size: 6.0, middle: 0.5),
                              child:
                                  // Adobe XD layer: 'Dot' (shape)
                                  PageLink(
                                links: [
                                  PageLinkInfo(
                                    transition: LinkTransition.Fade,
                                    ease: Curves.easeOut,
                                    duration: 0.3,
                                    pageBuilder: () => welcome12(),
                                  ),
                                ],
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(9999.0, 9999.0)),
                                    color: const Color(0xff423957),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, middle: 0.5172),
                        Pin(start: 0.0, end: 0.0),
                        child:
                            // Adobe XD layer: 'Item' (group)
                            PageLink(
                          links: [
                            PageLinkInfo(
                              transition: LinkTransition.Fade,
                              ease: Curves.easeOut,
                              duration: 0.3,
                              pageBuilder: () => welcome21(),
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
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 6.0, middle: 0.5),
                                Pin(size: 6.0, middle: 0.5),
                                child:
                                    // Adobe XD layer: 'Dot' (shape)
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(9999.0, 9999.0)),
                                    color: const Color(0xff423957),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, end: 0.0),
                        Pin(start: 0.0, end: 0.0),
                        child:
                            // Adobe XD layer: 'Item' (group)
                            Stack(
                          children: <Widget>[
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(start: 0.0, end: 0.0),
                              child:
                                  // Adobe XD layer: 'Area' (shape)
                                  Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 6.0, middle: 0.5),
                              Pin(size: 6.0, middle: 0.5),
                              child:
                                  // Adobe XD layer: 'Dot' (shape)
                                  Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(9999.0, 9999.0)),
                                  color: const Color(0xffecf1f7),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 44.0, start: 0.0),
            child:
                // Adobe XD layer: 'top' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'bg' (shape)
                      SvgPicture.string(
                    _svg_ojpl3d,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 155.0, end: 44.0),
            child:
                // Adobe XD layer: 'bg' (shape)
                SvgPicture.string(
              _svg_pjpbhl,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 42.0, end: 41.0),
            Pin(size: 292.0, middle: 0.2558),
            child:
                // Adobe XD layer: 'Playful cat-cuate' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/p1.3.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 56.0, middle: 0.5016),
            Pin(size: 17.0, middle: 0.8088),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => Root(),
                ),
              ],
              child: Text(
                'LOG IN',
                style: TextStyle(
                  fontFamily: 'Cambria Math',
                  fontSize: 17,
                  color: const Color(0xffffffff),
                  letterSpacing: -0.2732143135070801,
                  height: 1.1764705882352942,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: -2.0),
            Pin(size: 84.0, end: 44.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(90.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment(0.0, -1.0),
                  end: Alignment(0.0, 1.0),
                  colors: [const Color(0xff723b9d), const Color(0xff0b080d)],
                  stops: [0.0, 1.0],
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 68.0, middle: 0.5016),
            Pin(size: 33.0, end: 69.0),
            child: TextButton(
              onPressed: () => Get.to(() => Root()),
              child: Text(
                'SIGN UP',
                style: TextStyle(
                  fontFamily: 'Cambria Math',
                  fontSize: 17,
                  color: const Color(0xffffffff),
                  letterSpacing: -0.2732143135070801,
                  height: 1.1764705882352942,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 210.0, middle: 0.503),
            Pin(size: 22.0, end: 18.0),

            /**    Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            child: Text('Veterinary Owner? Sign Up Now'),
            onPressed: () => Get.to(() => Forgotpassword1()),
            //Forgotpassword1()
            style: ButtonStyle(
              overlayColor:const Color(0xffffffff)
                  MaterialStateColor.resolveWith((states) => Colors.purple),
            ),
          ),
        ), */
            child: Align(
              // alignment: Alignment.center,
              child: TextButton(
                child: Text(
                  'Veterinary Owner? join here ',
                  style: TextStyle(
                    // fontFamily: 'Cambria Math',
                    fontSize: 12,
                    color: const Color(0xFFFFFFFF),
                    letterSpacing: -0.2732143135070801,
                    height: 0.1764705882352942,
                  ),
                ),
                onPressed: () => Get.to(Clinc()),
                style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith(
                  (states) => Colors.purple,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_ojpl3d =
    '<svg viewBox="0.0 0.0 375.0 44.0" ><path transform="translate(0.0, 44.0)" d="M 0 -44 L 375 -44 L 375 0 L 0 0 L 0 -44 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_pjpbhl =
    '<svg viewBox="0.0 613.0 375.0 155.0" ><path transform="translate(0.0, 613.0)" d="M 80 0 L 375 0 L 375 155 L 0 155 L 0 80 C 0 35.81721878051758 35.81721878051758 0 80 0 Z" fill="#8a56ac" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
