import 'package:flutter/material.dart';
import 'package:kritegat/bodys/finish_job.dart';
import 'package:kritegat/bodys/non_finish_job.dart';
import 'package:kritegat/utility/my_constant.dart';
import 'package:kritegat/utility/my_dialog.dart';
import 'package:kritegat/widget/show_icon_button.dart';
import 'package:kritegat/widget/show_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myservice extends StatefulWidget {
  const Myservice({Key? key}) : super(key: key);

  @override
  State<Myservice> createState() => _MyserviceState();
}

class _MyserviceState extends State<Myservice> {
  var title = <String>['Non Finish', 'Finish', 'จบการทำงาน'];
  var iconDatas = <IconData>[
    Icons.close,
    Icons.done,
    Icons.menu,
  ];
  var widgets = <Widget>[
    const NonFinishJoB(),
    const FinishJob(),
    const NonFinishJoB(),
  ];
  var bottonNavigator = <BottomNavigationBarItem>[];
  int indexbodys = 0;

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < title.length; i++) {
      bottonNavigator.add(
        BottomNavigationBarItem(
          label: title[i],
          icon: Icon(
            iconDatas[i],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: newAppBar(context),
      body: widgets[indexbodys],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexbodys,
        items: bottonNavigator,
        onTap: (value) {
          setState(() {
            indexbodys = value;
          });
        },
      ),
    );
  }

  AppBar newAppBar(BuildContext context) {
    return AppBar(
      title: ShowText(
        text: title[indexbodys],
        textStyle: MyConstant().h1Style(),
      ),
      elevation: 0,
      foregroundColor: MyConstant.dark,
      backgroundColor: Colors.white,
      actions: [
        ShowIconButton(
            iconData: Icons.exit_to_app,
            pressFunce: () {
              MyDialog(context: context).normalDialog(
                  pressFunc: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    preferences.clear().then((value) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/authen', (route) => false);
                    });
                  },
                  label: 'SignOut',
                  title: 'SignIn',
                  subTitle: 'Please Confirm SignOut');
            })
      ],
    );
  }
}
