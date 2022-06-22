// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ShowIconButton extends StatelessWidget {
  final IconData iconData;
  final Function() pressFunce;
  const ShowIconButton({
    Key? key,
    required this.iconData,
    required this.pressFunce,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: pressFunce, icon: Icon(iconData));
  }
}
