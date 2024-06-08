import 'package:flutter/material.dart';
import 'package:grocery_app/constant/colors.dart';
import 'package:grocery_app/widgets/favorite.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        backgroundColor: white,
        title: const TextWidget(text: 'Favorite'),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          FavoriteCard(),
        ],
      ),
    );
  }
}