import "package:flutter/material.dart";

void main()
{
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: MyButton(),
      ),
    ),
  ));
}

class MyButton extends StatelessWidget{
  const MyButton({super.key});

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onLongPress: (){
        print("My Button Was LongPressed");
      },
      onTap: (){
        print("My Button Was Tapped");
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.lightGreen[500]
        ),
        child: const Center(child: Text("Engage"),),
      ),
    );
  }
}