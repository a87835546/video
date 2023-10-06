import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:video/app_singleton.dart';
import 'package:video/mine/login_page.dart';
import 'package:video/mine/logout_page.dart';

class MineTmpPage extends StatefulWidget {
  const MineTmpPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return MineTmpPageState();
  }
}

class MineTmpPageState extends State<MineTmpPage> {
  final StreamController<bool> _streamController = StreamController<bool>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final val = context.watch<ReloadModel>().refresh;
    log("val ---->>> $val");
    if (val == true) {
      AppSingleton.getInstance().userModel = null;
    }
    log("user model  --->>> ${AppSingleton.getInstance().userModel}");
    return AppSingleton.getInstance().userModel == null ||
            AppSingleton.getInstance().userModel?.id == 0
        ? LoginPage()
        : LogoutPage();
  }
}

class ReloadModel with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  bool _refresh = false;
  bool get refresh => _refresh;
  int get count => _count;
  reload(bool val) {
    _refresh = val;
    log("refresh value $val");
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}

class SwitchThemeModel with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  bool _refresh = false;
  bool get refresh => _refresh;
  int get count => _count;
  reload(bool val) {
    _refresh = val;
    log("refresh value $val");
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}
