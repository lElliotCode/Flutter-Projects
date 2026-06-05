import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Progress Screen')),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        children: [
          SizedBox(height: 30),
          Text('Circular Progress Indicator'),
          SizedBox(height: 30),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: colors.surfaceContainerHighest,
          ),

          SizedBox(height: 30),
          Text('Linear Progress Indicator'),
          SizedBox(height: 30),
          LinearProgressIndicator(),

          SizedBox(height: 30),
          Text('Linear Progress Indicator'),
          SizedBox(height: 30),
          _ControlledProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream:
          Stream<double>.periodic(Duration(milliseconds: 100), (value) {
            return (value * 2) / 100;
          }).takeWhile((value) {
            return value <= 1;
          }),
      builder: (context, snapshot) {
        final progressValue = snapshot.data ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: progressValue,
                strokeWidth: 2,
                backgroundColor: Colors.black12,
              ),
              SizedBox(width: 20),
              Expanded(
                child: LinearProgressIndicator(
                  value: progressValue,
                  backgroundColor: Colors.black12,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
