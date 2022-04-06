import 'package:counter_bloc/bloc/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    context.read<CounterBloc>().add(CounterIncrementEvent());
  }

  void _decrementCounter() {
    context.read<CounterBloc>().add(CounterDecrementEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterBloc, CounterState>(
              listener: (context, state) {
                if (state is IncrementState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(milliseconds: 100),
                      content: Text("Increment")));
                }
                if (state is DecrementState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(milliseconds: 100),
                      content: Text("Decrement")));
                }
              },
              builder: (context, state) {
                return Text(
                  '${state.counterValue}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            FloatingActionButton.extended(
                onPressed: () =>
                    context.read<CounterBloc>().add(CounterIncrementEvent()),
                label: Text('Increment')),
            Spacer(),
            FloatingActionButton.extended(
                onPressed: () =>
                    context.read<CounterBloc>().add(CounterDecrementEvent()),
                label: Text('Decrement')),
          ],
        ),
      ),
    );
  }
}
