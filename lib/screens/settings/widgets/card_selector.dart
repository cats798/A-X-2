import 'package:anymex/controllers/settings/settings.dart';
import 'package:anymex/l10n/app_localizations.dart';
import 'package:anymex/models/models_convertor/carousel/carousel_data.dart';
import 'package:anymex/utils/fallback/fallback_anime.dart';
import 'package:anymex/utils/function.dart';
import 'package:anymex/widgets/common/cards/base_card.dart';
import 'package:anymex/widgets/common/cards/card_gate.dart';
import 'package:anymex/widgets/custom_widgets/anymex_chip.dart';
import 'package:anymex/widgets/custom_widgets/anymex_dialog.dart';
import 'package:anymex/widgets/custom_widgets/custom_expansion_tile.dart';
import 'package:anymex/widgets/helper/platform_builder.dart';
import 'package:anymex_extension_runtime_bridge/Models/Source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

void showCardStyleSwitcher(BuildContext context) {
  final selectedStyle = CardStyle.values[settingsController.cardStyle].obs;

  showDialog(
    context: context,
    builder: (dialogContext) {
      return Obx(
        () {
          final l10n = AppLocalizations.of(context)!;
          return AnymexDialog(
              title: l10n.cardStyle,
              onConfirm: () {
                settingsController.cardStyle = selectedStyle.value.index;
              },
              contentWidget: CardStyleSelector(
                  onStyleChanged: (e) {
                    selectedStyle.value = e;
                  },
                  initialStyle: selectedStyle.value,
                  sampleData: convertData(trendingAnimes)[0]));
        },
      );
    },
  );
}

class CardStyleSelector extends StatefulWidget {
  final Function(CardStyle) onStyleChanged;
  final CardStyle initialStyle;
  final CarouselData sampleData;

  const CardStyleSelector({
    super.key,
    required this.onStyleChanged,
    required this.initialStyle,
    required this.sampleData,
  });

  @override
  State<CardStyleSelector> createState() => _CardStyleSelectorState();
}

class _CardStyleSelectorState extends State<CardStyleSelector> {
  late CardStyle _selectedStyle;

  String _getStyleDescription(CardStyle style) {
    final l10n = AppLocalizations.of(context)!;
    switch (style) {
      case CardStyle.saikou:
        return l10n.cardStyleSaikouDesc;
      case CardStyle.modern:
        return l10n.cardStyleModernDesc;
      case CardStyle.exotic:
        return l10n.cardStyleExoticDesc;
      default:
        return '';
    }
  }

  String _getStyleName(CardStyle style) {
    final l10n = AppLocalizations.of(context)!;
    switch (style) {
      case CardStyle.saikou:
        return l10n.cardStyleSaikou;
      case CardStyle.modern:
        return l10n.cardStyleModern;
      case CardStyle.exotic:
        return l10n.cardStyleExotic;
      default:
        return style.name.capitalize!;
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedStyle = widget.initialStyle;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          child: SuperListView(
            scrollDirection: Axis.horizontal,
            children: CardStyle.values
                .map((style) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: _buildStyleChip(style),
                    ))
                .toList(),
          ),
        ),
        10.height(),
        AnymexCard(
          enableAnimation: true,
          padding: const EdgeInsets.all(10),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: getCardHeight(_selectedStyle, getPlatform(context)),
              child: MediaCardGate(
                key: ValueKey(_selectedStyle),
                cardStyle: _selectedStyle,
                itemData: widget.sampleData,
                tag: '',
                variant: DataVariant.regular,
                type: ItemType.anime,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          _getStyleDescription(_selectedStyle),
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildStyleChip(CardStyle style) {
    final bool isSelected = style == _selectedStyle;

    return AnymexChip(
      isSelected: isSelected,
      label: _getStyleName(style),
      onSelected: (bool selected) {
        if (selected) {
          setState(() {
            _selectedStyle = style;
          });
          widget.onStyleChanged(style);
        }
      },
    );
  }
}