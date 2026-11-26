import 'package:flutter/material.dart';
import '../../domain/models/card_data.dart';
import '../details_page/details_page.dart';
import 'card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Color _color = Colors.blueAccent;

  // Наши данные
  final List<CardData> data = [
    CardData(
      'King',
      descriptionText: 'Король киберпанков',
      fullDescription: 'Уже не тот',
      icon: Icons.star,
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_FUvB2SwGvVc0nLdWHy8ykl6HYjpsuHFV9llijkPJBQ&s=10',
    ),
    CardData(
      'Roman',
      descriptionText: 'Оператор',
      fullDescription: 'оператор всегда выживает',
      icon: Icons.videocam,
      imageUrl: 'https://www.cyberpunk.net/build/images/edgerunners2/characters/roman-7104f5a9.png',
    ),
    CardData(
      'D',
      descriptionText: 'Нетраннер',
      fullDescription: 'плюсы - девочка-шиза, минусы - помер (под вопросом)',
      icon: Icons.memory,
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnCk2Kul96EteOISI2eEmEnwtE43m9OTilLEkM9tlnjQ&s',
    ),
    CardData(
      'Talia',
      descriptionText: 'Из мальстрема',
      fullDescription: 'Need more chrome',
      icon: Icons.gps_fixed,
      imageUrl: 'https://static.wikia.nocookie.net/cyberpunk8149/images/5/59/%D0%A2%D0%B0%D0%BB%D0%B8%D1%8F_%D0%AF%D0%BD%D0%B3.png/revision/latest/smart/width/250/height/250?cb=20260629162444&path-prefix=ru',
    ),
  ];

  // Функция показа снекбара
  void _showSnackBar(BuildContext context, String title, bool isLiked) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '$title ${isLiked ? 'liked!' : 'disliked :('}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          backgroundColor: Colors.blueAccent,
          duration: const Duration(seconds: 1),
        ),
      );
    });
  }

  // Функция навигации
  void _navToDetails(BuildContext context, CardData cardData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(cardData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: data.map((e) {
              return CardWidget(
                data: e,
                onLike: (title, isLiked) => _showSnackBar(context, title, isLiked),
                onTap: () => _navToDetails(context, e),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}