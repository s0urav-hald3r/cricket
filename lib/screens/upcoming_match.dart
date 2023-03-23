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
      if (_dataController.matchDetails.value!.data == null ||
          _dataController.matchDetails.value!.data!.months![0]
              .days![DateTime.now().day - 1].matches!.isEmpty) {
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
          children: _dataController.matchDetails.value!.data!.months![0]
              .days![DateTime.now().day - 1].matches!
              .map((e) => e.status == 'notstarted'
                  ? MatchDetailsCard(match: e)
                  : const SizedBox())
              .toList(),
        ),
      );
    });
  }
}
