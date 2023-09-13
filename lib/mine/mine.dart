import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:video/home/play_info_page.dart';
import 'package:video/mine/logout_page.dart';
import 'package:video/mine/register_page.dart';

import '../generated/l10n.dart';
import '../home/home_player_in_web.dart';
import '../home/video_info_page.dart';
import '../menu/light_watchlist_one_page.dart';
import '../setting/gallery/android_settings_screen.dart';
import '../setting/gallery/cross_platform_settings_screen.dart';
import '../setting/gallery/ios_developer_screen.dart';
import '../setting/gallery/web_chrome_settings.dart';
import '../utils/navigation.dart';
import 'changge_language.dart';
import 'login_page.dart';

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
                      style: NavigationRouteStyle.cupertino,
                    );
                  },
                ),
                SettingsTile.navigation(
                  title: Text('register page'),
                  leading: Icon(CupertinoIcons.wrench),
                  onPressed: (context) {
                    Navigation.navigateTo(
                      context: context,
                      screen: RegisterPage(),
                      style: NavigationRouteStyle.cupertino,
                    );
                  },
                ),
                SettingsTile.navigation(
                  title: Text('logout page'),
                  leading: Icon(CupertinoIcons.wrench),
                  onPressed: (context) {
                    Navigation.navigateTo(
                      context: context,
                      screen: LogoutPage(),
                      style: NavigationRouteStyle.cupertino,
                    );
                  },
                ),
                SettingsTile.navigation(
                  title: Text('Login page'),
                  leading: Icon(CupertinoIcons.wrench),
                  onPressed: (context) {
                    Navigation.navigateTo(
                      context: context,
                      screen: LoginPage(),
                      style: NavigationRouteStyle.cupertino,
                    );
                  },
                ),
                SettingsTile.navigation(
                  title: Text('Player info page'),
                  leading: Icon(CupertinoIcons.wrench),
                  onPressed: (context) {
                    Navigation.navigateTo(
                      context: context,
                      screen: PlayerInfoPage(),
                      style: NavigationRouteStyle.cupertino,
                    );
                  },
                ),
                SettingsTile.navigation(
                  title: Text('Video info page'),
                  leading: Icon(CupertinoIcons.wrench),
                  onPressed: (context) {
                    Navigation.navigateTo(
                      context: context,
                      screen: VideoInfoPage(),
                      style: NavigationRouteStyle.cupertino,
                    );
                  },
                ),
                SettingsTile.navigation(
                  title: Text('Watch List page'),
                  leading: Icon(CupertinoIcons.wrench),
                  onPressed: (context) {
                    Navigation.navigateTo(
                      context: context,
                      screen: LightWatchlistOnePage(),
                      style: NavigationRouteStyle.cupertino,
                    );
                  },
                ),
                // SettingsTile.navigation(
                //   title: Text('web Player info List page'),
                //   leading: Icon(CupertinoIcons.wrench),
                //   onPressed: (context) {
                //     Navigation.navigateTo(
                //       context: context,
                //       screen: HomePlayerInWeb(
                //          model: null,
                //       ),
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
