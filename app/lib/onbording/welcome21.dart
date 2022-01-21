import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './welcome12.dart';
import 'package:adobe_xd/page_link.dart';
import './Getstarted1.dart';
import 'package:flutter_svg/flutter_svg.dart';

class welcome21 extends StatelessWidget {

  @override
Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff241332),
      body: Stack(
        children: <Widget>[
          Container(),
          Pinned.fromPins(
            Pin(start: 24.0, end: 24.0),
            Pin(size: 560.0, start: 110.0),
            child:
                // Adobe XD layer: 'content' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'stacks' (group)
                      Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(start: 15.0, end: 32.0),
                        Pin(size: 452.0, end: 0.0),
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
                        Pin(size: 451.0, end: 11.0),
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
            Pin(start: 38.0, end: 38.0),
            Pin(size: 299.0, middle: 0.2788),
            child:
                // Adobe XD layer: 'Cautious dog-cuate' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/p1.2.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
                  Pin(size: 90.0, middle: 0.502),
            Pin(size: 32.0, middle: 0.6423),
     
            child: Text(
              'Enjoy',
              style: TextStyle(
                fontFamily: 'Cambria Math',
                fontSize: 27,
                color: const Color(0xff000000),
                letterSpacing: -0.5142857666015626,
                height: 2.5,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
           Pinned.fromPins(
                         Pin(size: 200.0, middle: 0.5283),
            Pin(size: 37.0, middle: 0.7097),
                              child: Text(
                                'Find your veterinary clinic',
                                style: TextStyle(
                                  fontFamily: 'Cambria Math',
                                  fontSize: 15,
                                  color: const Color(0xff767676),
                                  letterSpacing: -0.2732143135070801,
                                  height: 1.1764705882352942,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                textAlign: TextAlign.center,
                              ),
                            ),
          Pinned.fromPins(
            Pin(size: 47.0, middle: 0.5),
            Pin(size: 20.0, start: 77.0),
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
                            PageLink(
                          links: [
                            PageLinkInfo(
                              transition: LinkTransition.Fade,
                              ease: Curves.easeOut,
                              duration: 0.3,
                              pageBuilder: () => Getstarted1(),
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
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: -1.0, end: -1.0),
            Pin(size: 84.0, end: 0.0),
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
            Pin(size: 86.0, middle: 0.5156),
            Pin(size: 17.0, end: 32.0),
            child: Text(
              'CONTINUE',
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
          Pinned.fromPins(
            Pin(size: 15.4, end: 29.0),
            Pin(size: 17.7, end: 33.1),
            child:
                // Adobe XD layer: 'Icon awesome-arrow-…' (shape)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => Getstarted1(),
                ),
              ],
              child: SvgPicture.string(
                _svg_t9d4v2,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
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
const String _svg_t9d4v2 =
    '<svg viewBox="330.6 761.1 15.4 17.7" ><path transform="translate(330.62, 758.5)" d="M 6.534378051757812 3.833168745040894 L 7.295865058898926 2.933098554611206 C 7.618296146392822 2.551987886428833 8.139674186706543 2.551987886428833 8.458675384521484 2.933098554611206 L 15.12682819366455 10.81074047088623 C 15.44925880432129 11.19185161590576 15.44925880432129 11.80811405181885 15.12682819366455 12.18517208099365 L 8.458675384521484 20.06686401367188 C 8.136242866516113 20.44797515869141 7.614865303039551 20.44797515869141 7.295864105224609 20.06686401367188 L 6.534378051757812 19.16679382324219 C 6.208516120910645 18.78162956237793 6.215376377105713 18.15320205688477 6.548098087310791 17.77614593505859 L 10.68139362335205 13.12173080444336 L 0.8232287168502808 13.12173080444336 C 0.3670228123664856 13.12173080444336 0 12.68791198730469 0 12.148681640625 L 0 10.85128402709961 C 0 10.31205272674561 0.3670228123664856 9.878235816955566 0.8232287168502808 9.878235816955566 L 10.68139362335205 9.878235816955566 L 6.548098564147949 5.223817348480225 C 6.211946964263916 4.846760749816895 6.205086708068848 4.218334197998047 6.534378051757812 3.833168745040894 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
