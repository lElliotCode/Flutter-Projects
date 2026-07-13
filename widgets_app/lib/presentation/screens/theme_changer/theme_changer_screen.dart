// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static final name = 'change-theme';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    final lightIcon = Icon(Icons.light_mode_outlined);
    final darkIcon = Icon(Icons.dark_mode_outlined);

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Changer'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((isDark) => !isDark);
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
            icon: isDarkMode ? darkIcon : lightIcon,
          ),
        ],
      ),

      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];
        return RadioListTile(
          value: index,
          // ignore: duplicate_ignore
          // ignore: deprecated_member_use
          groupValue: selectedColor,
          title: Text('Este Color ', style: TextStyle(color: color)),
          subtitle: Text('${color.value}'),
          activeColor: color,
          onChanged: (value) {
            // ref.read(selectedColorProvider.notifier).state = value!;
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index);
          },
        );
      },
    );
  }
}
