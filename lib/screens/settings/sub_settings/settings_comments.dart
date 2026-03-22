import 'package:anymex/services/commentum_service.dart';
import 'package:anymex/utils/function.dart';
import 'package:anymex/widgets/common/custom_tiles.dart';
import 'package:anymex/widgets/non_widgets/snackbar.dart';
import 'package:anymex/screens/settings/settings.dart';
import 'package:anymex/widgets/helper/platform_builder.dart';
import 'package:flutter/material.dart';
import 'package:anymex/utils/theme_extensions.dart';
import 'package:get/get.dart';
import 'package:super_sliver_list/super_sliver_list.dart';
import 'package:anymex/screens/other_features.dart';
import 'package:anymex/l10n/app_localizations.dart';  // 添加导入

import 'settings_moderation.dart';

class SettingsComments extends StatefulWidget {
  const SettingsComments({super.key});

  @override
  State<SettingsComments> createState() => _SettingsCommentsState();
}

class _SettingsCommentsState extends State<SettingsComments> {
  final commentumService = Get.find<CommentumService>();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;  // 获取本地化实例
    return Scaffold(
        body: Column(
      children: [
        const NestedHeader(title: 'Comment System'),  // 此标题由外部组件控制，暂不处理
        Expanded(
          child: SuperListView(
            padding: getResponsiveValue(context,
                mobileValue: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
                desktopValue:
                    const EdgeInsets.fromLTRB(20.0, 20.0, 25.0, 20.0)),
            children: [
              Row(
                children: [
                  const CustomBackButton(),
                  const SizedBox(width: 10),
                  Text(l10n.commentSystem,   // 新增键 'commentSystem'
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context)
                        .colorScheme
                        .surfaceContainer
                        .opaque(0.3)),
                child: Column(
                  children: [
                    CustomTile(
                        icon: Icons.info_outline,
                        title: l10n.aboutCommentum,  // 新增键 'aboutCommentum'
                        description: l10n.aboutCommentumDesc,  // 新增键 'aboutCommentumDesc'
                        onTap: () {
                          _showAboutDialog(l10n);
                        }),
                    CustomTile(
                        icon: Icons.person_outline,
                        title: l10n.userRole,  // 新增键 'userRole'
                        description: _getCurrentRoleDescription(l10n),
                        postFix: Obx(() => Text(
                              commentumService.currentUserRole.value
                                  .toUpperCase(),
                              style: TextStyle(
                                color: _getRoleColor(),
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        onTap: () {
                          _showRoleInfo(l10n);
                        }),
                    const Divider(height: 1),
                    CustomTile(
                        icon: Icons.admin_panel_settings,
                        title: l10n.moderationPanel,  // 新增键 'moderationPanel'
                        description: l10n.moderationPanelDesc,  // 新增键 'moderationPanelDesc'
                        onTap: () {
                          navigate(() => const SettingsModeration());
                        }),
                    CustomTile(
                        icon: Icons.report_outlined,
                        title: l10n.reportedComments,  // 新增键 'reportedComments'
                        description: l10n.reportedCommentsDesc,  // 新增键 'reportedCommentsDesc'
                        onTap: () {
                          _navigateToReportsPanel(l10n);
                        }),
                    const Divider(height: 1),
                    CustomTile(
                        icon: Icons.settings_outlined,
                        title: l10n.commentPreferences,  // 新增键 'commentPreferences'
                        description: l10n.commentPreferencesDesc,  // 新增键 'commentPreferencesDesc'
                        onTap: () {
                          _showCommentPreferences(l10n);
                        }),
                    CustomTile(
                        icon: Icons.notifications_outlined,
                        title: l10n.notificationSettings,  // 新增键 'notificationSettings'
                        description: l10n.notificationSettingsDesc,  // 新增键 'notificationSettingsDesc'
                        onTap: () {
                          _showNotificationSettings(l10n);
                        }),
                    const Divider(height: 1),
                    CustomTile(
                        icon: Icons.help_outline,
                        title: l10n.helpAndSupport,  // 新增键 'helpAndSupport'
                        description: l10n.helpAndSupportDesc,  // 新增键 'helpAndSupportDesc'
                        onTap: () {
                          _showHelpDialog(l10n);
                        }),
                    CustomTile(
                        icon: Icons.privacy_tip_outlined,
                        title: l10n.privacyAndSafety,  // 新增键 'privacyAndSafety'
                        description: l10n.privacyAndSafetyDesc,  // 新增键 'privacyAndSafetyDesc'
                        onTap: () {
                          _showPrivacyDialog(l10n);
                        }),
                  ],
                ),
              ),
              30.height(),
            ],
          ),
        )
      ],
    ));
  }

  String _getCurrentRoleDescription(AppLocalizations l10n) {
    final role = commentumService.currentUserRole.value;
    switch (role) {
      case 'super_admin':
        return l10n.superAdminDesc;  // 新增键 'superAdminDesc'
      case 'admin':
        return l10n.adminDesc;       // 新增键 'adminDesc'
      case 'moderator':
        return l10n.moderatorDesc;   // 新增键 'moderatorDesc'
      default:
        return l10n.userDesc;        // 新增键 'userDesc'
    }
  }

  Color _getRoleColor() {
    final role = commentumService.currentUserRole.value;
    switch (role) {
      case 'super_admin':
        return Colors.red;
      case 'admin':
        return Colors.orange;
      case 'moderator':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  void _showAboutDialog(AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.aboutCommentum),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.commentumFeatures, style: const TextStyle(fontWeight: FontWeight.bold)),  // 新增键 'commentumFeatures'
            const SizedBox(height: 8),
            BulletPoint(text: l10n.feature1),   // 新增键 'feature1'~'feature6'
            BulletPoint(text: l10n.feature2),
            BulletPoint(text: l10n.feature3),
            BulletPoint(text: l10n.feature4),
            BulletPoint(text: l10n.feature5),
            BulletPoint(text: l10n.feature6),
            const SizedBox(height: 8),
            Text('Base URL: https://whzwmfxngelicmjyxwmr.supabase.co'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.close),
          ),
        ],
      ),
    );
  }

  void _showRoleInfo(AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.userRolesPermissions),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.currentRolePermissions, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            RoleDescription(
              role: 'User',
              permissions: l10n.userPermissions.split('\n'),  // 使用换行分割字符串
            ),
            const SizedBox(height: 8),
            RoleDescription(
              role: 'Moderator',
              permissions: l10n.moderatorPermissions.split('\n'),
            ),
            const SizedBox(height: 8),
            RoleDescription(
              role: 'Admin',
              permissions: l10n.adminPermissions.split('\n'),
            ),
            const SizedBox(height: 8),
            RoleDescription(
              role: 'Super Admin',
              permissions: l10n.superAdminPermissions.split('\n'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.close),
          ),
        ],
      ),
    );
  }

  void _navigateToModerationPanel(AppLocalizations l10n) {
    // Check if user has moderation permissions
    if (commentumService.currentUserRole.value == 'user') {
      snackBar(l10n.noModeratorPermission);
      return;
    }
    // Navigate to moderation panel (to be implemented)
    snackBar(l10n.moderationPanelComingSoon);
  }

  void _navigateToReportsPanel(AppLocalizations l10n) {
    if (commentumService.currentUserRole.value == 'user') {
      snackBar(l10n.noModeratorPermission);
      return;
    }
    snackBar(l10n.reportsPanelComingSoon);
  }

  void _showCommentPreferences(AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.commentPreferences),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.commentPrefFuture),
            const SizedBox(height: 8),
            Text(l10n.plannedFeatures, style: const TextStyle(fontWeight: FontWeight.bold)),
            BulletPoint(text: l10n.sortDefault),
            BulletPoint(text: l10n.commentDensity),
            BulletPoint(text: l10n.showHideAvatars),
            BulletPoint(text: l10n.fontSizeAdjust),
            BulletPoint(text: l10n.autoPlayVideos),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.close),
          ),
        ],
      ),
    );
  }

  void _showNotificationSettings(AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.notificationSettings),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.notificationFuture),
            const SizedBox(height: 8),
            Text(l10n.plannedFeatures, style: const TextStyle(fontWeight: FontWeight.bold)),
            BulletPoint(text: l10n.notifReplies),
            BulletPoint(text: l10n.notifMentions),
            BulletPoint(text: l10n.notifModeration),
            BulletPoint(text: l10n.notifReportResolution),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.close),
          ),
        ],
      ),
    );
  }

  void _showHelpDialog(AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.helpAndSupport),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.howToUse, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            BulletPoint(text: l10n.step1),
            BulletPoint(text: l10n.step2),
            BulletPoint(text: l10n.step3),
            BulletPoint(text: l10n.step4),
            BulletPoint(text: l10n.step5),
            const SizedBox(height: 12),
            Text(l10n.needHelp, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(l10n.helpText),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.close),
          ),
        ],
      ),
    );
  }

  void _showPrivacyDialog(AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.privacyAndSafety),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.privacyImportant, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            BulletPoint(text: l10n.privacy1),
            BulletPoint(text: l10n.privacy2),
            BulletPoint(text: l10n.privacy3),
            BulletPoint(text: l10n.privacy4),
            const SizedBox(height: 12),
            Text(l10n.safetyFeatures, style: const TextStyle(fontWeight: FontWeight.bold)),
            BulletPoint(text: l10n.safety1),
            BulletPoint(text: l10n.safety2),
            BulletPoint(text: l10n.safety3),
            BulletPoint(text: l10n.safety4),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.close),
          ),
        ],
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• '),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}

class RoleDescription extends StatelessWidget {
  final String role;
  final List<String> permissions;

  const RoleDescription(
      {super.key, required this.role, required this.permissions});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainer,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(role, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          ...permissions.map((permission) => Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 2.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• '),
                    Expanded(
                        child: Text(permission,
                            style: const TextStyle(fontSize: 12))),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}