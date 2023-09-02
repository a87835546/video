import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatefulWidget {
  final Function? play;
  Function? favor;
  MenuPage({super.key, this.play, this.favor});

  @override
  State<StatefulWidget> createState() {
    return _MenuPageState();
  }
}

class _MenuPageState extends State<MenuPage> {
  double fem = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // bannerfeaturedsTP (17:20417)
        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 14 * fem),
        padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 16 * fem),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // movieBiy (17:20422)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 23 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // 7sX (77710604)
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 9 * fem),
                    width: double.infinity,
                    height: 334 * fem,
                    child: Container(
                      // bannerfPF (17:20423)
                      padding: EdgeInsets.fromLTRB(
                          26 * fem, 16 * fem, 17 * fem, 11 * fem),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://funylife.in/wp-content/uploads/2023/04/60_Cute-Girl-Pic-WWW.FUNYLIFE.IN_-1-1024x1024.jpg"),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment(0, -1),
                          end: Alignment(0, 1),
                          colors: <Color>[
                            Color(0x33ffffff),
                            Color(0x00ffffff),
                            Color(0xffffffff)
                          ],
                          stops: <double>[0, 0.74, 1],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // playerindicatorUrV (17:20892)
                            margin: EdgeInsets.fromLTRB(
                                304 * fem, 0 * fem, 0 * fem, 270 * fem),
                            width: double.infinity,
                            height: 8 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30 * fem),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // rectangle5419zK3 (17:20893)
                                  width: 4 * fem,
                                  height: 8 * fem,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(30 * fem),
                                    color: Color(0xff048bf8),
                                  ),
                                ),
                                Container(
                                  // autogroupkxyq8AM (3kojceVLKxV69RhHjUKxYq)
                                  padding: EdgeInsets.fromLTRB(
                                      8 * fem, 2 * fem, 0 * fem, 2 * fem),
                                  height: double.infinity,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // rectangle5420qqT (17:20894)
                                        margin: EdgeInsets.fromLTRB(
                                            0 * fem, 0 * fem, 8 * fem, 0 * fem),
                                        width: 4 * fem,
                                        height: 4 * fem,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30 * fem),
                                          color: Color(0x4c000000),
                                        ),
                                      ),
                                      Container(
                                        // rectangle5421xv5 (17:20895)
                                        width: 4 * fem,
                                        height: 4 * fem,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30 * fem),
                                          color: Color(0x4c000000),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // Jyw (17:20446)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 173 * fem, 0 * fem),
                            child: Text('侠盗一号：星球大战故事',
                                style: GoogleFonts.zenKakuGothicNew(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffffffff),
                                    height: 1.4)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // autogroupnyb7Dr1 (3kojGpj2nk4cwAie1yNyB7)
                    margin: EdgeInsets.fromLTRB(
                        25.33 * fem, 0 * fem, 0 * fem, 0 * fem),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // movieinfo8xy (17:20426)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 2 * fem, 22 * fem, 0 * fem),
                          height: 20 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // ratingFnh (17:20427)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 15 * fem, 0 * fem),
                                height: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // iconlyboldstaraa5 (17:20428)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 7.33 * fem, 0 * fem),
                                      width: 13.33 * fem,
                                      height: 12.67 * fem,
                                      child: const Icon(
                                        Icons.star_rate_rounded,
                                        size: 14,
                                        color: Color(0xffffbb38),
                                      ),
                                    ),
                                    Text(
                                        // frR (17:20429)
                                        '8.4',
                                        style: GoogleFonts.zenKakuGothicNew(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xffffbb38),
                                            height: 1.4)),
                                  ],
                                ),
                              ),
                              Text(
                                  // durationcFs (17:20430)
                                  '2016',
                                  style: GoogleFonts.zenKakuGothicNew(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff757575),
                                      height: 1.4)),
                            ],
                          ),
                        ),
                        Container(
                          // ZB7 (17:20447)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 27 * fem, 0 * fem),
                          child: Text('01小时54分',
                              style: GoogleFonts.zenKakuGothicNew(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff757575),
                                  height: 1.4)),
                        ),
                        Container(
                          // HN1 (17:20448)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 26 * fem, 0 * fem),
                          child: Text('动作',
                              style: GoogleFonts.zenKakuGothicNew(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff757575),
                                  height: 1.4)),
                        ),
                        Text(
                            // QxR (17:20449)
                            '剧情',
                            style: GoogleFonts.zenKakuGothicNew(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff757575),
                                height: 1.4)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(24 * fem, 0 * fem, 24 * fem, 0 * fem),
              height: 48 * fem,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4 * fem),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // cardhgd (17:20421)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 10 * fem, 0 * fem),
                    padding: EdgeInsets.fromLTRB(
                        88.5 * fem, 12 * fem, 111.5 * fem, 12 * fem),
                    width: 300,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xff048bf8),
                      borderRadius: BorderRadius.circular(4 * fem),
                    ),
                    child: GestureDetector(
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                // iconlyboldplayy8M (I17:20421;15:1183)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 10 * fem, 0 * fem),
                                width: 20 * fem,
                                height: 20 * fem,
                                child: const Icon(
                                  Icons.play_circle_fill_rounded,
                                  size: 20,
                                  color: Color(0xffffffff),
                                )),
                            Text('立即观看',
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffffffff),
                                    height: 1.5)),
                          ],
                        ),
                      ),
                      onTap: () {
                        log("play");
                        if (widget.play != null) {
                          widget.play!();
                        }
                      },
                    ),
                  ),
                  GestureDetector(
                    child: SizedBox(
                        width: 15.5 * fem,
                        height: 19.22 * fem,
                        child: const Icon(
                          Icons.favorite,
                          size: 22,
                          color: Color(0xffC2C2C2),
                        )),
                    onTap: () {
                      if (widget.favor != null) {
                        widget.favor!();
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
