import 'package:cricket/models/match_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/size_configs.dart';
import '../controllers/data_controller.dart';
import '../widgets/match_details.dart';

class UpcomingMatch extends StatelessWidget {
  UpcomingMatch({Key? key}) : super(key: key);

  final DataController _dataController = Get.find<DataController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isnull = _dataController.matchDetails.value!.data == null;
      List<Matches> matches = [];
      if (!isnull) {
        matches = _dataController.matchDetails.value!.data!.months![0]
            .days![DateTime.now().day - 1].matches!
            .where((e) => e.status == 'notstarted')
            .toList();
      }
      if (isnull || matches.isEmpty) {
        return Center(
          child: Text(
            'No Upcoming Match Available !!!',
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
