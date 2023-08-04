import 'package:flutter/cupertino.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeBannerState();
  }
}

class HomeBannerState extends State<HomeBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: Text("热门电影"),
              ),
              Container(
                child: Text("更多"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
