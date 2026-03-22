import 'package:anymex/controllers/settings/methods.dart';
import 'package:anymex/controllers/source/source_controller.dart';
import 'package:anymex/database/isar_models/offline_media.dart';
import 'package:anymex/screens/manga/reading_page.dart';
import 'package:anymex/utils/function.dart';
import 'package:anymex/widgets/custom_widgets/custom_expansion_tile.dart';
import 'package:anymex/widgets/custom_widgets/custom_text.dart';
import 'package:anymex/widgets/header.dart';
import 'package:anymex/widgets/custom_widgets/anymex_image.dart';
import 'package:anymex/widgets/helper/platform_builder.dart';
import 'package:anymex/widgets/helper/tv_wrapper.dart';
import 'package:anymex/widgets/non_widgets/snackbar.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:anymex/utils/theme_extensions.dart';
import 'package:get/get.dart';
import 'package:anymex/l10n/app_localizations.dart'; // 添加本地化导入

class MangaHistoryCard extends StatelessWidget {
  final OfflineMedia data;

  const MangaHistoryCard({super.key, required this.data});

  double calculateProgress() {
    return (data.currentChapter?.pageNumber ?? 0) /
        (data.currentChapter?.totalPages ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = context.colors;
    final gradientColors = [
      context.colors.surface.opaque(0.3),
      context.colors.primaryContainer.opaque(0.3),
      context.colors.primaryContainer.opaque(0.8),
    ];

    // 格式化章节显示
    String formatChapterNumber() {
      final episode = data.currentChapter;
      if (episode == null) return '${l10n.chapter} ${l10n.unknown}';
      return '${l10n.chapter} ${episode.number}';
    }

    // 格式化页码显示
    String formatPageInfo() {
      final pageNum = data.currentChapter?.pageNumber ?? 0;
      final totalPages = data.currentChapter?.totalPages ?? 0;
      return '${l10n.page} $pageNum / $totalPages';
    }

    return AnymexCard(
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.colors.primary.opaque(0.3),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16)),
      color: context.colors.secondaryContainer.withAlpha(120),
      child: AnymexOnTap(
        onTap: () {
          if (data.currentChapter == null) {
            snackBar(l10n.errorMissingData, maxLines: 3);
          } else {
            if (data.currentChapter?.sourceName == null) {
              snackBar(l10n.cannotPlayAbruptClose);
            }
            final source = Get.find<SourceController>()
                .getMangaExtensionByName(data.currentChapter!.sourceName!);
            if (source == null) {
              snackBar(l10n.installExtensionFirst
                  .replaceFirst('{sourceName}', data.currentChapter?.sourceName ?? '??'));
            } else {
              navigate(() => ReadingPage(
                    anilistData: convertOfflineToMedia(data),
                    chapterList: data.chapters!,
                    currentChapter: data.currentChapter!,
                    shouldTrack: true,
                  ));
            }
          }
        },
        child: SizedBox(
          height: getResponsiveSize(context, mobileSize: 140, desktopSize: 180),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(children: [
              Positioned.fill(
                child: AnymeXImage(
                  imageUrl: data.cover ?? data.poster!,
                  radius: 0,
                  width: double.infinity,
                ),
              ),
              Positioned.fill(
                child: Blur(
                  blur: 4,
                  blurColor: Colors.transparent,
                  child: Container(),
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: gradientColors)),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: getResponsiveSize(context,
                        mobileSize: 100, desktopSize: 130),
                    height: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.multiplyRadius()),
                        bottomLeft: Radius.circular(16.multiplyRadius()),
                      ),
                      child: AnymeXImage(
                        imageUrl: data.poster!,
                        width: double.infinity,
                        height: double.infinity,
                        radius: 0,
                      ),
                    ),
                  ),
                  // Content
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Chapter number
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(8.multiplyRadius()),
                              color: colorScheme.primary,
                            ),
                            child: AnymexText(
                              text: formatChapterNumber(),
                              size: 12,
                              variant: TextVariant.bold,
                              color: colorScheme.onPrimary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Chapter title
                          AnymexText(
                            text:
                                data.currentChapter?.title ?? data.name ?? '??',
                            size: 15,
                            maxLines: getResponsiveValue(context,
                                mobileValue: 1, desktopValue: 2),
                            variant: TextVariant.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          if (data.name != null &&
                              data.name != data.currentChapter?.title)
                            AnymexText(
                              text: data.name!,
                              size: 14,
                              maxLines: 1,
                              variant: TextVariant.regular,
                              color: colorScheme.onSurface.opaque(0.7),
                              overflow: TextOverflow.ellipsis,
                            ),
                          const Spacer(),
                          // Progress indicator
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnymexText(
                                text: formatPageInfo(),
                                size: 12,
                                color: colorScheme.primary,
                                variant: TextVariant.bold,
                              ),
                              const SizedBox(height: 4),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: LinearProgressIndicator(
                                  value: calculateProgress(),
                                  backgroundColor:
                                      colorScheme.surfaceContainerHighest,
                                  color: colorScheme.primary,
                                  minHeight: 5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}