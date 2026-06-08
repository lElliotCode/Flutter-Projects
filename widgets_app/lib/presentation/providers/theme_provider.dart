

import 'package:flutter_riverpod/legacy.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Estado
final isDarkModeProvider = StateProvider((ref) => true);

// * Listado de colores inmutable para el estado
final colorListProvider = StateProvider((ref) => colorList);

// Simple int

final StateProvider<int> selectedColorProvider = StateProvider((ref) => 0);
