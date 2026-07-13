import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/presentation/BLoCs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => CounterBloc(), child: BlocCounterView());
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({super.key});

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(CounterIncreased(value));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC Counter: ${bloc.state.transactionCount}'),
        actions: [
          IconButton(onPressed: () {
            bloc.add(CounterReset());
          }, icon: Icon(Icons.refresh_outlined)),
        ],
      ),

      body: Center(
        child: context.select((CounterBloc counterBloc) {
          return Text('Cubit Counter: ${counterBloc.state.counter}');
        }),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 10,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Text('+3'),
            onPressed: () {
              increaseCounterBy(context, 3);
            },
          ),
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () {
              increaseCounterBy(context, 2);
            },
          ),
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+1'),
            onPressed: () {
              increaseCounterBy(context);
            },
          ),
        ],
      ),
    );
  }
}
