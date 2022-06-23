// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kritegat/utility/my_constant.dart';
import 'package:kritegat/widget/show_image.dart';
import 'package:kritegat/widget/show_text.dart';
import 'package:kritegat/widget/show_text_button.dart';

class MyDialog {
  final BuildContext context;
  MyDialog({
    required this.context,
  });

  Future<void> normalDialog({
    required String title,
    required String subTitle,
    String? label,
    Function()? pressFunc,
    String? label2,
    Function()? pressFunc2,
  }) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: ListTile(
          leading: SizedBox(
            width: 80,
            child: ShowImage(),
          ),
          title: ShowText(
            text: title,
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowText(
            text: subTitle,
            textStyle: MyConstant().h3Style(),
          ),
        ),
        actions: [
          pressFunc == null
              ? ShowtextButton(
                  label: 'OK',
                  pressFunc: () {
                    Navigator.pop(context);
                  })
              : ShowtextButton(label: label!, pressFunc: pressFunc),
          pressFunc2 == null
              ? const SizedBox()
              : ShowtextButton(label: label2!, pressFunc: pressFunc2),
        ],
      ),
    );
  }
}
