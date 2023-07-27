import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_care/setting/gallery/android_settings_screen.dart';
import 'package:pets_care/setting/gallery/cross_platform_settings_screen.dart';
import 'package:pets_care/setting/gallery/ios_developer_screen.dart';
import 'package:pets_care/setting/gallery/web_chrome_settings.dart';
import 'package:pets_care/utils/navigation.dart';
import 'package:settings_ui/settings_ui.dart';

import '../generated/l10n.dart';
import 'changge_language.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MinePageState();
  }
}

class _MinePageState extends State<MinePage> {
  bool model = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.minePage),
      ),
      body: Container(
        child: SettingsList(
          sections: [
            SettingsSection(
              title: Text(S.current.general),
              tiles: [
                SettingsTile.navigation(
                  title: Text(S.of(context).language),
                  value: Text('English'),
                  leading: Icon(CupertinoIcons.globe),
                  description:
                      Text('UI created to show plugin\'s possibilities'),
                  onPressed: (context) {
                    Navigation.navigateTo(
                      context: context,
                      screen: const ChangeLanguagePage(),
                      style: NavigationRouteStyle.cupertino,
                    );
                  },
                ),
                SettingsTile.switchTile(
                    leading: const Icon(CupertinoIcons.globe),
                    initialValue: model,
                    onToggle: (v) {
                      setState(() {
                        model = v;
                      });
                    },
                    title: Text("Auto Theme")),
                SettingsTile.navigation(
                  title: Text('Abstract settings screen'),
                  leading: Icon(CupertinoIcons.wrench),
                  description:
                      Text('UI created to show plugin\'s possibilities'),
                  onPressed: (context) {
                    Navigation.navigateTo(
                      context: context,
                      screen: CrossPlatformSettingsScreen(),
                      style: NavigationRouteStyle.material,
                    );
                  },
                ),
              ],
            ),
            SettingsSection(
              title: Text('Replications'),
              tiles: [
                SettingsTile.navigation(
                  leading: Icon(CupertinoIcons.settings),
                  title: Text('iOS Developer Screen'),
                  onPressed: (context) {
                    Navigation.navigateTo(
                      context: context,
                      screen: IosDeveloperScreen(),
                      style: NavigationRouteStyle.cupertino,
                    );
                  },
                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.settings),
                  title: Text('Android Settings Screen'),
                  onPressed: (context) {
                    Navigation.navigateTo(
                      context: context,
                      screen: AndroidSettingsScreen(),
                      style: NavigationRouteStyle.material,
                    );
                  },
                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.web),
                  title: Text('Web Settings'),
                  onPressed: (context) {
                    Navigation.navigateTo(
                      context: context,
                      screen: WebChromeSettings(),
                      style: NavigationRouteStyle.material,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}