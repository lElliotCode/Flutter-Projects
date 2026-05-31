import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_sceen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buttons Screen')),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () { context.pop(); },
        child: Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SizedBox(
          child: Wrap(
            spacing: 10,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (){}, 
                child: Text('Elevated')
              ),
              ElevatedButton(
                onPressed: null, 
                child: Text('Elevated Disabled')
              ),
              ElevatedButton.icon(
                onPressed: (){}, 
                icon: Icon(Icons.access_alarm_rounded),
                label: Text('Elevated.icon')
              ),

              FilledButton(
                onPressed: (){}, 
                child: Text('Filled')
              ),
              FilledButton.icon(
                onPressed: (){}, 
                icon: Icon(Icons.accessibility_new_sharp),
                label: Text('Filled.icon')
              ),
              FilledButton.tonal(
                onPressed: (){},
                child: Text('Filled.tonal'),
              ),

              OutlinedButton(
                onPressed: (){},
                child: Text('Outlined')
              ),
              OutlinedButton.icon(
                onPressed: (){},
                icon: Icon(Icons.terminal_outlined),
                label: Text('Outlined')
              ),

              TextButton(
                onPressed: (){}, 
                child: Text('Text')
              ),
              TextButton.icon(
                onPressed: (){}, 
                icon: Icon(Icons.wallet),
                label: Text('Text.icon')
              ),

              IconButton(
                onPressed: (){}, 
                icon: Icon(Icons.zoom_in_sharp)
              ),
              IconButton(
                onPressed: (){}, 
                icon: Icon(Icons.zoom_in_sharp),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(colors.tertiaryContainer)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
