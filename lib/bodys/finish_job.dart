// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:kritegat/model/job_model.dart';
import 'package:kritegat/widget/show_progress.dart';
import 'package:kritegat/widget/show_text.dart';

class FinishJob extends StatefulWidget {
  final String idofficer;
  const FinishJob({
    Key? key,
    required this.idofficer,
  }) : super(key: key);

  @override
  State<FinishJob> createState() => _FinishJobState();
}

class _FinishJobState extends State<FinishJob> {
  var jobModels = <JobModel>[];
  bool load = true;
  bool? havedata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> readData() async {
    String path =
        'https://www.androidthai.in.th/egat/getUserWhereidofficerSuccessincubas.php?isAdd=true&idofficer=${widget.idofficer}';
    await Dio().get(path).then((value) {
      print('value readData ==> $value');

      if (value.toString() == 'null') {
        havedata = false;
      } else {
        havedata = true;
        for (var element in json.decode(value.data)) {
          JobModel jobModel = JobModel.fromMap(element);
          jobModels.add(jobModel);
        }
        load = false;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return load
        ? const ShowProgress()
        : havedata!
            ? GridView.builder(
                itemCount: jobModels.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) => Card(
                      child: Column(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.network(jobModels[index].pathimage),
                          ),
                          ShowText(text: jobModels[index].job),
                        ],
                      ),
                    ))
            : const Center(
                child: ShowText(text: 'No Data'),
              );
  }
}
