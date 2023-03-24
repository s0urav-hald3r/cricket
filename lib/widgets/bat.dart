import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../config/app_constants.dart';
import '../config/size_configs.dart';
import '../controllers/data_controller.dart';
import '../models/pick_players.dart';

class BAT extends StatelessWidget {
  BAT({Key? key}) : super(key: key);

  final DataController _dataController = Get.find<DataController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: SizeConfig.screenWidth,
            padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
            color: Colors.grey.shade300,
            child: Text(
              'Select 3-6 Batters',
              style: TextStyle(
                  fontSize: SizeConfig.screenWidth! * 0.0375,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            width: SizeConfig.screenWidth,
            padding:
                const EdgeInsets.only(left: 20, top: 5, bottom: 5, right: 20),
            child: Row(
              children: [
                const Spacer(flex: 7),
                Text(
                  'SELECTED BY',
                  style: TextStyle(
                      fontSize: SizeConfig.screenWidth! * 0.035,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(flex: 6),
                Text(
                  'POINTS',
                  style: TextStyle(
                      fontSize: SizeConfig.screenWidth! * 0.035,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(flex: 3),
                Text(
                  'CREDITS',
                  style: TextStyle(
                      fontSize: SizeConfig.screenWidth! * 0.035,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
          Obx(() {
            List<Cricketer> playerList = [];
            if (_dataController.pickPlayers.value!.data != null) {
              playerList = _dataController
                  .pickPlayers.value!.data!.players!.cricketer!
                  .where((element) => element.seasonalRole == 'batsman')
                  .toList();
            }
            return ListView.builder(
                shrinkWrap: true,
                itemCount: playerList.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  double creditValue = _dataController
                      .pickPlayers.value!.data!.fantasyPoints!
                      .firstWhere(
                          (element) => element.player == playerList[index].key)
                      .creditValue!;
                  double seasonPoints = _dataController
                      .pickPlayers.value!.data!.fantasyPoints!
                      .firstWhere(
                          (element) => element.player == playerList[index].key)
                      .seasonPoints!;
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45, width: .1)),
                    width: SizeConfig.screenWidth,
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_2,
                          size: SizeConfig.screenWidth! * 0.075,
                        ),
                        Gap(SizeConfig.screenWidth! * 0.075),
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.3,
                          child: Text(
                            playerList[index].fullname!,
                            style: TextStyle(
                                fontSize: SizeConfig.screenWidth! * 0.035,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Gap(SizeConfig.screenWidth! * 0.06),
                        SizedBox(
                            width: SizeConfig.screenWidth! * 0.125,
                            child: Center(
                              child: Text(
                                seasonPoints.toString(),
                                style: TextStyle(
                                    fontSize: SizeConfig.screenWidth! * 0.035,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                        Gap(SizeConfig.screenWidth! * 0.05),
                        Row(
                          children: [
                            SizedBox(
                              width: SizeConfig.screenWidth! * 0.1,
                              child: Center(
                                child: Text(
                                  creditValue.toString(),
                                  style: TextStyle(
                                      fontSize: SizeConfig.screenWidth! * 0.035,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            const Gap(10),
                            DottedBorder(
                              color: AppConstants.redColor,
                              strokeWidth: 1,
                              borderType: BorderType.Circle,
                              child: Icon(Icons.add,
                                  color: AppConstants.redColor,
                                  size: SizeConfig.screenWidth! * 0.075),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                });
          })
        ],
      ),
    );
  }
}
