import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    final lightIcon = Icon(Icons.light_mode_outlined);
    final darkIcon = Icon(Icons.dark_mode_outlined);

    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod Counter Screen'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((prev) => !prev);
            },
            icon: isDarkMode ? darkIcon : lightIcon,
          ),
        ],
      ),

      body: Center(
        child: Text(
          'Valor: $clickCounter',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).update((prev) => prev + 1);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
