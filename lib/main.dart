import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    runDartLab();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Пибд-33')),
        body: const Center(child: Text('Лабораторная 2 выполнена!\n(Смотри вывод в консоли)')),
      ),
    );
  }
}


enum FruitType {
  apple,
  banana,
  orange }

extension FormatNum on double {
  String toPrice() => '${toStringAsFixed(1)} руб.';
}

class Fruit {
  final String name;
  final double price;
  final FruitType type;

  Fruit(this.name, this.price, this.type);

  @override
  String toString() => '$name ($type) - ${price.toPrice()}';
}

void runDartLab() async {
  List<Fruit> basket = [
    Fruit('Яблоко', 50.5, FruitType.apple),
    Fruit('Банан', 30.0, FruitType.banana),
    Fruit('Апельсин', 70.0, FruitType.orange),
  ];

  print('--- Список фруктов ---');
  for (var fruit in basket) {
    print(fruit);
  }

  basket.sort((a, b) => a.price.compareTo(b.price));
  print('\n--- Самый дешевый: ${basket.first.name} ---');

  print('\nЗагрузка данных...');
  await Future.delayed(const Duration(seconds: 1));
  print('Данные успешно загружены!');
}