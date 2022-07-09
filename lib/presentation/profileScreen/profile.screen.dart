import 'package:flutter/material.dart';
import 'package:linkit/app/constants/app.assets.dart';
import 'package:linkit/app/constants/app.colors.dart';
import 'package:linkit/app/constants/app.social.links.dart';
import 'package:linkit/core/notifiers/theme.notifier.dart';
import 'package:linkit/presentation/profileScreen/widgets/icon.style.dart';
import 'package:linkit/presentation/profileScreen/widgets/profile.item.dart';
import 'package:linkit/presentation/profileScreen/widgets/profile.user.card.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier =
        Provider.of<ThemeNotifier>(context, listen: true);
    var themeFlag = themeNotifier.darkTheme;
    return Scaffold(
      backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            ProfileUserCard(
              cardColor: AppColors.rawSienna,
              userName: 'Dev Adnani',
              userProfileUrl: AppSocialLinks.profileUrl,
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, top: 5, bottom: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                "Social's",
                style: TextStyle(
                  color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SettingsItem(
              onTap: () {
                themeNotifier.toggleTheme();
              },
              icons: AppAssets.moon,
              iconStyle: IconStyle(
                iconsColor: Colors.white,
                withBackground: false,
              ),
              title: 'Dark mode',
              subtitle: "Change Theme",
              trailing: Switch.adaptive(
                value: themeNotifier.darkTheme,
                onChanged: (value) {
                  themeNotifier.darkTheme = !value;
                  themeNotifier.toggleTheme();
                },
              ),
              themeFlag: themeFlag,
            ),
            SettingsItem(
              icons: AppAssets.linkedin,
              themeFlag: themeFlag,
              onTap: () async {
                final Uri url = Uri.parse(AppSocialLinks.linkedin);
                await launchUrl(url);
              },
              iconStyle: IconStyle(
                withBackground: false,
              ),
              title: 'LinkedIn',
              subtitle: "Get Insights Of Professional Side Of Mine",
            ),
            SettingsItem(
              themeFlag: themeFlag,
              onTap: () async {
                final Uri url = Uri.parse(AppSocialLinks.youtube);
                await launchUrl(url);
              },
              icons: AppAssets.youtube,
              iconStyle: IconStyle(
                withBackground: false,
              ),
              title: 'Youtube',
              subtitle:
                  "Wanna See Backend / Flutter / Native Android Videos ? Tap Here",
            ),
            SettingsItem(
              icons: AppAssets.twitter,
              themeFlag: themeFlag,
              onTap: () async {
                final Uri url = Uri.parse(AppSocialLinks.twitter);
                await launchUrl(url);
              },
              iconStyle: IconStyle(
                withBackground: false,
              ),
              title: 'Twitter',
              subtitle: "Wanna Learn ShitPosting ? Follow Me On Twitter Then!",
            ),
            SettingsItem(
              themeFlag: themeFlag,
              onTap: () async {
                final Uri url = Uri.parse(AppSocialLinks.instagram);
                await launchUrl(url);
              },
              icons: AppAssets.instagram,
              iconStyle: IconStyle(
                withBackground: false,
              ),
              title: 'Instagram',
              subtitle: "Get Insights Of My Personal Side Of Mine",
            ),
            SettingsItem(
              onTap: () async {
                final Uri url = Uri.parse(AppSocialLinks.github);
                await launchUrl(url);
              },
              themeFlag: themeFlag,
              icons: AppAssets.github,
              iconStyle: IconStyle(
                withBackground: false,
              ),
              title: 'Github',
              subtitle: "Need Flutter/Backend Project Source Code ?",
            ),
            SettingsItem(
              icons: AppAssets.discord,
              themeFlag: themeFlag,
              onTap: () async {
                final Uri url = Uri.parse(AppSocialLinks.discord);
                await launchUrl(url);
              },
              iconStyle: IconStyle(
                withBackground: false,
              ),
              title: 'Discord',
              subtitle: "Join My Discord Server!",
            ),
            SettingsItem(
              themeFlag: themeFlag,
              onTap: () async {
                String? encodeQueryParameters(Map<String, String> params) {
                  return params.entries
                      .map((e) =>
                          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                      .join('&');
                }

                final Uri emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: AppSocialLinks.gmail,
                  query: encodeQueryParameters(
                      <String, String>{'subject': 'Hello'}),
                );

                launchUrl(emailLaunchUri);
              },
              icons: AppAssets.gmail,
              iconStyle: IconStyle(
                withBackground: false,
              ),
              title: 'Gmail',
              subtitle: "Having Any Queries Mail Me",
            ),
            SettingsItem(
              themeFlag: themeFlag,
              onTap: () async {
                final Uri url = Uri.parse(
                  AppSocialLinks.spotify,
                );
                await launchUrl(url);
              },
              icons: AppAssets.spotify,
              iconStyle: IconStyle(
                withBackground: false,
              ),
              title: 'Spotify',
              subtitle: "Check Out My Coding Playist",
            ),
          ],
        ),
      ),
    );
  }
}
