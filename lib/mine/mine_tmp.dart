import 'package:flutter/cupertino.dart';
import 'package:video/app_singleton.dart';
import 'package:video/mine/login_page.dart';
import 'package:video/mine/logout_page.dart';
import 'package:video/mine/mine_info_page.dart';

class MineTmpPage extends StatefulWidget {
  const MineTmpPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MineTmpPageState();
  }
}

class _MineTmpPageState extends State<MineTmpPage> {
  @override
  Widget build(BuildContext context) {
    return AppSingleton.getInstance().userModel?.id != 0
        ? LogoutPage()
        : LoginPage();
  }
}
