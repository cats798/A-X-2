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
import 'package:anymex/l10n/app_localizations.dart';

class SettingsModeration extends StatefulWidget {
  const SettingsModeration({super.key});

  @override
  State<SettingsModeration> createState() => _SettingsModerationState();
}

class _SettingsModerationState extends State<SettingsModeration> {
  final commentumService = Get.find<CommentumService>();
  final RxList<Map<String, dynamic>> moderationQueue = <Map<String, dynamic>>[].obs;
  final RxBool isLoadingQueue = false.obs;

  @override
  void initState() {
    super.initState();
    _loadModerationQueue();
  }

  Future<void> _loadModerationQueue() async {
    if (!await commentumService.isModerator()) {
      return;
    }

    isLoadingQueue.value = true;
    try {
      final queue = await commentumService.getModerationQueue();
      moderationQueue.assignAll(queue);
    } catch (e) {
      print('Error loading moderation queue: $e');
    } finally {
      isLoadingQueue.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: SuperListView(
        padding: getResponsiveValue(context,
            mobileValue: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 20.0),
            desktopValue: const EdgeInsets.fromLTRB(20.0, 50.0, 25.0, 20.0)),
        children: [
          Row(
            children: [
              const CustomBackButton(),
              const SizedBox(width: 10),
              Text(l10n.moderationPanel,  // 已存在键
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ],
          ),
          const SizedBox(height: 30),
          
          // User Role Display
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context)
                    .colorScheme
                    .surfaceContainer
                    .opaque(0.3)),
            child: Column(
              children: [
                Obx(() => CustomTile(
                  icon: Icons.admin_panel_settings,
                  title: l10n.yourRole,  // 新增键 'yourRole'
                  description: commentumService.currentUserRole.value.toUpperCase(),
                  postFix: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: _getRoleColor(),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      commentumService.currentUserRole.value.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                )),
              ],
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Moderation Actions
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
                    icon: Icons.report_outlined,
                    title: l10n.moderationQueue,  // 新增键 'moderationQueue'
                    description: "${moderationQueue.length} ${l10n.pendingReports}",  // 新增键 'pendingReports'
                    postFix: isLoadingQueue.value 
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : null,
                    onTap: () {
                      _navigateToModerationQueue(l10n);
                    }),
                CustomTile(
                    icon: Icons.people_outline,
                    title: l10n.userManagement,  // 新增键 'userManagement'
                    description: l10n.userManagementDesc,  // 新增键 'userManagementDesc'
                    onTap: () {
                      _navigateToUserManagement(l10n);
                    }),
                CustomTile(
                    icon: Icons.history_outlined,
                    title: l10n.moderationHistory,  // 新增键 'moderationHistory'
                    description: l10n.moderationHistoryDesc,  // 新增键 'moderationHistoryDesc'
                    onTap: () {
                      _showModerationHistory(l10n);
                    }),
              ],
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Quick Actions
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
                    icon: Icons.search_outlined,
                    title: l10n.searchUser,  // 新增键 'searchUser'
                    description: l10n.searchUserDesc,  // 新增键 'searchUserDesc'
                    onTap: () {
                      _showUserSearch(l10n);
                    }),
                CustomTile(
                    icon: Icons.content_paste_search_outlined,
                    title: l10n.searchComments,  // 新增键 'searchComments'
                    description: l10n.searchCommentsDesc,  // 新增键 'searchCommentsDesc'
                    onTap: () {
                      _showCommentSearch(l10n);
                    }),
                CustomTile(
                    icon: Icons.analytics_outlined,
                    title: l10n.statistics,  // 已有键 'statistics'
                    description: l10n.statisticsDesc,  // 新增键 'statisticsDesc'
                    onTap: () {
                      _showStatistics(l10n);
                    }),
              ],
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Settings
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
                    icon: Icons.notifications_outlined,
                    title: l10n.notificationSettings,
                    description: l10n.moderationNotifDesc,  // 新增键 'moderationNotifDesc'
                    onTap: () {
                      _showNotificationSettings(l10n);
                    }),
                CustomTile(
                    icon: Icons.rule_outlined,
                    title: l10n.moderationRules,  // 新增键 'moderationRules'
                    description: l10n.moderationRulesDesc,  // 新增键 'moderationRulesDesc'
                    onTap: () {
                      _showModerationRules(l10n);
                    }),
              ],
            ),
          ),
          
          30.height(),
        ],
      ),
    );
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

  Future<void> _navigateToModerationQueue(AppLocalizations l10n) async {
    if (!await commentumService.isModerator()) {
      snackBar(l10n.noModeratorPermission);
      return;
    }
    snackBar(l10n.moderationQueueComingSoon);
  }

  Future<void> _navigateToUserManagement(AppLocalizations l10n) async {
    if (!await commentumService.isAdmin()) {
      snackBar(l10n.noAdminPermission);
      return;
    }
    snackBar(l10n.userManagementComingSoon);
  }

  Future<void> _showModerationHistory(AppLocalizations l10n) async {
    if (!await commentumService.isModerator()) {
      snackBar(l10n.noModeratorPermission);
      return;
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.moderationHistory),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.modHistoryFuture),
            const SizedBox(height: 8),
            Text(l10n.plannedFeatures, style: const TextStyle(fontWeight: FontWeight.bold)),
            BulletPoint(text: l10n.filterActionType),
            BulletPoint(text: l10n.filterDateRange),
            BulletPoint(text: l10n.filterModerator),
            BulletPoint(text: l10n.exportLogs),
            BulletPoint(text: l10n.appealSystem),
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

  Future<void> _showUserSearch(AppLocalizations l10n) async {
    if (!await commentumService.isModerator()) {
      snackBar(l10n.noModeratorPermission);
      return;
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.searchUser),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.userSearchFuture),
            const SizedBox(height: 8),
            Text(l10n.plannedFeatures, style: const TextStyle(fontWeight: FontWeight.bold)),
            BulletPoint(text: l10n.searchByUsername),
            BulletPoint(text: l10n.searchByUserId),
            BulletPoint(text: l10n.searchByCommentHistory),
            BulletPoint(text: l10n.advancedFiltering),
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

  Future<void> _showCommentSearch(AppLocalizations l10n) async {
    if (!await commentumService.isModerator()) {
      snackBar(l10n.noModeratorPermission);
      return;
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.searchComments),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.commentSearchFuture),
            const SizedBox(height: 8),
            Text(l10n.plannedFeatures, style: const TextStyle(fontWeight: FontWeight.bold)),
            BulletPoint(text: l10n.searchByContent),
            BulletPoint(text: l10n.searchByUsername),
            BulletPoint(text: l10n.searchByDateRange),
            BulletPoint(text: l10n.searchByReportStatus),
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

  Future<void> _showStatistics(AppLocalizations l10n) async {
    if (!await commentumService.isModerator()) {
      snackBar(l10n.noModeratorPermission);
      return;
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.statistics),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.statisticsFuture),
            const SizedBox(height: 8),
            Text(l10n.plannedMetrics, style: const TextStyle(fontWeight: FontWeight.bold)),
            BulletPoint(text: l10n.reportsResolved),
            BulletPoint(text: l10n.usersWarnedBanned),
            BulletPoint(text: l10n.commentsModerated),
            BulletPoint(text: l10n.responseTimes),
            BulletPoint(text: l10n.trendsAnalytics),
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

  Future<void> _showNotificationSettings(AppLocalizations l10n) async {
    if (!await commentumService.isModerator()) {
      snackBar(l10n.noModeratorPermission);
      return;
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.notificationSettings),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.modNotifFuture),
            const SizedBox(height: 8),
            Text(l10n.plannedNotifications, style: const TextStyle(fontWeight: FontWeight.bold)),
            BulletPoint(text: l10n.newReports),
            BulletPoint(text: l10n.reportResolutions),
            BulletPoint(text: l10n.userAppeals),
            BulletPoint(text: l10n.systemAlerts),
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

  Future<void> _showModerationRules(AppLocalizations l10n) async {
    if (!await commentumService.isAdmin()) {
      snackBar(l10n.noAdminPermission);
      return;
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.moderationRules),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.modRulesFuture),
            const SizedBox(height: 8),
            Text(l10n.plannedFeatures, style: const TextStyle(fontWeight: FontWeight.bold)),
            BulletPoint(text: l10n.customBannedKeywords),
            BulletPoint(text: l10n.autoModThresholds),
            BulletPoint(text: l10n.rolePermissions),
            BulletPoint(text: l10n.contentFilteringRules),
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