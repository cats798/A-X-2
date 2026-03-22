import 'dart:io';

import 'package:anymex/controllers/settings/settings.dart';
import 'package:anymex/database/data_keys/keys.dart';
import 'package:anymex/screens/manga/widgets/reader/themes/setup/reader_control_theme_registry.dart';
import 'package:anymex/screens/other_features.dart';
import 'package:anymex/widgets/common/custom_tiles.dart';
import 'package:anymex/widgets/common/glow.dart';
import 'package:anymex/widgets/custom_widgets/custom_expansion_tile.dart';
import 'package:anymex/widgets/non_widgets/reusable_checkmark.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:anymex/l10n/app_localizations.dart';  // 添加导入

class SettingsReader extends StatefulWidget {
  const SettingsReader({super.key});

  @override
  State<SettingsReader> createState() => _SettingsReaderState();
}

class _SettingsReaderState extends State<SettingsReader> {
  final settings = Get.find<Settings>();

  int _mangaLayout = ReaderKeys.readingLayout.get<int>(0);
  int _mangaDirection = ReaderKeys.readingDirection.get<int>(1);
  int _mangaDualPageMode = ReaderKeys.dualPageMode.get<int>(0);
  bool _mangaSpacedPages = ReaderKeys.spacedPages.get<bool>(false);
  bool _mangaOverscroll = ReaderKeys.overscrollToChapter.get<bool>(true);
  bool _mangaPageIndicator = ReaderKeys.showPageIndicator.get<bool>(false);
  bool _mangaCropBorders = ReaderKeys.cropImages.get<bool>(false);
  bool _mangaAutoScroll = ReaderKeys.autoScrollEnabled.get<bool>(false);
  double _mangaAutoScrollSpeed = ReaderKeys.autoScrollSpeed.get<double>(3.0);
  bool _mangaVolumeKeys = ReaderKeys.volumeKeysEnabled.get<bool>(false);
  bool _mangaInvertVolumeKeys = ReaderKeys.invertVolumeKeys.get<bool>(false);
  bool _mangaKeepScreenOn = ReaderKeys.keepScreenOn.get<bool>(true);
  bool _mangaChapterTransition =
      ReaderKeys.alwaysShowChapterTransition.get<bool>(false);
  bool _mangaLongPressActions =
      ReaderKeys.longPressPageActionsEnabled.get<bool>(true);
  bool _mangaAutoWebtoon = ReaderKeys.autoWebtoonMode.get<bool>(false);

  int _novelThemeMode = NovelReaderKeys.themeMode.get<int>(3);
  double _novelBackgroundOpacity =
      NovelReaderKeys.backgroundOpacity.get<double>(1.0);
  String _novelFontFamily = NovelReaderKeys.fontFamily.get<String>('System');
  double _novelFontSize = NovelReaderKeys.fontSize.get<double>(16.0);
  double _novelLineHeight = NovelReaderKeys.lineHeight.get<double>(1.6);
  double _novelLetterSpacing =
      NovelReaderKeys.letterSpacing.get<double>(0.0);
  double _novelWordSpacing = NovelReaderKeys.wordSpacing.get<double>(0.0);
  double _novelParagraphSpacing =
      NovelReaderKeys.paragraphSpacing.get<double>(16.0);
  bool _novelPageReaderMode = NovelReaderKeys.pageReader.get<bool>(false);
  bool _novelAutoScroll = NovelReaderKeys.autoScroll.get<bool>(false);
  double _novelAutoScrollSpeed =
      NovelReaderKeys.autoScrollSpeed.get<double>(3.0);
  bool _novelVolumeScrolling =
      NovelReaderKeys.volumeScrolling.get<bool>(false);
  bool _novelTapToScroll = NovelReaderKeys.tapToScroll.get<bool>(false);
  bool _novelKeepScreenOn = NovelReaderKeys.keepScreenOn.get<bool>(true);
  bool _novelSwipeGestures = NovelReaderKeys.swipeGestures.get<bool>(true);
  bool _novelReadingProgress =
      NovelReaderKeys.showReadingProgress.get<bool>(true);
  bool _novelBatteryTime = NovelReaderKeys.showBatteryTime.get<bool>(true);
  bool _novelTtsEnabled = NovelReaderKeys.ttsEnabled.get<bool>(false);
  double _novelTtsSpeed = NovelReaderKeys.ttsSpeed.get<double>(0.5);
  double _novelTtsPitch = NovelReaderKeys.ttsPitch.get<double>(1.0);
  bool _novelTtsAutoAdvance =
      NovelReaderKeys.ttsAutoAdvance.get<bool>(true);

  static const List<String> _novelFonts = [
    'System',
    'Serif',
    'Roboto',
    'Open Sans',
    'Lato',
    'Merriweather',
    'Crimson Text',
    'Libre Baskerville',
  ];

  void _setReaderBool(ReaderKeys key, bool value, void Function() update) {
    setState(() {
      update();
      key.set(value);
    });
  }

  void _setNovelBool(
      NovelReaderKeys key, bool value, void Function() update) {
    setState(() {
      update();
      key.set(value);
    });
  }

  void _showMangaLayoutDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showSelectionDialog<int>(
      title: l10n.layout, // 'Reading Layout' → l10n.layout
      items: const [0, 1],
      selectedItem: _mangaLayout.obs,
      getTitle: (value) => value == 0 ? l10n.continuous : l10n.paged,
      onItemSelected: (value) {
        setState(() {
          _mangaLayout = value;
          ReaderKeys.readingLayout.set(value);
        });
      },
      leadingIcon: Iconsax.card,
    );
  }

  void _showMangaDirectionDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showSelectionDialog<int>(
      title: l10n.direction,
      items: const [0, 1, 2, 3],
      selectedItem: _mangaDirection.obs,
      getTitle: (value) {
        switch (value) {
          case 0:
            return l10n.bottomUp;
          case 1:
            return l10n.topDown;
          case 2:
            return l10n.rtl;
          default:
            return l10n.ltr;
        }
      },
      onItemSelected: (value) {
        setState(() {
          _mangaDirection = value;
          ReaderKeys.readingDirection.set(value);
        });
      },
      leadingIcon: Iconsax.direct_right,
    );
  }

  void _showMangaDualPageDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showSelectionDialog<int>(
      title: l10n.dualPageMode,
      items: const [0, 1, 2],
      selectedItem: _mangaDualPageMode.obs,
      getTitle: (value) {
        switch (value) {
          case 1:
            return l10n.autoLaptopTab;
          case 2:
            return l10n.forceDual;
          default:
            return l10n.standardSingle;
        }
      },
      onItemSelected: (value) {
        setState(() {
          _mangaDualPageMode = value;
          ReaderKeys.dualPageMode.set(value);
        });
      },
      leadingIcon: Iconsax.book_1,
    );
  }

  void _showNovelThemeDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showSelectionDialog<int>(
      title: l10n.theme,
      items: const [0, 1, 2, 3],
      selectedItem: _novelThemeMode.obs,
      getTitle: (value) {
        switch (value) {
          case 0:
            return l10n.light;
          case 1:
            return l10n.dark;
          case 2:
            return l10n.sepia;
          default:
            return l10n.system;
        }
      },
      onItemSelected: (value) {
        setState(() {
          _novelThemeMode = value;
          NovelReaderKeys.themeMode.set(value);
        });
      },
      leadingIcon: Icons.palette_rounded,
    );
  }

  void _showNovelFontDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showSelectionDialog<String>(
      title: l10n.fontFamily,
      items: _novelFonts,
      selectedItem: _novelFontFamily.obs,
      getTitle: (value) => value,
      onItemSelected: (value) {
        setState(() {
          _novelFontFamily = value;
          NovelReaderKeys.fontFamily.set(value);
        });
      },
      leadingIcon: HugeIcons.strokeRoundedTextFont,
    );
  }

  void _showReaderControlThemeDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showSelectionDialog<String>(
      title: l10n.controlTheme,
      items: ReaderControlThemeRegistry.themes.map((e) => e.id).toList(),
      selectedItem: settings.readerControlThemeRx,
      getTitle: (id) => ReaderControlThemeRegistry.resolve(id).name,
      onItemSelected: (id) {
        settings.readerControlTheme = id;
        setState(() {});
      },
      leadingIcon: Icons.style_rounded,
    );
  }

  void _resetNovelDefaults() {
    setState(() {
      _novelThemeMode = 3;
      _novelBackgroundOpacity = 1.0;
      _novelFontFamily = 'System';
      _novelFontSize = 16.0;
      _novelLineHeight = 1.6;
      _novelLetterSpacing = 0.0;
      _novelWordSpacing = 0.0;
      _novelParagraphSpacing = 16.0;
      _novelPageReaderMode = false;
      _novelAutoScroll = false;
      _novelAutoScrollSpeed = 3.0;
      _novelVolumeScrolling = false;
      _novelTapToScroll = false;
      _novelKeepScreenOn = true;
      _novelSwipeGestures = true;
      _novelReadingProgress = true;
      _novelBatteryTime = true;
      _novelTtsEnabled = false;
      _novelTtsSpeed = 0.5;
      _novelTtsPitch = 1.0;
      _novelTtsAutoAdvance = true;
    });

    NovelReaderKeys.themeMode.set(_novelThemeMode);
    NovelReaderKeys.backgroundOpacity.set(_novelBackgroundOpacity);
    NovelReaderKeys.fontFamily.set(_novelFontFamily);
    NovelReaderKeys.fontSize.set(_novelFontSize);
    NovelReaderKeys.lineHeight.set(_novelLineHeight);
    NovelReaderKeys.letterSpacing.set(_novelLetterSpacing);
    NovelReaderKeys.wordSpacing.set(_novelWordSpacing);
    NovelReaderKeys.paragraphSpacing.set(_novelParagraphSpacing);
    NovelReaderKeys.pageReader.set(_novelPageReaderMode);
    NovelReaderKeys.autoScroll.set(_novelAutoScroll);
    NovelReaderKeys.autoScrollSpeed.set(_novelAutoScrollSpeed);
    NovelReaderKeys.volumeScrolling.set(_novelVolumeScrolling);
    NovelReaderKeys.tapToScroll.set(_novelTapToScroll);
    NovelReaderKeys.keepScreenOn.set(_novelKeepScreenOn);
    NovelReaderKeys.swipeGestures.set(_novelSwipeGestures);
    NovelReaderKeys.showReadingProgress.set(_novelReadingProgress);
    NovelReaderKeys.showBatteryTime.set(_novelBatteryTime);
    NovelReaderKeys.ttsEnabled.set(_novelTtsEnabled);
    NovelReaderKeys.ttsSpeed.set(_novelTtsSpeed);
    NovelReaderKeys.ttsPitch.set(_novelTtsPitch);
    NovelReaderKeys.ttsAutoAdvance.set(_novelTtsAutoAdvance);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Glow(
      child: Scaffold(
        body: Column(
          children: [
            NestedHeader(title: l10n.reader),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 50),
                  child: Column(
                    children: [
                      AnymexExpansionTile(
                        title: l10n.manga,
                        initialExpanded: true,
                        content: Column(
                          children: [
                            CustomTile(
                              icon: Icons.style_rounded,
                              title: l10n.controlTheme,
                              description: ReaderControlThemeRegistry.resolve(
                                      settings.readerControlTheme)
                                  .name,
                              onTap: () => _showReaderControlThemeDialog(context),
                            ),
                            CustomTile(
                              icon: Iconsax.card,
                              title: l10n.layout,
                              description: _mangaLayout == 0
                                  ? l10n.continuous
                                  : l10n.paged,
                              onTap: () => _showMangaLayoutDialog(context),
                            ),
                            CustomTile(
                              icon: Iconsax.direct_right,
                              title: l10n.direction,
                              description: switch (_mangaDirection) {
                                0 => l10n.bottomUp,
                                1 => l10n.topDown,
                                2 => l10n.rtl,
                                _ => l10n.ltr,
                              },
                              onTap: () => _showMangaDirectionDialog(context),
                            ),
                            CustomTile(
                              icon: Iconsax.book_1,
                              title: l10n.dualPageMode,
                              description: switch (_mangaDualPageMode) {
                                1 => l10n.autoLaptopTab,
                                2 => l10n.forceDual,
                                _ => l10n.standardSingle,
                              },
                              onTap: () => _showMangaDualPageDialog(context),
                            ),
                            CustomSwitchTile(
                              icon: Iconsax.pharagraphspacing,
                              title: l10n.spacedPages,
                              description: l10n.continuousModeOnly,
                              switchValue: _mangaSpacedPages,
                              onChanged: (value) => _setReaderBool(
                                ReaderKeys.spacedPages,
                                value,
                                () => _mangaSpacedPages = value,
                              ),
                            ),
                            CustomSwitchTile(
                              icon: Iconsax.arrow,
                              title: l10n.overscroll,
                              description: l10n.overscrollToChapter,
                              switchValue: _mangaOverscroll,
                              onChanged: (value) => _setReaderBool(
                                ReaderKeys.overscrollToChapter,
                                value,
                                () => _mangaOverscroll = value,
                              ),
                            ),
                            CustomSwitchTile(
                              icon: Iconsax.eye,
                              title: l10n.persistentPageIndicator,
                              description: l10n.alwaysShowPageIndicator,
                              switchValue: _mangaPageIndicator,
                              onChanged: (value) => _setReaderBool(
                                ReaderKeys.showPageIndicator,
                                value,
                                () => _mangaPageIndicator = value,
                              ),
                            ),
                            CustomSwitchTile(
                              icon: Icons.crop_rounded,
                              title: l10n.cropBorders,
                              description: l10n.removeWhiteBlackBorders,
                              switchValue: _mangaCropBorders,
                              onChanged: (value) => _setReaderBool(
                                ReaderKeys.cropImages,
                                value,
                                () => _mangaCropBorders = value,
                              ),
                            ),
                            CustomSwitchTile(
                              icon: Icons.play_arrow_rounded,
                              title: l10n.autoScroll,
                              description: l10n.automaticallyScrollPages,
                              switchValue: _mangaAutoScroll,
                              onChanged: (value) => _setReaderBool(
                                ReaderKeys.autoScrollEnabled,
                                value,
                                () => _mangaAutoScroll = value,
                              ),
                            ),
                            if (_mangaAutoScroll)
                              CustomSliderTile(
                                icon: Icons.speed_rounded,
                                title: l10n.autoScrollSpeed,
                                description: l10n.secondsPerScreenPage,
                                sliderValue: _mangaAutoScrollSpeed,
                                min: 1.0,
                                max: 10.0,
                                divisions: 18,
                                onChanged: (value) {
                                  setState(() => _mangaAutoScrollSpeed = value);
                                  ReaderKeys.autoScrollSpeed.set(value);
                                },
                              ),
                            if (Platform.isAndroid)
                              CustomSwitchTile(
                                icon: Iconsax.volume_high,
                                title: l10n.volumeKeysNavigation,
                                description: l10n.useVolumeKeysToChangePages,
                                switchValue: _mangaVolumeKeys,
                                onChanged: (value) => _setReaderBool(
                                  ReaderKeys.volumeKeysEnabled,
                                  value,
                                  () => _mangaVolumeKeys = value,
                                ),
                              ),
                            if (Platform.isAndroid)
                              CustomSwitchTile(
                                icon: Iconsax.arrow_swap_horizontal,
                                title: l10n.invertVolumeKeys,
                                description: l10n.swapUpDownActions,
                                switchValue: _mangaInvertVolumeKeys,
                                onChanged: (value) => _setReaderBool(
                                  ReaderKeys.invertVolumeKeys,
                                  value,
                                  () => _mangaInvertVolumeKeys = value,
                                ),
                              ),
                            CustomSwitchTile(
                              icon: Icons.lock_clock_rounded,
                              title: l10n.keepScreenOn,
                              description: l10n.preventScreenFromSleeping,
                              switchValue: _mangaKeepScreenOn,
                              onChanged: (value) => _setReaderBool(
                                ReaderKeys.keepScreenOn,
                                value,
                                () => _mangaKeepScreenOn = value,
                              ),
                            ),
                            CustomSwitchTile(
                              icon: Icons.swap_vert_rounded,
                              title: l10n.autoWebtoonMode,
                              description: l10n.autoSwitchToVerticalMode,
                              switchValue: _mangaAutoWebtoon,
                              onChanged: (value) => _setReaderBool(
                                ReaderKeys.autoWebtoonMode,
                                value,
                                () => _mangaAutoWebtoon = value,
                              ),
                            ),
                            CustomSwitchTile(
                              icon: Icons.swap_horiz_rounded,
                              title: l10n.alwaysShowChapterTransition,
                              description: l10n.showChapterTransitionEvenWithoutGaps,
                              switchValue: _mangaChapterTransition,
                              onChanged: (value) => _setReaderBool(
                                ReaderKeys.alwaysShowChapterTransition,
                                value,
                                () => _mangaChapterTransition = value,
                              ),
                            ),
                            CustomSwitchTile(
                              icon: Icons.touch_app_rounded,
                              title: l10n.longPressPageActions,
                              description: l10n.enableLongPressQuickActions,
                              switchValue: _mangaLongPressActions,
                              onChanged: (value) => _setReaderBool(
                                ReaderKeys.longPressPageActionsEnabled,
                                value,
                                () => _mangaLongPressActions = value,
                              ),
                            ),
                          ],
                        ),
                      ),
                      AnymexExpansionTile(
                        title: l10n.novel,
                        initialExpanded: true,
                        content: Column(
                          children: [
                            CustomTile(
                              icon: Icons.palette_rounded,
                              title: l10n.theme,
                              description: switch (_novelThemeMode) {
                                0 => l10n.light,
                                1 => l10n.dark,
                                2 => l10n.sepia,
                                _ => l10n.system,
                              },
                              onTap: () => _showNovelThemeDialog(context),
                            ),
                            CustomTile(
                              icon: HugeIcons.strokeRoundedTextFont,
                              title: l10n.fontFamily,
                              description: _novelFontFamily,
                              onTap: () => _showNovelFontDialog(context),
                            ),
                            CustomSliderTile(
                              icon: Icons.format_size_rounded,
                              title: l10n.fontSize,
                              description: l10n.textSize,
                              sliderValue: _novelFontSize,
                              min: 12,
                              max: 24,
                              divisions: 12,
                              onChanged: (value) {
                                setState(() => _novelFontSize =
                                    value.clamp(12.0, 24.0).toDouble());
                                NovelReaderKeys.fontSize.set(_novelFontSize);
                              },
                            ),
                            CustomSliderTile(
                              icon: Icons.height_rounded,
                              title: l10n.lineHeight,
                              description: l10n.distanceBetweenLines,
                              sliderValue: _novelLineHeight,
                              min: 1.0,
                              max: 3.0,
                              divisions: 20,
                              onChanged: (value) {
                                setState(() => _novelLineHeight =
                                    value.clamp(1.0, 3.0).toDouble());
                                NovelReaderKeys.lineHeight.set(_novelLineHeight);
                              },
                            ),
                            CustomSliderTile(
                              icon: Icons.opacity_rounded,
                              title: l10n.backgroundOpacity,
                              description: l10n.readerBackgroundOpacity,
                              sliderValue: _novelBackgroundOpacity,
                              min: 0.3,
                              max: 1.0,
                              divisions: 7,
                              onChanged: (value) {
                                setState(() => _novelBackgroundOpacity =
                                    value.clamp(0.3, 1.0).toDouble());
                                NovelReaderKeys.backgroundOpacity
                                    .set(_novelBackgroundOpacity);
                              },
                            ),
                            CustomSliderTile(
                              icon: Icons.text_fields_rounded,
                              title: l10n.letterSpacing,
                              description: l10n.spaceBetweenLetters,
                              sliderValue: _novelLetterSpacing,
                              min: -1.0,
                              max: 2.0,
                              divisions: 30,
                              onChanged: (value) {
                                setState(() => _novelLetterSpacing =
                                    value.clamp(-1.0, 2.0).toDouble());
                                NovelReaderKeys.letterSpacing
                                    .set(_novelLetterSpacing);
                              },
                            ),
                            CustomSliderTile(
                              icon: Icons.text_rotation_none_rounded,
                              title: l10n.wordSpacing,
                              description: l10n.spaceBetweenWords,
                              sliderValue: _novelWordSpacing,
                              min: 0.0,
                              max: 5.0,
                              divisions: 25,
                              onChanged: (value) {
                                setState(() => _novelWordSpacing =
                                    value.clamp(0.0, 5.0).toDouble());
                                NovelReaderKeys.wordSpacing.set(_novelWordSpacing);
                              },
                            ),
                            CustomSliderTile(
                              icon: Icons.format_line_spacing_rounded,
                              title: l10n.paragraphSpacing,
                              description: l10n.spaceBetweenParagraphs,
                              sliderValue: _novelParagraphSpacing,
                              min: 8.0,
                              max: 32.0,
                              divisions: 12,
                              onChanged: (value) {
                                setState(() => _novelParagraphSpacing =
                                    value.clamp(8.0, 32.0).toDouble());
                                NovelReaderKeys.paragraphSpacing
                                    .set(_novelParagraphSpacing);
                              },
                            ),
                            CustomSwitchTile(
                              icon: Icons.chrome_reader_mode_rounded,
                              title: l10n.pageReaderMode,
                              description: l10n.readOnePageAtATime,
                              switchValue: _novelPageReaderMode,
                              onChanged: (value) => _setNovelBool(
                                NovelReaderKeys.pageReader,
                                value,
                                () => _novelPageReaderMode = value,
                              ),
                            ),
                            CustomSwitchTile(
                              icon: Icons.play_arrow_rounded,
                              title: l10n.autoScroll,
                              description: l10n.autoScrollContent,
                              switchValue: _novelAutoScroll,
                              onChanged: (value) => _setNovelBool(
                                NovelReaderKeys.autoScroll,
                                value,
                                () => _novelAutoScroll = value,
                              ),
                            ),
                            if (_novelAutoScroll)
                              CustomSliderTile(
                                icon: Icons.speed_rounded,
                                title: l10n.autoScrollSpeed,
                                description: l10n.autoScrollSpeedSeconds,
                                sliderValue: _novelAutoScrollSpeed,
                                min: 1.0,
                                max: 10.0,
                                divisions: 18,
                                onChanged: (value) {
                                  setState(() => _novelAutoScrollSpeed =
                                      value.clamp(1.0, 10.0).toDouble());
                                  NovelReaderKeys.autoScrollSpeed
                                      .set(_novelAutoScrollSpeed);
                                },
                              ),
                            CustomSwitchTile(
                              icon: Iconsax.volume_high,
                              title: l10n.volumeButtonScrolling,
                              description: l10n.useVolumeButtonsToScroll,
                              switchValue: _novelVolumeScrolling,
                              onChanged: (value) => _setNovelBool(
                                NovelReaderKeys.volumeScrolling,
                                value,
                                () => _novelVolumeScrolling = value,
                              ),
                            ),
                            CustomSwitchTile(
                              icon: Icons.touch_app_rounded,
                              title: l10n.tapToScroll,
                              description: l10n.tapTopBottomToScroll,
                              switchValue: _novelTapToScroll,
                              onChanged: (value) => _setNovelBool(
                                NovelReaderKeys.tapToScroll,
                                value,
                                () => _novelTapToScroll = value,
                              ),
                            ),
                            CustomSwitchTile(
                              icon: Icons.swipe_rounded,
                              title: l10n.swipeBetweenChapters,
                              description: l10n.enableChapterSwipeNavigation,
                              switchValue: _novelSwipeGestures,
                              onChanged: (value) => _setNovelBool(
                                NovelReaderKeys.swipeGestures,
                                value,
                                () => _novelSwipeGestures = value,
                              ),
                            ),
                            CustomSwitchTile(
                              icon: Icons.lock_clock_rounded,
                              title: l10n.keepScreenOn,
                              description: l10n.preventScreenFromSleeping,
                              switchValue: _novelKeepScreenOn,
                              onChanged: (value) => _setNovelBool(
                                NovelReaderKeys.keepScreenOn,
                                value,
                                () => _novelKeepScreenOn = value,
                              ),
                            ),
                            CustomSwitchTile(
                              icon: Icons.pie_chart_rounded,
                              title: l10n.showReadingProgress,
                              description: l10n.showCurrentReadingProgress,
                              switchValue: _novelReadingProgress,
                              onChanged: (value) => _setNovelBool(
                                NovelReaderKeys.showReadingProgress,
                                value,
                                () => _novelReadingProgress = value,
                              ),
                            ),
                            CustomSwitchTile(
                              icon: Icons.schedule_rounded,
                              title: l10n.showBatteryTime,
                              description: l10n.showStatusInfoWhileReading,
                              switchValue: _novelBatteryTime,
                              onChanged: (value) => _setNovelBool(
                                NovelReaderKeys.showBatteryTime,
                                value,
                                () => _novelBatteryTime = value,
                              ),
                            ),
                            CustomSwitchTile(
                              icon: Icons.record_voice_over_rounded,
                              title: l10n.enableTTS,
                              description: l10n.readTextAloud,
                              switchValue: _novelTtsEnabled,
                              onChanged: (value) => _setNovelBool(
                                NovelReaderKeys.ttsEnabled,
                                value,
                                () => _novelTtsEnabled = value,
                              ),
                            ),
                            if (_novelTtsEnabled)
                              CustomSliderTile(
                                icon: Icons.slow_motion_video_rounded,
                                title: l10n.ttsSpeed,
                                description: l10n.speechSpeed,
                                sliderValue: _novelTtsSpeed,
                                min: 0.1,
                                max: 1.0,
                                divisions: 9,
                                onChanged: (value) {
                                  setState(() => _novelTtsSpeed =
                                      value.clamp(0.1, 1.0).toDouble());
                                  NovelReaderKeys.ttsSpeed.set(_novelTtsSpeed);
                                },
                              ),
                            if (_novelTtsEnabled)
                              CustomSliderTile(
                                icon: Icons.graphic_eq_rounded,
                                title: l10n.ttsPitch,
                                description: l10n.speechPitch,
                                sliderValue: _novelTtsPitch,
                                min: 0.5,
                                max: 2.0,
                                divisions: 15,
                                onChanged: (value) {
                                  setState(() => _novelTtsPitch =
                                      value.clamp(0.5, 2.0).toDouble());
                                  NovelReaderKeys.ttsPitch.set(_novelTtsPitch);
                                },
                              ),
                            if (_novelTtsEnabled)
                              CustomSwitchTile(
                                icon: Icons.skip_next_rounded,
                                title: l10n.ttsAutoAdvance,
                                description: l10n.automaticallyMoveToNextTextSegment,
                                switchValue: _novelTtsAutoAdvance,
                                onChanged: (value) => _setNovelBool(
                                  NovelReaderKeys.ttsAutoAdvance,
                                  value,
                                  () => _novelTtsAutoAdvance = value,
                                ),
                              ),
                            CustomTile(
                              icon: Icons.restart_alt_rounded,
                              title: l10n.resetNovelReaderSettings,
                              description: l10n.restoreAllNovelReaderDefaults,
                              onTap: _resetNovelDefaults,
                            ),
                          ],
                        ),
                      ),
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
}