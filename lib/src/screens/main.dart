import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Угадай страну"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlipCard(
              front: Container(
                width: 280,
                height: 200,
                color: Colors.blue,
                child: const Center(
                  child: Text("Flag"),
                ),
              ),
              back: Container(
                width: 280,
                height: 200,
                color: Colors.red,
                child: const Center(
                  child: Text("Country"),
                ),
              ),
            ),
            Text(
              "Country",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
