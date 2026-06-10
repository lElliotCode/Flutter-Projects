import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 10),
        child: Row(
          children: [
            Icon(Icons.movie_creation_outlined, color: colors.primary),
            const SizedBox(width: 10),
            Text('Cinemapedia', style: titleStyle),

            const Spacer(),

            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
        ),
      ),
    );
  }
}
