// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kritegat/model/job_model.dart';
import 'package:kritegat/states/datail.dart';
import 'package:kritegat/utility/my_calculate.dart';
import 'package:kritegat/utility/my_constant.dart';
import 'package:kritegat/widget/show_progress.dart';

import 'package:kritegat/widget/show_text.dart';

class NonFinishJoB extends StatefulWidget {
  final List<String> dataUserLogins;
  const NonFinishJoB({
    Key? key,
    required this.dataUserLogins,
  }) : super(key: key);

  @override
  State<NonFinishJoB> createState() => _NonFinishJoBState();
}

class _NonFinishJoBState extends State<NonFinishJoB> {
  var dataUserLogin = <String>[];
  var jobModels = <JobModel>[];

  @override
  void initState() {
    super.initState();
    dataUserLogin = widget.dataUserLogins;
    readDataJob();
  }

  Future<void> readDataJob() async {
    if (jobModels.isNotEmpty) {
      jobModels.clear();
    }

    String idofficer = dataUserLogin[0];
    String path =
        'https://www.androidthai.in.th/egat/getUserWhereidofficerincubas.php?isAdd=true&idofficer=$idofficer';

    await Dio().get(path).then((value) {
      print('value ===> $value');

      var result = json.decode(value.data);
      for (var element in result) {
        JobModel jobModel = JobModel.fromMap(element);
        print('detali ===> ${jobModel.detali}');

        if (jobModel.status == 'start') {
          jobModels.add(jobModel);
        }
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          showTitle(head: 'ชื่อพนักงาน', value: dataUserLogin[1]),
          showTitle(head: 'ตำแหน่ง', value: dataUserLogin[2]),
          jobModels.isEmpty
              ? const ShowProgress()
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: jobModels.length,
                  itemBuilder: (contiext, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Detail(jobModel: jobModels[index]),
                          )).then((value) {
                        readDataJob();
                      });
                    },
                    child: showTitle(
                        head: 'job',
                        value: jobModels[index].job,
                        detali: Mycalulate()
                            .cutWord(word: jobModels[index].detali)),
                  ),
                ),
        ],
      ),
    );
  }

  Card showTitle(
      {required String head, required String value, String? detali}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ShowText(
                    text: head,
                    textStyle: MyConstant().h2Style(),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ShowText(
                    text: value,
                    textStyle: MyConstant().h2Style(),
                  ),
                ),
              ],
            ),
            detali == null
                ? const SizedBox()
                : Container(
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ShowText(
                        text: detali,
                        textStyle: MyConstant().h1Style5(),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
