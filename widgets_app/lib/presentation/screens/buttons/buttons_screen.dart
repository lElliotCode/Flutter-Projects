import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buttons Screen')),
      body: _ButtonsViews(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsViews extends StatelessWidget {
  const _ButtonsViews();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('Elevated')),
            ElevatedButton(onPressed: null, child: Text('Disabled')),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text('Elevated.icon'),
            ),

            TextButton(onPressed: () {}, child: Text('Text Button')),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add_link_sharp),
              label: Text('Text.icon'),
            ),

            FilledButton(onPressed: () {}, child: Text('Filled')),
            FilledButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add_business_outlined),
              label: Text('Filled.icon'),
            ),

            OutlinedButton(onPressed: () {}, child: Text('Outlined ')),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add_reaction_rounded),
              label: Text('Outlined.icon'),
            ),

            CustomButton(),

            IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_balance_outlined),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  colors.onTertiaryContainer,
                ),
                iconColor: WidgetStatePropertyAll(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 15.0,
            ),
            child: const Text(
              'Custom Button',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
