import 'package:flutter/material.dart';
import 'package:grocery_app/constant/colors.dart';
import 'package:grocery_app/widgets/searchtextformfield.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: white,
        title: TextWidget(text: 'Find Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SearchTextFormField(),
            
          ],
        ),
      ),
    );
  }
}