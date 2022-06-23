import 'package:flutter/material.dart';
import 'package:kritegat/bodys/finish_job.dart';
import 'package:kritegat/bodys/non_finish_job.dart';
import 'package:kritegat/utility/my_constant.dart';
import 'package:kritegat/utility/my_dialog.dart';
import 'package:kritegat/widget/show_icon_button.dart';
import 'package:kritegat/widget/show_progress.dart';
import 'package:kritegat/widget/show_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myservice extends StatefulWidget {
  const Myservice({Key? key}) : super(key: key);

  @override
  State<Myservice> createState() => _MyserviceState();
}

class _MyserviceState extends State<Myservice> {
  var title = <String>[
    'Non Finish',
    'Finish',
  ];
  var iconDatas = <IconData>[
    Icons.close,
    Icons.done,
  ];
  var widgets = <Widget>[];
  var bottonNavigator = <BottomNavigationBarItem>[];
  int indexbodys = 0;

  @override
  void initState() {
    super.initState();
    creatNavbar();
    processFindUserLogin();
  }

  Future<void> processFindUserLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var dataLogins = preferences.getStringList('data');
    print('dataLogins ==> $dataLogins');
    widgets.add(NonFinishJoB(dataUserLogins: dataLogins!));
    widgets.add(FinishJob());
    setState(() {});
  }

  void creatNavbar() {
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
      body: widgets.isEmpty ? const ShowProgress() : widgets[indexbodys],
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
      centerTitle: true,
      title: ShowText(
        text: title[indexbodys],
        textStyle: MyConstant().h1Style6(),
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
