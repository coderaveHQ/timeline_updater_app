import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:timeline_updater_app_ui/extensions/build_context_x.dart';
import 'package:timeline_updater_app_ui/res/localization/language/tl_language_data.dart';
import 'package:timeline_updater_app_ui/res/localization/language/tl_language_mode.dart';
import 'package:timeline_updater_app_ui/res/localization/tl_localization.dart';
import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_mode.dart';
import 'package:timeline_updater_app_ui/res/theme/spacing/tl_spacing.dart';
import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';
import 'package:timeline_updater_app_ui/res/theme/typography/tl_typography.dart';
import 'package:timeline_updater_app_ui/services/tl_ui_preferences.dart';
import 'package:timeline_updater_app_ui/widgets/tl_app_bar.dart';
import 'package:timeline_updater_app_ui/widgets/tl_radio_button.dart';
import 'package:timeline_updater_app_ui/widgets/tl_scaffold.dart';
import 'package:timeline_updater_app_ui/widgets/tl_text.dart';

/// A custom page for displaying settings
class TLSettingsPage extends StatelessWidget {

  /// An instance to the preferences to handle the default settings
  final TLUIPreferences preferences;

  /// A callback for when the color mode changed
  final void Function(TLColorMode)? onColorModeChanged;

  /// A callback for when the language mode changed
  final void Function(TLLanguageMode)? onLanguageModeChanged;

  /// A list of additional sections
  final List<TLSettingsSection> additionalSections;

  /// Default constructor
  const TLSettingsPage({ 
    super.key,
    required this.preferences,
    this.onColorModeChanged,
    this.onLanguageModeChanged,
    this.additionalSections = const <TLSettingsSection>[]
  });

  @override
  Widget build(BuildContext context) {

    final TLLocalizable translations = TLLocalization.translationsOf(context);
    final TLColorable colors = TLTheme.colorsOf(context);

    return TLScaffold(
      appBar: TLAppBar(
        navigationRailExists: true,
        title: translations.settingsAppBarTitle
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: TLSpacing.lg,
              right: context.rightPadding + TLSpacing.lg
            ),
            child: TLText(
              text: translations.settingsDescription,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: colors.settingsDescription
              )
            )
          ),
          const Gap(TLSpacing.xl),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: TLSpacing.lg,
                right: context.rightPadding + TLSpacing.lg,
                bottom: context.bottomPaddingOrZeroWhenKeyboard + TLSpacing.lg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <_TLSettingsSection>[
                  _TLSettingsSection(
                    isLastSection: false,
                    section: TLSettingsSection(
                      title: translations.settingsAppearanceSectionTitle,
                      description: translations.settingsAppearanceSectionDescription,
                      items: [
                        TLSettingsSectionItem(
                          title: translations.settingsAppearanceSectionItemThemeTitle,
                          child: TLSettingsColorMode(
                            preferences: preferences,
                            onColorModeChanged: onColorModeChanged
                          )
                        )
                      ]
                    ),
                  ),
                  _TLSettingsSection(
                    isLastSection: additionalSections.isEmpty,
                    section: TLSettingsSection(
                      title: translations.settingsLocalizationSectionTitle,
                      description: translations.settingsLocalizationSectionDescription,
                      items: [
                        TLSettingsSectionItem(
                          title: translations.settingsLocalizationSectionItemLanguageTitle,
                          child: TLSettingsLanguageMode(
                            preferences: preferences,
                            onLanguageModeChanged: onLanguageModeChanged
                          )
                        )
                      ]
                    )
                  ),
                  ...List.generate(additionalSections.length, (int index) {
                    final TLSettingsSection section = additionalSections[index];
                    return _TLSettingsSection(
                      isLastSection: index == additionalSections.length - 1,
                      section: section
                    );
                  })
                ]
              )
            )
          )
        ]
      )
    );
  }
}

/// A custom class for displaying a section
class TLSettingsSection {

  /// The title of the section
  final String title;

  /// The description of the section
  final String description;

  /// A list of items
  final List<TLSettingsSectionItem> items;

  /// Default constructor
  const TLSettingsSection({ 
    required this.title,
    required this.description,
    required this.items
  });
}

/// The actual widget of a section
class _TLSettingsSection extends StatelessWidget {

  /// The instance of the section
  final TLSettingsSection section;

  /// Wether this is the last section
  final bool isLastSection;

  /// Default constructor
  const _TLSettingsSection({
    required this.section,
    required this.isLastSection
  });

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TLText(
          text: section.title,
          style: TLTypography.base.copyWith(
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
            color: colors.settingsSectionTitle
          )
        ),
        const Gap(TLSpacing.lg),
        TLText(
          text: section.description,
          style: TLTypography.base.copyWith(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: colors.settingsSectionDescription
          )
        ),
        const Gap(TLSpacing.xl),
        ...section.items,
        if (!isLastSection) const Gap(TLSpacing.xxl)
      ]
    );
  }
}

/// An item containing the widget to be displayed inside a section
class TLSettingsSectionItem extends StatelessWidget {

  /// The title of the item
  final String title;

  /// The main widget
  final Widget child;

  /// Default constructor
  const TLSettingsSectionItem({
    super.key,
    required this.title,
    required this.child
  });

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TLText(
          text: title,
          style: TLTypography.base.copyWith(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: colors.settingsSectionItemTitle
          )
        ),
        const Gap(TLSpacing.lg),
        child
      ]
    );
  }
}

// FIXME Does not refresh correctly

/// A custom widget for the language mode settings
class TLSettingsLanguageMode extends StatelessWidget {

  /// An instance to the preferences to handle the default settings
  final TLUIPreferences preferences;

  /// A callback for when the language mode changed
  final void Function(TLLanguageMode)? onLanguageModeChanged;

  /// Default constructor
  const TLSettingsLanguageMode({ 
    super.key,
    required this.preferences,
    this.onLanguageModeChanged
  });

  Future<void> _handleLanguageModeChanged(TLLanguageMode languageMode) async {
    await preferences.setLanguageMode(languageMode);
    onLanguageModeChanged?.call(languageMode);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(TLLanguageMode.values.length, (int index) {
        final TLLanguageMode languageMode = TLLanguageMode.values[index];
        final bool isSelected = TLLocalization.languageModeOf(context) == languageMode;
        
        return Padding(
          padding: EdgeInsets.only(top: index != 0 ? TLSpacing.lg : 0.0),
          child: TLRadioButton(
            onPressed: () => _handleLanguageModeChanged(languageMode),
            title: languageMode.title(context),
            isSelected: isSelected
          )
        );
      })
    );
  }
}

/// A custom widget for the language mode settings
class TLSettingsColorMode extends StatelessWidget {

  /// An instance to the preferences to handle the default settings
  final TLUIPreferences preferences;

  /// A callback for when the color mode changed
  final void Function(TLColorMode)? onColorModeChanged;

  /// Default constructor
  const TLSettingsColorMode({ 
    super.key,
    required this.preferences,
    this.onColorModeChanged
  });

  Future<void> _handleColorModeChanged(TLColorMode colorMode) async {
    await preferences.setColorMode(colorMode);
    onColorModeChanged?.call(colorMode);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(TLColorMode.values.length, (int index) {
        final TLColorMode colorMode = TLColorMode.values[index];
        final bool isSelected = TLTheme.colorModeOf(context) == colorMode;
        return Padding(
          padding: EdgeInsets.only(top: index != 0 ? TLSpacing.lg : 0.0),
          child: TLRadioButton(
            onPressed: () => _handleColorModeChanged(colorMode),
            title: colorMode.title(context),
            isSelected: isSelected
          )
        );
      })
    );
  }
}