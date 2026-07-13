import 'package:flutter_riverpod/legacy.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Estado
final isDarkModeProvider = StateProvider((ref) => true);

// * Listado de colores inmutable para el estado
final colorListProvider = StateProvider((ref) => colorList);

// Simple int

final selectedColorProvider = StateProvider((ref) => 0);




// * Objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
);

// * Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {

  // ** State > Estado > new AppTTheme();
  // ThemeNotifier(super.state);
  ThemeNotifier(): super( AppTheme() );

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex){
    state = state.copyWith(selectedColor: colorIndex);
  }
}