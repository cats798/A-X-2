import 'package:anymex/controllers/service_handler/service_handler.dart';
import 'package:anymex/controllers/settings/settings.dart';
import 'package:anymex/database/data_keys/keys.dart';
import 'package:anymex/widgets/common/custom_tiles.dart';
import 'package:anymex/widgets/common/glow.dart';
import 'package:anymex/widgets/custom_widgets/custom_expansion_tile.dart';
import 'package:anymex/widgets/helper/platform_builder.dart';
import 'package:flutter/material.dart';
import 'package:anymex/utils/theme_extensions.dart';
import 'package:get/get.dart';
import 'package:super_sliver_list/super_sliver_list.dart';
import 'package:anymex/screens/other_features.dart';
import 'package:anymex/l10n/app_localizations.dart'; // 添加本地化导入

class SettingsCommon extends StatefulWidget {
  const SettingsCommon({super.key});

  @override
  State<SettingsCommon> createState() => _SettingsCommonState();
}

class _SettingsCommonState extends State<SettingsCommon> {
  final settings = Get.find<Settings>();
  late bool uniScrapper;
  late bool shouldAskForPermission = General.shouldAskForTrack.get<bool>(true);
  late bool hideAdultContent = General.hideAdultContent.get<bool>(true);
  bool get isMal => serviceHandler.serviceType.value.isMal;
  late Map<String, bool> homePageCards;

  @override
  void initState() {
    super.initState();
    uniScrapper = General.universalScrapper.get<bool>(false);
    homePageCards = isMal ? settings.homePageCardsMal : settings.homePageCards;
    homePageCards.putIfAbsent('Recommended Animes', () => true);
    homePageCards.putIfAbsent('Recommended Mangas', () => true);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!; // 获取本地化实例

    return Glow(
      child: Scaffold(
        body: Column(
          children: [
            NestedHeader(title: l10n.common), // 替换
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: getResponsiveValue(context,
                      mobileValue:
                          const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
                      desktopValue:
                          const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnymexExpansionTile(
                        initialExpanded: true,
                        title: l10n.universal, // 替换
                        content: Column(
                          children: [
                            CustomSwitchTile(
                                icon: Icons.touch_app_rounded,
                                title: l10n.askForTrackingPermission, // 替换
                                description:
                                    l10n.askForTrackingPermissionDesc, // 替换
                                switchValue: shouldAskForPermission,
                                onChanged: (e) {
                                  setState(() {
                                    shouldAskForPermission = e;
                                    General.shouldAskForTrack.set(e);
                                  });
                                }),
                            CustomSwitchTile(
                                icon: Icons.play_disabled_rounded,
                                title: l10n.hideAdultContent, // 替换
                                description:
                                    l10n.hideAdultContentDesc, // 替换
                                switchValue: hideAdultContent,
                                onChanged: (e) {
                                  setState(() {
                                    hideAdultContent = e;
                                    General.hideAdultContent.set(e);
                                  });
                                }),
                            Obx(
                              () => CustomSwitchTile(
                                icon: Icons.play_circle_fill_rounded,
                                title: l10n.showContinueWatchingCard, // 替换
                                description:
                                    l10n.showContinueWatchingCardDesc, // 替换
                                switchValue: settings.showContinueWatchingCard,
                                onChanged: (e) =>
                                    settings.showContinueWatchingCard = e,
                              ),
                            ),
                          ],
                        ),
                      ),
                      AnymexExpansionTile(
                          initialExpanded: true,
                          title: l10n.anilist, // 替换
                          content: CustomTile(
                            icon: Icons.format_list_bulleted_sharp,
                            title: l10n.manageAnilistLists, // 替换
                            description:
                                l10n.chooseListToShowOnHome, // 替换
                            onTap: () => _showHomePageCardsDialog(),
                          )),
                      AnymexExpansionTile(
                          initialExpanded: true,
                          title: l10n.myAnimeList, // 替换
                          content: CustomTile(
                            icon: Icons.format_list_bulleted_sharp,
                            title: l10n.manageMyAnimeListLists, // 替换
                            description:
                                l10n.chooseListToShowOnHome, // 替换
                            onTap: () => _showHomePageCardsDialog(),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showHomePageCardsDialog() {
    final l10n = AppLocalizations.of(context)!; // 在 dialog 中获取实例

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(l10n.manageHomePageCards), // 替换
          content: SizedBox(
            width: double.maxFinite,
            child: Obx(() {
              final homePageCards =
                  isMal ? settings.homePageCardsMal : settings.homePageCards;
              return SuperListView.builder(
                shrinkWrap: true,
                itemCount: homePageCards.length,
                itemBuilder: (context, index) {
                  final key = homePageCards.keys.elementAt(index);
                  final value = homePageCards[key]!;

                  return CheckboxListTile(
                    title: Text(key),
                    value: value,
                    onChanged: (bool? newValue) {
                      if (newValue != null) {
                        isMal
                            ? settings.updateHomePageCardMal(key, newValue)
                            : settings.updateHomePageCard(key, newValue);
                      }
                    },
                  );
                },
              );
            }),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.close), // 替换
            ),
          ],
        );
      },
    );
  }
}