import "package:flutter/material.dart";

void main()
{
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child:Counter()
        ),
      ),
    )
  );
}

class Counter extends StatefulWidget{
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter>
{
  int _counter = 0;

  void _increment()
  {
    setState((){
      _counter ++;
    });

  }
  @override
  Widget build(BuildContext context)
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(onPressed: null, onLongPress: _increment, child: const Text("Increment")),
        const SizedBox(width: 16),
        Text('Count: $_counter')
      ],
    );
  }
}