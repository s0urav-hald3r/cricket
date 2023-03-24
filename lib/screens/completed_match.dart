import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/size_configs.dart';
import '../controllers/data_controller.dart';
import '../models/match_details.dart';
import '../widgets/match_details.dart';

class CompletedMatch extends StatelessWidget {
  CompletedMatch({Key? key}) : super(key: key);

  final DataController _dataController = Get.find<DataController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isnull = _dataController.matchDetails.value!.data == null;
      List<Matches> matches = [];
      if (!isnull) {
        matches = _dataController.matchDetails.value!.data!.months![0]
            .days![DateTime.now().day - 1].matches!
            .where((e) => e.status == 'completed')
            .toList();
      }
      if (isnull || matches.isEmpty) {
        return Center(
          child: Text(
            'No Match Available !!!',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: SizeConfig.screenWidth! * 0.0375),
          ),
        );
      }
      return SingleChildScrollView(
        child: Column(
          children: matches.map((e) => MatchDetailsCard(match: e)).toList(),
        ),
      );
    });
  }
}
