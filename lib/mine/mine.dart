import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:video/core/app_export.dart';

import '../generated/l10n.dart';
import '../setting/gallery/android_settings_screen.dart';
import '../setting/gallery/cross_platform_settings_screen.dart';
import '../setting/gallery/ios_developer_screen.dart';
import '../setting/gallery/web_chrome_settings.dart';
import '../utils/navigation.dart';
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
        title: Text(S.current.setting),
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
                        ThemeHelper().changeTheme("dark");
                        // v == false
                        //     ? ThemeHelper().changeTheme("dark")
                        //     : ThemeHelper().changeTheme("primary");
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
                      style: NavigationRouteStyle.cupertino,
                    );
                  },
                ),
                // SettingsTile.navigation(
                //   title: Text('register page'),
                //   leading: Icon(CupertinoIcons.wrench),
                //   onPressed: (context) {
                //     Navigation.navigateTo(
                //       context: context,
                //       screen: RegisterPage(),
                //       style: NavigationRouteStyle.cupertino,
                //     );
                //   },
                // ),
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
