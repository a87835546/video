import 'package:flutter/material.dart';

import 'generated/l10n.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CommunityPageState();
  }
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.communityPage),
      ),
      body: Container(),
    );
  }
}
