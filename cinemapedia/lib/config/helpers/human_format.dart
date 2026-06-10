import 'package:intl/intl.dart';

class HumanFormat {
  static String number(double number) {
    // 1. LIMPIEZA: Si es un decimal entre 1 y 999 (como 284.1781),
    // lo multiplicamos por 1000 para transformarlo en un "mil" real (284178.1)
    if (number > 1 && number < 1000 && number.toString().contains('.')) {
      number = number * 1000;
    }

    // 2. FORMATEO CON INTL: Ahora que el número es real,
    // usamos el formateador compacto puro en inglés ('en') para forzar la 'K'
    final formatter = NumberFormat.compact(locale: 'en');

    // Le seteamos el decimal que querés (máximo 1)
    formatter.maximumFractionDigits = 1;
    formatter.minimumFractionDigits =
        0; // Si es entero (1000) muestra "1K", no "1.0K"

    return formatter.format(number);
  }
}
