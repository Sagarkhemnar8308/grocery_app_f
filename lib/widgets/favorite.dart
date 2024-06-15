import 'package:flutter/material.dart';
import 'package:grocery_app/constant/colors.dart';
import 'package:grocery_app/constant/images.dart';
import 'package:grocery_app/util/textstyles.dart';
import 'package:grocery_app/widgets/icon_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({super.key});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: white,
      child: ListTile(
        leading: Image.asset(manBackgroundimg),
        title: TextWidget(text: 'text', style: defaultTextstyle,),
        subtitle: TextWidget(text: 'textsubtitle',style: defaultTextstyle,),
        trailing: Wrap(
          children: [
             TextWidget(text: 'text', style: defaultTextstyle,),
             IconWidget(icon: Icons.navigate_next_rounded)
          ],
        ),
      ),
    );
  }
}