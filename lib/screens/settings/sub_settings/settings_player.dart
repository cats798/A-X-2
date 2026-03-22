import 'dart:convert';
import 'dart:io';

import 'package:anymex/constants/contants.dart';
import 'package:anymex/controllers/settings/settings.dart';
import 'package:anymex/database/data_keys/keys.dart';
import 'package:anymex/screens/anime/watch/controller/player_controller.dart';
import 'package:anymex/screens/anime/watch/controls/themes/setup/media_indicator_theme_registry.dart';
import 'package:anymex/screens/anime/watch/controls/themes/setup/player_control_theme_registry.dart';
import 'package:anymex/screens/other_features.dart';
import 'package:anymex/screens/settings/sub_settings/widgets/settings_json_shared.dart';
import 'package:anymex/utils/player_core_visual_settings.dart';
import 'package:anymex/utils/subtitle_style_renderer.dart';
import 'package:anymex/utils/subtitle_translator.dart';
import 'package:anymex/utils/theme_extensions.dart';
import 'package:anymex/widgets/common/checkmark_tile.dart';
import 'package:anymex/widgets/common/custom_tiles.dart';
import 'package:anymex/widgets/common/glow.dart';
import 'package:anymex/widgets/custom_widgets/custom_expansion_tile.dart';
import 'package:anymex/widgets/custom_widgets/custom_text.dart';
import 'package:anymex/widgets/helper/platform_builder.dart';
import 'package:anymex/widgets/non_widgets/reusable_checkmark.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:super_sliver_list/super_sliver_list.dart';
// 添加本地化导入
import 'package:anymex/l10n/app_localizations.dart';

const Map<String, List<String>> fontGroups = {
  'Default': ['Default'],
  'Latin': ['Trebuchet', 'Bahnschrift', 'Tahoma', 'Anime Ace 3', 'Poppins'],
  'Japanese': ['Cinecaption'],
};

class SettingsPlayer extends StatefulWidget {
  final bool isModal;
  const SettingsPlayer({super.key, this.isModal = false});

  @override
  State<SettingsPlayer> createState() => _SettingsPlayerState();
}

class _BottomControl {
  final String id;
  final String name;
  final IconData icon;
  final String defaultPosition;

  const _BottomControl({
    required this.id,
    required this.name,
    required this.icon,
    this.defaultPosition = 'right',
  });
}

final List<_BottomControl> _bottomControls = [
  const _BottomControl(
      id: 'playlist',
      name: 'Playlist',
      icon: Symbols.playlist_play_rounded,
      defaultPosition: 'left'),
  const _BottomControl(
      id: 'shaders', name: 'Shaders', icon: Symbols.tune_rounded),
  const _BottomControl(
      id: 'subtitles', name: 'Subtitles', icon: Symbols.subtitles_rounded),
  const _BottomControl(
      id: 'server', name: 'Server', icon: Symbols.cloud_rounded),
  const _BottomControl(
      id: 'quality', name: 'Quality', icon: Symbols.high_quality_rounded),
  const _BottomControl(id: 'speed', name: 'Speed', icon: Symbols.speed_rounded),
  const _BottomControl(
      id: 'audio_track', name: 'Audio Track', icon: Symbols.music_note_rounded),
  const _BottomControl(
      id: 'orientation',
      name: 'Orientation',
      icon: Icons.screen_rotation_rounded),
  const _BottomControl(
      id: 'aspect_ratio', name: 'Aspect Ratio', icon: Symbols.fit_screen),
];

class _SettingsPlayerState extends State<SettingsPlayer> {
  final settings = Get.find<Settings>();
  RxDouble speed = 0.0.obs;
  Rx<Color> subtitleColor = Colors.white.obs;
  Rx<Color> backgroundColor = Colors.black.obs;
  Rx<Color> outlineColor = Colors.black.obs;
  final styles = ['Regular', 'Accent', 'Blurred Accent'];
  final selectedStyleIndex = 0.obs;

  late List<String> _leftButtonIds;
  late List<String> _rightButtonIds;
  late List<String> _hiddenButtonIds;
  late Map<String, dynamic> _buttonConfigs;
  bool _shouldApplyResizeModeOnClose = false;

  @override
  void initState() {
    super.initState();
    speed.value = settings.speed;
    selectedStyleIndex.value = settings.playerStyle;

    _leftButtonIds = [];
    _rightButtonIds = [];
    _hiddenButtonIds = [];
    _buttonConfigs = {};

    final String jsonString =
        PlayerUiKeys.bottomControlsSettings.get<String>('{}');
    final Map<String, dynamic> decodedConfig = json.decode(jsonString);

    if (decodedConfig.isEmpty) _initializeDefaultButtonLayout();

    _leftButtonIds = List<String>.from(decodedConfig['leftButtonIds'] ?? []);
    _rightButtonIds = List<String>.from(decodedConfig['rightButtonIds'] ?? []);
    _hiddenButtonIds =
        List<String>.from(decodedConfig['hiddenButtonIds'] ?? []);
    _buttonConfigs =
        Map<String, dynamic>.from(decodedConfig['buttonConfigs'] ?? {});

    if (_leftButtonIds.isEmpty &&
        _rightButtonIds.isEmpty &&
        _hiddenButtonIds.isEmpty &&
        _bottomControls.isNotEmpty) {
      _initializeDefaultButtonLayout();
    } else {
      _pruneRemovedButtons();
    }
  }

  void _saveButtonConfig() {
    final Map<String, dynamic> configToSave = {
      'leftButtonIds': _leftButtonIds,
      'rightButtonIds': _rightButtonIds,
      'hiddenButtonIds': _hiddenButtonIds,
      'buttonConfigs': _buttonConfigs,
    };
    PlayerUiKeys.bottomControlsSettings.set(json.encode(configToSave));
    if (mounted) {
      setState(() {});
    }
  }

  void _initializeDefaultButtonLayout() {
    _leftButtonIds = [];
    _rightButtonIds = [];
    _hiddenButtonIds = [];
    _buttonConfigs = {};
    for (final control in _bottomControls) {
      if (control.defaultPosition == 'left') {
        _leftButtonIds.add(control.id);
      } else {
        _rightButtonIds.add(control.id);
      }
      _buttonConfigs[control.id] = {'visible': true};
    }
    _saveButtonConfig();
  }

  void _pruneRemovedButtons() {
    final allKnownIds = _bottomControls.map((c) => c.id).toSet();
    bool changed = false;

    int initialLeftCount = _leftButtonIds.length;
    _leftButtonIds.removeWhere((id) => !allKnownIds.contains(id));
    if (_leftButtonIds.length != initialLeftCount) changed = true;

    int initialRightCount = _rightButtonIds.length;
    _rightButtonIds.removeWhere((id) => !allKnownIds.contains(id));
    if (_rightButtonIds.length != initialRightCount) changed = true;

    int initialHiddenCount = _hiddenButtonIds.length;
    _hiddenButtonIds.removeWhere((id) => !allKnownIds.contains(id));
    if (_hiddenButtonIds.length != initialHiddenCount) changed = true;

    int initialConfigCount = _buttonConfigs.length;
    _buttonConfigs.removeWhere((id, _) => !allKnownIds.contains(id));
    if (_buttonConfigs.length != initialConfigCount) changed = true;

    if (changed) _saveButtonConfig();
  }

  void _hideButton(String id) {
    _leftButtonIds.remove(id);
    _rightButtonIds.remove(id);
    if (!_hiddenButtonIds.contains(id)) {
      _hiddenButtonIds.add(id);
    }
    _saveButtonConfig();
  }

  void _showButton(String id, String position) {
    _hiddenButtonIds.remove(id);
    if (position == 'left') {
      if (!_leftButtonIds.contains(id)) {
        _leftButtonIds.add(id);
      }
    } else {
      if (!_rightButtonIds.contains(id)) {
        _rightButtonIds.add(id);
      }
    }
    _saveButtonConfig();
  }

  void _moveButton(String id, String to) {
    if (to == 'left') {
      _rightButtonIds.remove(id);
      _leftButtonIds.add(id);
    } else {
      _leftButtonIds.remove(id);
      _rightButtonIds.add(id);
    }
    _saveButtonConfig();
  }

  String numToPlayerStyle(int i) {
    return (i >= 0 && i < styles.length) ? styles[i] : 'Unknown';
  }

  int styleToNum(String i) {
    return styles.indexOf(i);
  }

  void _showPlaybackSpeedDialog() {
    showDialog(
      context: context,
      builder: (context) {
        final l10n = AppLocalizations.of(context)!;
        return Dialog(
            backgroundColor: context.colors.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              width: getResponsiveValue(context,
                  mobileValue: null, desktopValue: 500.0),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.playbackSpeed, // 需要添加键 playbackSpeed
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: SuperListView.builder(
                      shrinkWrap: true,
                      itemCount: cursedSpeed.length,
                      itemBuilder: (context, index) {
                        double speedd = cursedSpeed[index];

                        return Obx(() => Container(
                              margin: const EdgeInsets.only(bottom: 7),
                              child: ListTileWithCheckMark(
                                leading: const Icon(Icons.speed),
                                color: context.colors.primary,
                                active: speedd == speed.value,
                                title: '${speedd.toStringAsFixed(2)}x',
                                onTap: () {
                                  speed.value = speedd;
                                  settings.speed = speedd;
                                },
                              ),
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  void showPlayerStyleDialog() {
    final l10n = AppLocalizations.of(context)!;
    showSelectionDialog<int>(
        title: l10n.playerTheme, // 使用现有键 playerTheme
        items: [0, 1, 2],
        selectedItem: selectedStyleIndex,
        getTitle: (i) => numToPlayerStyle(i),
        onItemSelected: (i) {
          selectedStyleIndex.value = i;
          settings.playerStyle = i;
        });
  }

  void _showPlayerControlThemeDialog() {
    final l10n = AppLocalizations.of(context)!;
    showSelectionDialog<String>(
      title: l10n.controlTheme, // 需要添加键 controlTheme
      items: PlayerControlThemeRegistry.themes.map((e) => e.id).toList(),
      selectedItem: settings.playerControlThemeRx,
      getTitle: (id) => PlayerControlThemeRegistry.resolve(id).name,
      onItemSelected: (id) {
        settings.playerControlTheme = id;
        setState(() {});
      },
      leadingIcon: Icons.style_rounded,
    );
  }

  void _showMediaIndicatorThemeDialog() {
    final l10n = AppLocalizations.of(context)!;
    showSelectionDialog<String>(
      title: l10n.swipeIndicatorTheme, // 需要添加键 swipeIndicatorTheme
      items: MediaIndicatorThemeRegistry.themes.map((e) => e.id).toList(),
      selectedItem: settings.mediaIndicatorThemeRx,
      getTitle: (id) => MediaIndicatorThemeRegistry.resolve(id).name,
      onItemSelected: (id) {
        settings.mediaIndicatorTheme = id;
        setState(() {});
      },
      leadingIcon: Icons.tune_rounded,
    );
  }

  void _showResizeModeDialog() {
    final currentFit = settings.resizeMode;
    final selectedLabel = resizeModeList.firstWhere(
      (lbl) =>
          (resizeModes[lbl]?.name.toLowerCase() ?? '') ==
          currentFit.toLowerCase(),
      orElse: () => resizeModeList.first,
    );

    final l10n = AppLocalizations.of(context)!;
    showSelectionDialog<String>(
      title: l10n.resizeMode, // 现有键
      items: resizeModeList,
      selectedItem: selectedLabel.obs,
      getTitle: (item) => item,
      onItemSelected: (selected) {
        final fit = resizeModes[selected];
        if (fit != null) {
          settings.resizeMode = fit.name;
          _shouldApplyResizeModeOnClose = true;
        }
      },
      leadingIcon: Icons.crop,
    );
  }

  @override
  void dispose() {
    final shouldApplyResizeOnClose =
        widget.isModal && _shouldApplyResizeModeOnClose;
    super.dispose();
    if (!shouldApplyResizeOnClose) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!Get.isRegistered<PlayerController>()) return;
      final controller = Get.find<PlayerController>();
      if (controller.isClosed) return;
      controller.applyConfiguredResizeMode();
    });
  }

  void _showColorSelectionDialog(String title, Color currentColor,
      Function(String) onColorSelected, Map<String, Color> options) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final l10n = AppLocalizations.of(context)!;
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(
                color: context.colors.primary,
                fontFamily: 'Poppins-SemiBold',
                fontSize: 20),
          ),
          content: SizedBox(
            height: 300,
            width: double.maxFinite,
            child: SuperListView(
              physics: const BouncingScrollPhysics(),
              children: options.entries.map((entry) {
                return RadioListTile<Color>(
                  title: Text(entry.key),
                  value: entry.value,
                  groupValue: currentColor,
                  onChanged: (Color? value) {
                    if (value != null) {
                      onColorSelected(entry.key);
                      Navigator.pop(context);
                    }
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  void _showTranslationLanguageDialog() {
    final l10n = AppLocalizations.of(context)!;
    showSelectionDialog<String>(
      title: l10n.translateTo, // 现有键
      items: SubtitleTranslator.languages.keys.toList(),
      selectedItem: settings.playerSettings.value.translateTo.obs,
      getTitle: (code) => SubtitleTranslator.languages[code]!,
      onItemSelected: (code) {
        settings.playerSettings.update((s) => s?.translateTo = code);
        PlayerSettingsKeys.translateTo.set(code);
        setState(() {});
      },
    );
  }

  void _showFontSelectionDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.selectSubtitleFont), // 需要添加键 selectSubtitleFont
        content: SizedBox(
          width: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            children: fontGroups.entries.map((group) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(group.key,
                        style: TextStyle(
                            color: context.colors.primary,
                            fontWeight: FontWeight.bold)),
                  ),
                  ...group.value.map((font) => ListTile(
                        title: Text(font),
                        onTap: () {
                          final current = settings.playerSettings.value;
                          current.subtitleFont = font;
                          PlayerSettingsKeys.subtitleFont.set(font);
                          settings.playerSettings.refresh();
                          Navigator.pop(context);
                        },
                        trailing: settings.playerSettings.value.subtitleFont ==
                                font
                            ? Icon(Icons.check, color: context.colors.primary)
                            : null,
                      )),
                  const Divider(),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  void _showOutlineTypeDialog() {
    final currentType = normalizeSubtitleOutlineType(
        settings.playerSettings.value.subtitleOutlineType);
    if (currentType != settings.playerSettings.value.subtitleOutlineType) {
      settings.playerSettings
          .update((s) => s?.subtitleOutlineType = currentType);
      PlayerSettingsKeys.subtitleOutlineType.set(currentType);
    }

    final l10n = AppLocalizations.of(context)!;
    showSelectionDialog<String>(
      title: l10n.outlineType, // 现有键
      items: subtitleOutlineTypes,
      selectedItem: currentType.obs,
      getTitle: (v) => v,
      onItemSelected: (v) {
        final current = settings.playerSettings.value;
        current.subtitleOutlineType = v;
        PlayerSettingsKeys.subtitleOutlineType.set(v);
        settings.playerSettings.refresh();
      },
    );
  }

  bool _isUsingMpvEngine() {
    if (!Platform.isAndroid && !Platform.isIOS) return true;
    return PlayerKeys.useMediaKit.get<bool>(false);
  }

  void _showMpvCoreSelectionDialog({
    required String title,
    required List<String> items,
    required String selected,
    required String Function(String) getTitle,
    required String key,
  }) {
    showSelectionDialog<String>(
      title: title,
      items: items,
      selectedItem: selected.obs,
      getTitle: getTitle,
      onItemSelected: (value) {
        PlayerCoreVisualSettings.setMpvCoreSetting(key, value);
        setState(() {});
      },
      leadingIcon: Icons.tune_rounded,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Glow(
        child: Scaffold(
            body: Column(children: [
      if (!widget.isModal)
        NestedHeader(title: l10n.playerSettings), // 现有键 playerSettings
      Expanded(
        child: SingleChildScrollView(
          padding: getResponsiveValue(context,
              mobileValue: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 50.0),
              desktopValue: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.isModal) ...[
                Center(
                  child: Text(l10n.playerSettings,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                )
              ],
              SizedBox(height: widget.isModal ? 30.0 : 0),
              Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnymexExpansionTile(
                          title: l10n.experimental, // 需要添加键 experimental
                          initialExpanded: false,
                          content: Builder(builder: (context) {
                            final experimentalEnabled =
                                PlayerUiKeys.playerExperimentalEnabled
                                    .get<bool>(false);
                            final usingMpv = _isUsingMpvEngine();
                            final mpvCore =
                                PlayerCoreVisualSettings.getMpvCoreSettings();
                            final betterCore = PlayerCoreVisualSettings
                                .getBetterPlayerCoreSettings();

                            return Column(
                              children: [
                                CustomSwitchTile(
                                  padding: const EdgeInsets.all(10),
                                  icon: Icons.science_outlined,
                                  title: l10n.enableExperimentalSettings, // 需要添加键
                                  description:
                                      l10n.experimentalDescription, // 需要添加键
                                  switchValue: experimentalEnabled,
                                  onChanged: (val) {
                                    PlayerUiKeys.playerExperimentalEnabled
                                        .set<bool>(val);
                                    setState(() {});
                                  },
                                ),
                                if (!experimentalEnabled)
                                  _buildExperimentalGateMessage(
                                      l10n.experimentalGateMessage), // 需要添加键
                                if (experimentalEnabled && usingMpv)
                                  Column(
                                children: [
                                  CustomTile(
                                    padding: 10,
                                    icon: Icons.memory_rounded,
                                    title: l10n.decoderHwdec, // 需要添加键
                                    isDescBold: true,
                                    descColor:
                                        Theme.of(context).colorScheme.primary,
                                    description:
                                        (mpvCore['hwdec'] as String?) ??
                                            'auto-safe',
                                    onTap: () => _showMpvCoreSelectionDialog(
                                      title: l10n.mpvDecoder,
                                      items: const [
                                        'no',
                                        'auto-safe',
                                        'auto',
                                        'mediacodec-copy',
                                        'vaapi',
                                        'videotoolbox',
                                        'd3d11va',
                                      ],
                                      selected: (mpvCore['hwdec'] as String?) ??
                                          'auto-safe',
                                      getTitle: (item) => item,
                                      key: 'hwdec',
                                    ),
                                  ),
                                  CustomTile(
                                    padding: 10,
                                    icon: Icons.sync_rounded,
                                    title: l10n.videoSync, // 需要添加键
                                    isDescBold: true,
                                    descColor:
                                        Theme.of(context).colorScheme.primary,
                                    description:
                                        (mpvCore['videoSync'] as String?) ??
                                            'audio',
                                    onTap: () => _showMpvCoreSelectionDialog(
                                      title: l10n.videoSync,
                                      items: const [
                                        'audio',
                                        'display-resample',
                                        'display-vdrop',
                                        'display-adrop',
                                      ],
                                      selected:
                                          (mpvCore['videoSync'] as String?) ??
                                              'audio',
                                      getTitle: (item) => item,
                                      key: 'videoSync',
                                    ),
                                  ),
                                  CustomSwitchTile(
                                    padding: const EdgeInsets.all(10),
                                    icon: Icons.movie_filter_rounded,
                                    title: l10n.frameInterpolation, // 需要添加键
                                    description:
                                        l10n.frameInterpolationDesc, // 需要添加键
                                    switchValue:
                                        (mpvCore['interpolation'] as bool?) ??
                                            false,
                                    onChanged: (val) {
                                      PlayerCoreVisualSettings
                                          .setMpvCoreSetting(
                                              'interpolation', val);
                                      setState(() {});
                                    },
                                  ),
                                  CustomSwitchTile(
                                    padding: const EdgeInsets.all(10),
                                    icon: Icons.graphic_eq_rounded,
                                    title: l10n.audioPitchCorrection, // 需要添加键
                                    description:
                                        l10n.audioPitchCorrectionDesc, // 需要添加键
                                    switchValue:
                                        (mpvCore['audioPitchCorrection']
                                                as bool?) ??
                                            true,
                                    onChanged: (val) {
                                      PlayerCoreVisualSettings
                                          .setMpvCoreSetting(
                                              'audioPitchCorrection', val);
                                      setState(() {});
                                    },
                                  ),
                                  CustomSliderTile(
                                    icon: Icons.timer_outlined,
                                    title: l10n.cacheMinutes, // 需要添加键
                                    description:
                                        l10n.cacheMinutesDesc, // 需要添加键
                                    sliderValue:
                                        ((mpvCore['cacheMinutes'] as num?) ?? 5)
                                            .toDouble(),
                                    min: 0,
                                    max: 60,
                                    divisions: 60,
                                    label:
                                        ((mpvCore['cacheMinutes'] as num?) ?? 5)
                                            .toInt()
                                            .toString(),
                                    onChanged: (value) {
                                      PlayerCoreVisualSettings
                                          .setMpvCoreSetting(
                                              'cacheMinutes', value.round());
                                      setState(() {});
                                    },
                                  ),
                                  CustomSliderTile(
                                    icon: Icons.downloading_rounded,
                                    title: l10n.demuxerReadahead, // 需要添加键
                                    description:
                                        l10n.demuxerReadaheadDesc, // 需要添加键
                                    sliderValue:
                                        ((mpvCore['demuxerReadaheadSeconds']
                                                    as num?) ??
                                                20)
                                            .toDouble(),
                                    min: 0,
                                    max: 120,
                                    divisions: 24,
                                    label: ((mpvCore['demuxerReadaheadSeconds']
                                                as num?) ??
                                            20)
                                        .toInt()
                                        .toString(),
                                    onChanged: (value) {
                                      PlayerCoreVisualSettings
                                          .setMpvCoreSetting(
                                              'demuxerReadaheadSeconds',
                                              value.round());
                                      setState(() {});
                                    },
                                  ),
                                  CustomSliderTile(
                                    icon: Icons.storage_rounded,
                                    title: l10n.demuxerMaxBuffer, // 需要添加键
                                    description:
                                        l10n.demuxerMaxBufferDesc, // 需要添加键
                                    sliderValue: ((mpvCore['demuxerMaxBytesMb']
                                                as num?) ??
                                            64)
                                        .toDouble(),
                                    min: 16,
                                    max: 512,
                                    divisions: 62,
                                    label: ((mpvCore['demuxerMaxBytesMb']
                                                as num?) ??
                                            64)
                                        .toInt()
                                        .toString(),
                                    onChanged: (value) {
                                      PlayerCoreVisualSettings
                                          .setMpvCoreSetting(
                                              'demuxerMaxBytesMb',
                                              value.round());
                                      setState(() {});
                                    },
                                  ),
                                  CustomSliderTile(
                                    icon: Icons.developer_board_rounded,
                                    title: l10n.decoderThreads, // 需要添加键
                                    description:
                                        l10n.decoderThreadsDesc, // 需要添加键
                                    sliderValue:
                                        ((mpvCore['vdLavcThreads'] as num?) ??
                                                0)
                                            .toDouble(),
                                    min: 0,
                                    max: 16,
                                    divisions: 16,
                                    label:
                                        ((mpvCore['vdLavcThreads'] as num?) ??
                                                0)
                                            .toInt()
                                            .toString(),
                                    onChanged: (value) {
                                      PlayerCoreVisualSettings
                                          .setMpvCoreSetting(
                                              'vdLavcThreads', value.round());
                                      setState(() {});
                                    },
                                  ),
                                ],
                              ),
                                if (experimentalEnabled && !usingMpv)
                                  Column(
                                    children: [
                                CustomSliderTile(
                                  icon: Icons.storage_rounded,
                                  title: l10n.bufferSize, // 需要添加键
                                  description:
                                      l10n.bufferSizeDesc, // 需要添加键
                                  sliderValue:
                                      ((betterCore['bufferSizeMb'] as num?) ??
                                              32)
                                          .toDouble(),
                                  min: 8,
                                  max: 256,
                                  divisions: 31,
                                  label:
                                      ((betterCore['bufferSizeMb'] as num?) ??
                                              32)
                                          .toInt()
                                          .toString(),
                                  onChanged: (value) {
                                    PlayerCoreVisualSettings
                                        .setBetterPlayerCoreSetting(
                                            'bufferSizeMb', value.round());
                                    setState(() {});
                                  },
                                ),
                                CustomSwitchTile(
                                  padding: const EdgeInsets.all(10),
                                  icon: Icons.play_arrow_rounded,
                                  title: l10n.autoPlay,
                                  description:
                                      l10n.autoPlayDesc, // 需要添加键
                                  switchValue:
                                      (betterCore['autoPlay'] as bool?) ?? true,
                                  onChanged: (val) {
                                    PlayerCoreVisualSettings
                                        .setBetterPlayerCoreSetting(
                                            'autoPlay', val);
                                    setState(() {});
                                  },
                                ),
                                CustomSwitchTile(
                                  padding: const EdgeInsets.all(10),
                                  icon: Icons.network_check_rounded,
                                  title: l10n.useBuffering, // 需要添加键
                                  description:
                                      l10n.useBufferingDesc, // 需要添加键
                                  switchValue:
                                      (betterCore['useBuffering'] as bool?) ??
                                          true,
                                  onChanged: (val) {
                                    PlayerCoreVisualSettings
                                        .setBetterPlayerCoreSetting(
                                            'useBuffering', val);
                                    setState(() {});
                                  },
                                ),
                              ],
                                  ),
                              ],
                            );
                          })),
                      AnymexExpansionTile(
                          initialExpanded: true,
                          title: l10n.common, // 现有键
                          content: Column(
                            children: [
                              if (Platform.isAndroid || Platform.isIOS)
                                CustomSwitchTile(
                                    icon: Icons.subtitles,
                                    padding: const EdgeInsets.all(10),
                                    title: l10n.useLibmpv, // 需要添加键
                                    description:
                                        l10n.useLibmpvDesc, // 需要添加键
                                    switchValue:
                                        PlayerKeys.useMediaKit.get<bool>(false),
                                    onChanged: (val) {
                                      PlayerKeys.useMediaKit.set<bool>(val);
                                      setState(() {});
                                    }),
                              CustomSwitchTile(
                                  icon: Icons.subtitles,
                                  padding: const EdgeInsets.all(10),
                                  title: l10n.useLibass, // 需要添加键
                                  description:
                                      l10n.useLibassDesc, // 需要添加键
                                  switchValue:
                                      PlayerKeys.useLibass.get<bool>(false),
                                  onChanged: (val) {
                                    PlayerKeys.useLibass.set<bool>(val);
                                    setState(() {});
                                  }),
                              CustomTile(
                                padding: 10,
                                descColor:
                                    Theme.of(context).colorScheme.primary,
                                isDescBold: true,
                                icon: HugeIcons.strokeRoundedPlaySquare,
                                onTap: _showPlayerControlThemeDialog,
                                title: l10n.playerTheme, // 现有键
                                description: PlayerControlThemeRegistry.resolve(
                                  settings.playerControlTheme,
                                ).name,
                              ),
                              CustomTile(
                                padding: 10,
                                descColor:
                                    Theme.of(context).colorScheme.primary,
                                isDescBold: true,
                                icon: Icons.data_object_rounded,
                                onTap: () => showJsonPlayerThemesSheet(
                                    context, setState, settings),
                                title: l10n.jsonThemeManager, // 需要添加键
                                description:
                                    '${PlayerControlThemeRegistry.jsonThemes.length} imported theme(s)',
                              ),
                              CustomTile(
                                padding: 10,
                                descColor:
                                    Theme.of(context).colorScheme.primary,
                                isDescBold: true,
                                icon: Icons.tune_rounded,
                                onTap: _showMediaIndicatorThemeDialog,
                                title: l10n.swipeIndicatorTheme, // 需要添加键
                                description:
                                    MediaIndicatorThemeRegistry.resolve(
                                  settings.mediaIndicatorTheme,
                                ).name,
                              ),
                              CustomSwitchTile(
                                  padding: const EdgeInsets.all(10),
                                  icon: Icons.stay_current_portrait,
                                  title: l10n.defaultPortrait, // 需要添加键
                                  description:
                                      l10n.defaultPortraitDesc, // 需要添加键
                                  switchValue: settings.defaultPortraitMode,
                                  onChanged: (val) =>
                                      settings.defaultPortraitMode = val),
                              CustomTile(
                                padding: 10,
                                isDescBold: true,
                                icon: Icons.speed,
                                descColor:
                                    Theme.of(context).colorScheme.primary,
                                onTap: _showPlaybackSpeedDialog,
                                title: l10n.playbackSpeed, // 需要添加键
                                description:
                                    '${settings.speed.toStringAsFixed(1)}x',
                              ),
                              CustomTile(
                                padding: 10,
                                icon: Icons.aspect_ratio,
                                title: l10n.resizeMode, // 现有键
                                isDescBold: true,
                                description:
                                    settings.resizeMode.capitalizeFirst!,
                                descColor:
                                    Theme.of(context).colorScheme.primary,
                                onTap: () {
                                  _showResizeModeDialog();
                                },
                              ),
                              CustomSwitchTile(
                                  padding: const EdgeInsets.all(10),
                                  icon: Icons.fast_forward,
                                  title: l10n.autoSkipOp, // 需要添加键
                                  description: l10n.autoSkipOpDesc, // 需要添加键
                                  switchValue: settings.autoSkipOP,
                                  onChanged: (val) =>
                                      settings.autoSkipOP = val),
                              CustomSwitchTile(
                                  padding: const EdgeInsets.all(10),
                                  icon: Icons.fast_forward_outlined,
                                  title: l10n.autoSkipEd, // 需要添加键
                                  description: l10n.autoSkipEdDesc, // 需要添加键
                                  switchValue: settings.autoSkipED,
                                  onChanged: (val) =>
                                      settings.autoSkipED = val),
                              CustomSwitchTile(
                                  padding: const EdgeInsets.all(10),
                                  icon: Icons.fast_forward_outlined,
                                  title: l10n.autoSkipRecap, // 需要添加键
                                  description: l10n.autoSkipRecapDesc, // 需要添加键
                                  switchValue: settings.autoSkipRecap,
                                  onChanged: (val) =>
                                      settings.autoSkipRecap = val),
                              CustomSwitchTile(
                                  padding: const EdgeInsets.all(10),
                                  icon: Icons.all_inclusive,
                                  title: l10n.autoSkipOnce, // 需要添加键
                                  description: l10n.autoSkipOnceDesc, // 需要添加键
                                  switchValue: settings.autoSkipOnce,
                                  onChanged: (val) =>
                                      settings.autoSkipOnce = val),
                              CustomSwitchTile(
                                  padding: const EdgeInsets.all(10),
                                  icon: Icons.skip_next_rounded,
                                  title: l10n.autoSkipFiller, // 需要添加键
                                  description:
                                      l10n.autoSkipFillerDesc, // 需要添加键
                                  switchValue: settings.autoSkipFiller,
                                  onChanged: (val) =>
                                      settings.autoSkipFiller = val),
                              CustomSwitchTile(
                                  padding: const EdgeInsets.all(10),
                                  icon: Icons.play_disabled_rounded,
                                  title: l10n.enableSwipeControls, // 需要添加键
                                  description:
                                      l10n.enableSwipeControlsDesc, // 需要添加键
                                  switchValue: settings.enableSwipeControls,
                                  onChanged: (val) =>
                                      settings.enableSwipeControls = val),
                              CustomSwitchTile(
                                  padding: const EdgeInsets.all(10),
                                  icon: Icons.screenshot_rounded,
                                  title: l10n.saveLastFrame, // 需要添加键
                                  description:
                                      l10n.saveLastFrameDesc, // 需要添加键
                                  switchValue: settings.enableScreenshot,
                                  onChanged: (val) =>
                                      settings.enableScreenshot = val),
                              CustomSliderTile(
                                sliderValue: settings.seekDuration.toDouble(),
                                max: 50,
                                divisions: 10,
                                onChanged: (double value) {
                                  setState(() {
                                    settings.seekDuration = value.toInt();
                                  });
                                },
                                label: settings.seekDuration.toString(),
                                title: l10n.doubleTapSeek, // 需要添加键
                                description:
                                    l10n.doubleTapSeekDesc, // 需要添加键
                                icon: Iconsax.forward5,
                              ),
                              CustomSliderTile(
                                sliderValue: settings.skipDuration.toDouble(),
                                max: 120,
                                divisions: 24,
                                label: settings.skipDuration.toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    settings.skipDuration = value.toInt();
                                  });
                                },
                                title: l10n.megaSkipDuration, // 需要添加键
                                description: l10n.megaSkipDurationDesc, // 需要添加键
                                icon: Iconsax.forward5,
                              ),
                              CustomSliderTile(
                                sliderValue:
                                    settings.markAsCompleted.toDouble(),
                                max: 100,
                                divisions: 20,
                                label: settings.markAsCompleted.toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    settings.markAsCompleted = value.toInt();
                                  });
                                },
                                title: l10n.markAsWatched, // 现有键
                                description:
                                    l10n.markAsWatchedDesc, // 需要添加键
                                icon: Iconsax.tick_circle,
                              ),
                            ],
                          )),
                      AnymexExpansionTile(
                          title: l10n.subtitles, // 现有键
                          content: Column(
                            children: [
                              CustomSwitchTile(
                                  padding: const EdgeInsets.all(10),
                                  icon: Icons.lightbulb,
                                  title: l10n.transitionSubtitle, // 需要添加键
                                  description:
                                      l10n.transitionSubtitleDesc, // 需要添加键
                                  switchValue: settings.transitionSubtitle,
                                  onChanged: (e) {
                                    settings.transitionSubtitle = e;
                                  }),
                              CustomSwitchTile(
                                padding: const EdgeInsets.all(10),
                                icon: HugeIcons.strokeRoundedTranslate,
                                title: l10n.autoTranslateSubtitles, // 需要添加键
                                description:
                                    l10n.autoTranslateSubtitlesDesc, // 需要添加键
                                switchValue:
                                    settings.playerSettings.value.autoTranslate,
                                onChanged: (val) {
                                  settings.playerSettings
                                      .update((s) => s?.autoTranslate = val);
                                  PlayerSettingsKeys.autoTranslate.set(val);
                                  setState(() {});
                                },
                              ),
                              if (!widget.isModal &&
                                  settings.playerSettings.value.autoTranslate)
                                CustomTile(
                                  padding: 10.0,
                                  icon: Icons.language,
                                  title: l10n.translateTo, // 现有键
                                  description: SubtitleTranslator.languages[
                                          settings.playerSettings.value
                                              .translateTo] ??
                                      'Select Language',
                                  onTap: () {
                                    _showTranslationLanguageDialog();
                                  },
                                ),
                              CustomTile(
                                padding: 10,
                                icon: Icons.font_download_rounded,
                                title: l10n.subtitleFont, // 需要添加键
                                description:
                                    settings.playerSettings.value.subtitleFont,
                                onTap: _showFontSelectionDialog,
                              ),
                              CustomTile(
                                padding: 10,
                                icon: Icons.format_paint_rounded,
                                title: l10n.outlineType, // 现有键
                                description: normalizeSubtitleOutlineType(
                                    settings.playerSettings.value
                                        .subtitleOutlineType),
                                onTap: _showOutlineTypeDialog,
                              ),
                              CustomSliderTile(
                                sliderValue: settings
                                    .playerSettings.value.subtitleOpacity,
                                min: 0.1,
                                max: 1.0,
                                divisions: 10,
                                onChanged: (val) {
                                  final current = settings.playerSettings.value;
                                  current.subtitleOpacity = val;
                                  PlayerSettingsKeys.subtitleOpacity.set(val);
                                  settings.playerSettings.refresh();
                                },
                                title: l10n.subtitleTransparency, // 需要添加键
                                description:
                                    l10n.subtitleTransparencyDesc, // 需要添加键
                                icon: Icons.opacity,
                              ),
                              CustomSliderTile(
                                sliderValue: settings
                                    .playerSettings.value.subtitleBottomMargin,
                                min: 0.0,
                                max: 100.0,
                                divisions: 20,
                                onChanged: (val) {
                                  final current = settings.playerSettings.value;
                                  current.subtitleBottomMargin = val;
                                  PlayerSettingsKeys.subtitleBottomMargin
                                      .set(val);
                                  settings.playerSettings.refresh();
                                },
                                title: l10n.bottomMargin, // 需要添加键
                                description:
                                    l10n.bottomMarginDesc, // 需要添加键
                                icon: Icons.vertical_align_bottom,
                              ),
                              CustomTile(
                                padding: 10,
                                description: l10n.changeSubtitleColor, // 需要添加键
                                icon: Icons.palette,
                                title: l10n.subtitleColor, // 需要添加键
                                onTap: () {
                                  _showColorSelectionDialog(
                                      l10n.selectSubtitleColor, // 需要添加键
                                      fontColorOptions[
                                              settings.subtitleColor] ??
                                          fontColorOptions['Default']!,
                                      (color) {
                                    settings.subtitleColor = color;
                                  }, fontColorOptions);
                                },
                              ),
                              CustomTile(
                                padding: 10,
                                icon: Icons.palette,
                                title: l10n.subtitleOutlineColor, // 需要添加键
                                description:
                                    l10n.changeSubtitleOutlineColor, // 需要添加键
                                onTap: () {
                                  _showColorSelectionDialog(
                                      l10n.selectSubtitleOutlineColor, // 需要添加键
                                      colorOptions[
                                              settings.subtitleOutlineColor] ??
                                          colorOptions['None']!, (color) {
                                    settings.subtitleOutlineColor = color;
                                  }, colorOptions);
                                },
                              ),
                              CustomTile(
                                padding: 10,
                                description:
                                    l10n.changeSubtitleBackgroundColor, // 需要添加键
                                icon: Icons.palette,
                                title: l10n.subtitleBackgroundColor, // 需要添加键
                                onTap: () {
                                  _showColorSelectionDialog(
                                      l10n.selectSubtitleBackgroundColor, // 需要添加键
                                      colorOptions[settings
                                              .subtitleBackgroundColor] ??
                                          colorOptions['None']!, (color) {
                                    settings.subtitleBackgroundColor = color;
                                  }, colorOptions);
                                },
                              ),
                              CustomSliderTile(
                                sliderValue: settings.subtitleSize.toDouble(),
                                min: 12.0,
                                max: 90.0,
                                divisions: 18,
                                onChanged: (double value) {
                                  settings.subtitleSize = value.toInt();
                                },
                                title: l10n.subtitleSize, // 现有键
                                description: l10n.adjustSubtitleSize, // 需要添加键
                                icon: Iconsax.subtitle5,
                              ),
                              CustomSliderTile(
                                sliderValue:
                                    settings.subtitleOutlineWidth.toDouble(),
                                min: 1.0,
                                max: 8.0,
                                divisions: 14,
                                onChanged: (double value) {
                                  settings.subtitleOutlineWidth = value.toInt();
                                },
                                title: l10n.subtitleOutlineWidth, // 需要添加键
                                description:
                                    l10n.adjustSubtitleOutlineWidth, // 需要添加键
                                icon: Iconsax.subtitle5,
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 17.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      l10n.subtitlePreview, // 需要添加键
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: colorOptions[
                                            settings.subtitleBackgroundColor],
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      child: buildStyledSubtitleText(
                                        text: l10n.subtitlePreviewText, // 需要添加键
                                        textColor: fontColorOptions[
                                                settings.subtitleColor] ??
                                            fontColorOptions['Default']!,
                                        fontSize:
                                            settings.subtitleSize.toDouble(),
                                        fontFamily: resolveSubtitleFontFamily(
                                            settings.playerSettings.value
                                                .subtitleFont),
                                        outlineType: settings.playerSettings
                                            .value.subtitleOutlineType,
                                        outlineWidth: settings
                                            .subtitleOutlineWidth
                                            .toDouble(),
                                        outlineColor: colorOptions[settings
                                                .subtitleOutlineColor] ??
                                            colorOptions['Black']!,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      AnymexExpansionTile(
                        title: l10n.bottomControls, // 需要添加键
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildJsonThemeInfoCard(),
                            _buildSectionLabel(l10n.leftSide), // 需要添加键
                            ReorderableListView.builder(
                              key: const Key('left_list'),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: _leftButtonIds.length,
                              itemBuilder: (context, index) {
                                final id = _leftButtonIds[index];
                                final control = _bottomControls
                                    .firstWhere((c) => c.id == id);
                                return _buildControlTile(control, 'left',
                                    key: ValueKey('left_$id'));
                              },
                              onReorder: (oldIndex, newIndex) {
                                setState(() {
                                  if (newIndex > oldIndex) {
                                    newIndex -= 1;
                                  }
                                  final String item =
                                      _leftButtonIds.removeAt(oldIndex);
                                  _leftButtonIds.insert(newIndex, item);
                                  _saveButtonConfig();
                                });
                              },
                            ),
                            const SizedBox(height: 16),
                            _buildSectionLabel(l10n.rightSide), // 需要添加键
                            ReorderableListView.builder(
                              key: const Key('right_list'),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: _rightButtonIds.length,
                              itemBuilder: (context, index) {
                                final id = _rightButtonIds[
                                    _rightButtonIds.length - 1 - index];
                                final control = _bottomControls
                                    .firstWhere((c) => c.id == id);
                                return _buildControlTile(control, 'right',
                                    key: ValueKey('right_$id'));
                              },
                              onReorder: (oldIndex, newIndex) {
                                setState(() {
                                  _rightButtonIds =
                                      _rightButtonIds.reversed.toList();
                                  if (newIndex > oldIndex) {
                                    newIndex -= 1;
                                  }
                                  final String item =
                                      _rightButtonIds.removeAt(oldIndex);
                                  _rightButtonIds.insert(newIndex, item);
                                  _rightButtonIds =
                                      _rightButtonIds.reversed.toList();
                                  _saveButtonConfig();
                                });
                              },
                            ),
                            if (_hiddenButtonIds.isNotEmpty) ...[
                              const SizedBox(height: 16),
                              _buildSectionLabel(l10n.hidden), // 需要添加键
                              ListView.builder(
                                key: const Key('hidden_list'),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: _hiddenButtonIds.length,
                                itemBuilder: (context, index) {
                                  final id = _hiddenButtonIds[index];
                                  final control = _bottomControls
                                      .firstWhere((c) => c.id == id);
                                  return _buildControlTile(control, 'hidden',
                                      key: ValueKey('hidden_$id'));
                                },
                              ),
                            ],
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    ])));
  }

  Widget _buildSectionLabel(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(label,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontFamily: 'Poppins-SemiBold')),
    );
  }

  Widget _buildExperimentalGateMessage(String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(10, 4, 10, 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: context.colors.primaryContainer.opaque(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.colors.primary.opaque(0.35),
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline_rounded, size: 18, color: context.colors.primary),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: context.colors.onSurface,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJsonThemeInfoCard() {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.opaque(0.18, iReallyMeanIt: true),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.primary.opaque(0.4, iReallyMeanIt: true),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline_rounded,
            size: 18,
            color: colorScheme.primary,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              l10n.jsonThemeInfo, // 需要添加键
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface,
                    height: 1.35,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlTile(_BottomControl control, String position,
      {required Key key}) {
    final l10n = AppLocalizations.of(context)!;
    return ListTile(
      key: key,
      leading: Icon(control.icon, size: 22),
      title: AnymexText(
        text: control.name,
        variant: TextVariant.semiBold,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: _buildTrailingButtons(control, position),
      ),
    );
  }

  List<Widget> _buildTrailingButtons(_BottomControl control, String position) {
    final l10n = AppLocalizations.of(context)!;
    if (position == 'hidden') {
      return [
        IconButton(
          tooltip: l10n.showOnLeft, // 需要添加键
          icon: const Icon(Icons.visibility_outlined, size: 20),
          onPressed: () => _showButton(control.id, 'left'),
        ),
        IconButton(
          tooltip: l10n.showOnRight, // 需要添加键
          icon: const Icon(
            Icons.keyboard_arrow_right_rounded,
          ),
          onPressed: () => _showButton(control.id, 'right'),
        ),
      ];
    } else {
      return [
        IconButton(
          tooltip: l10n.hideButton, // 需要添加键
          icon: const Icon(
            Icons.visibility_off_outlined,
            size: 20,
          ),
          onPressed: () => _hideButton(control.id),
        ),
        if (position == 'left')
          IconButton(
            tooltip: l10n.moveToRight, // 需要添加键
            icon: const Icon(
              Icons.keyboard_arrow_right_rounded,
            ),
            onPressed: () => _moveButton(control.id, 'right'),
          )
        else
          IconButton(
            tooltip: l10n.moveToLeft, // 需要添加键
            icon: const Icon(Icons.keyboard_arrow_left_rounded,
                color: Colors.white),
            onPressed: () => _moveButton(control.id, 'left'),
          ),
      ];
    }
  }
}