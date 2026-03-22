import 'package:anymex/screens/other_features.dart';
import 'package:anymex/screens/settings/sub_settings/settings_about.dart';
import 'package:anymex/screens/settings/sub_settings/settings_accounts.dart';
import 'package:anymex/screens/settings/sub_settings/settings_backup.dart';
import 'package:anymex/screens/settings/sub_settings/settings_common.dart';
import 'package:anymex/screens/settings/sub_settings/settings_experimental.dart';
import 'package:anymex/screens/settings/sub_settings/settings_extensions.dart';
import 'package:anymex/screens/settings/sub_settings/settings_player.dart';
import 'package:anymex/screens/settings/sub_settings/settings_reader.dart';
import 'package:anymex/screens/settings/sub_settings/settings_storage_manager.dart';
import 'package:anymex/screens/settings/sub_settings/settings_theme.dart';
import 'package:anymex/screens/settings/sub_settings/settings_ui.dart';
import 'package:anymex/utils/function.dart';
import 'package:anymex/utils/logger.dart';
import 'package:anymex/utils/theme_extensions.dart';
import 'package:anymex/widgets/common/custom_tiles.dart';
import 'package:anymex/widgets/common/glow.dart';
import 'package:anymex/widgets/helper/platform_builder.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconly/iconly.dart';
import 'package:super_sliver_list/super_sliver_list.dart';
import 'package:anymex/l10n/app_localizations.dart';  // 新增导入

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;  // 获取本地化实例
    return Glow(
        child: Scaffold(
            body: Column(children: [
      NestedHeader(title: l10n.settings),  // 替换标题
      Expanded(
          child: SuperListView(
        padding: getResponsiveValue(context,
            mobileValue: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
            desktopValue: const EdgeInsets.fromLTRB(20.0, 20.0, 25.0, 20.0)),
        children: [
          const SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color:
                    Theme.of(context).colorScheme.surfaceContainer.opaque(0.3)),
            child: Column(
              children: [
                CustomTile(
                    icon: IconlyLight.profile,
                    title: l10n.accounts,  // 替换
                    description: l10n.accountsDescription,  // 替换
                    onTap: () {
                      navigate(() => const SettingsAccounts());
                    }),
                CustomTile(
                    icon: HugeIcons.strokeRoundedBulb,
                    title: l10n.common,  // 替换
                    description: l10n.tweakSettings,  // 替换
                    onTap: () {
                      navigate(() => const SettingsCommon());
                    }),
                CustomTile(
                    icon: HugeIcons.strokeRoundedLibraries,
                    title: l10n.backupAndRestore,  // 替换
                    description: l10n.backupRestoreDescription,  // 替换
                    onTap: () {
                      navigate(() => const BackupRestorePage());
                    }),
                CustomTile(
                    icon: Icons.storage_rounded,
                    title: l10n.storageManager,  // 替换
                    description: l10n.storageManagerDescription,  // 替换
                    onTap: () {
                      navigate(() => const SettingsStorageManager());
                    }),
                CustomTile(
                    icon: HugeIcons.strokeRoundedPaintBoard,
                    title: l10n.ui,  // 替换
                    description: l10n.uiDescription,  // 替换
                    onTap: () {
                      navigate(() => const SettingsUi());
                    }),
                CustomTile(
                    icon: HugeIcons.strokeRoundedPlay,
                    title: l10n.player,  // 替换
                    description: l10n.playerDescription,  // 替换
                    onTap: () {
                      navigate(() => const SettingsPlayer());
                    }),
                CustomTile(
                    icon: Icons.menu_book_rounded,
                    title: l10n.reader,  // 替换
                    description: l10n.readerDescription,  // 替换
                    onTap: () {
                      navigate(() => const SettingsReader());
                    }),
                CustomTile(
                    icon: HugeIcons.strokeRoundedPaintBrush01,
                    title: l10n.theme,  // 替换
                    description: l10n.themeDescription,  // 替换
                    onTap: () {
                      navigate(() => const SettingsTheme());
                    }),
                const SizedBox(height: 10),
                CustomTile(
                    icon: Icons.extension_rounded,
                    title: l10n.extensions,  // 替换
                    description: l10n.extensionsDescription,  // 替换
                    onTap: () {
                      navigate(() => const SettingsExtensions());
                    }),
                const SizedBox(height: 10),
                CustomTile(
                  icon: HugeIcons.strokeRoundedInformationCircle,
                  title: l10n.experimental,  // 替换
                  description: l10n.experimentalDescription,  // 替换
                  onTap: () async {
                    navigate(() => const SettingsExperimental());
                  },
                ),
                const SizedBox(height: 10),
                CustomTile(
                  icon: HugeIcons.strokeRoundedFile01,
                  title: l10n.shareLogs,  // 替换
                  description: l10n.shareLogsDescription,  // 替换
                  onTap: () async => await Logger.share(),
                ),
                const SizedBox(height: 10),
                CustomTile(
                  icon: HugeIcons.strokeRoundedInformationCircle,
                  title: l10n.about,  // 替换
                  description: l10n.aboutDescription,  // 替换
                  onTap: () async {
                    navigate(() => const AboutPage());
                  },
                ),
              ],
            ),
          ),
          30.height(),
        ],
      )),
    ])));
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: ElevatedButton.styleFrom(
            backgroundColor:
                Theme.of(context).colorScheme.surfaceContainer.opaque(0.5)),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded));
  }
}