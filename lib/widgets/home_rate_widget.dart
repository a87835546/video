import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/home_banner_model.dart';

class HomeRateWidget extends StatefulWidget {
  final HomeBannerModel model;
  final bool? hiddenType;
  const HomeRateWidget({super.key, required this.model, this.hiddenType});

  @override
  State<StatefulWidget> createState() {
    return _HomeRateWidgetState();
  }
}

class _HomeRateWidgetState extends State<HomeRateWidget> {
  double fem = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 2 * fem, 22 * fem, 0 * fem),
            height: 20 * fem,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 15 * fem, 0 * fem),
                  height: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 7.33 * fem, 0 * fem),
                        width: 13.33 * fem,
                        height: 12.67 * fem,
                        child: const Icon(
                          Icons.star_rate_rounded,
                          size: 14,
                          color: Color(0xffffbb38),
                        ),
                      ),
                      Text("${widget.model.rate}",
                          style: GoogleFonts.zenKakuGothicNew(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffffbb38),
                              height: 1.4)),
                    ],
                  ),
                ),
                Text(widget.model.public ?? '2016',
                    style: GoogleFonts.zenKakuGothicNew(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff757575),
                        height: 1.4)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 27 * fem, 2 * fem),
            child: Text(widget.model.newDuration(),
                style: GoogleFonts.zenKakuGothicNew(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff757575),
                    height: 1.4)),
          ),
          Visibility(
            visible: widget.hiddenType != true,
            child: Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 26 * fem, 2 * fem),
              child: Text('动作  剧情',
                  style: GoogleFonts.zenKakuGothicNew(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff757575),
                      height: 1.4)),
            ),
          )
        ],
      ),
    );
  }
}
