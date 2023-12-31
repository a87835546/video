import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/video_model.dart';
import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';

class HomeRateWidget extends StatefulWidget {
  final VideoModel? model;
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
    return Row(
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
                      child: Icon(
                        Icons.star_rate_rounded,
                        size: 14,
                        color: theme.colorScheme.errorContainer,
                      ),
                    ),
                    Text(widget.model?.rate ?? "1.0",
                        style: theme.textTheme.titleSmall),
                  ],
                ),
              ),
              Text(
                '${widget.model?.years}',
                style: CustomTextStyles.bodyMediumGray600,
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 27 * fem, 2 * fem),
          child: Text(
            "1h20m",
            style: CustomTextStyles.bodyMediumGray600,
          ),
        ),
        Visibility(
          visible: widget.hiddenType != true,
          child: Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 26 * fem, 2 * fem),
              child: Text(
                widget.model?.types ?? '动作  剧情',
                style: CustomTextStyles.bodyMediumGray600,
              )),
        )
      ],
    );
  }
}
