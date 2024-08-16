import "package:flutter/material.dart";


void main()
{
  runApp(
    const MaterialApp(
      title: "Flutter Tutorial",
      home: TutorialHome(),
      debugShowCheckedModeBanner: false,
    )
  );
}

class TutorialHome extends StatelessWidget{
  const TutorialHome({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(onPressed: null, icon: Icon(Icons.menu), tooltip: "Menu Icon",),
        title: const Text("Example Title"),
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.search), tooltip: "search",)
        ],
      ),
      body: const Center(
        child: Text("Hello, world!"),
      ),
      floatingActionButton: const FloatingActionButton(onPressed: null, tooltip: "ADD", child: Icon(Icons.plus_one),),
    );
  }
}