import 'package:common/common.dart';
import 'package:flutter/material.dart';

extension $ThemeString on ThemeMode {
  String get rawValue {
    switch (this) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return '';
    }
  }

  String get title {
    switch (this) {
      case ThemeMode.light:
        return 'Tema Chiaro';
      case ThemeMode.dark:
        return 'Tema Scuro';
      case ThemeMode.system:
        return '';
    }
  }
}

extension $ThemeMode on String {
  ThemeMode get mode {
    switch (this) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.light;
    }
  }
}

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  late ThemeMode _selectedTheme;
  final possibleThemes = [ThemeMode.light, ThemeMode.dark];

  @override
  void initState() {
    super.initState();
    _selectedTheme = ThemeModeProvider.instance.currentTheme;
  }

  void _onUpdateTheme(ThemeMode mode) {
    PersistenceManager.instance.setValue<String>(
      PersistenceKeys.activeTheme,
      mode.rawValue,
    );
    if (mode != _selectedTheme) {
      setState(() => _selectedTheme = mode);

      ThemeModeProvider.instance.toggleTheme();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: const DefaultAppBar(title: 'Tema'),
      body: Column(
        children: [
          const SizedBox(height: 20),
          TitleDescriptionWidget(
            title: 'Puoi cambiare il tema dell\'app',
            titleTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onBackground),
            description:
                'Per una migliore esperienza utente, qui puoi decidere come impostare l\'aspetto dell\'applicazione.',
            descriptionTextStyle: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(
                    fontSize: Dimension.pt16,
                    color: Theme.of(context).colorScheme.onBackground),
          ),
          ...possibleThemes
              .map(
                (theme) => Column(
                  children: [
                    const SizedBox(height: 20),
                    TitleDescriptionControlWidget(
                      title: theme.title,
                      value: theme.rawValue,
                      possibleValues: [_selectedTheme.rawValue],
                      onChanged: (themeMode) => _onUpdateTheme(themeMode.mode),
                      height: 50,
                    ),
                  ],
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
