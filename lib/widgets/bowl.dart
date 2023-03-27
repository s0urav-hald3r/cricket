import 'package:cricket/widgets/player_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/size_configs.dart';
import '../controllers/data_controller.dart';
import '../models/pick_players.dart';

class BOWL extends StatelessWidget {
  BOWL({Key? key}) : super(key: key);

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
              'Select 2-4 Bowlers',
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
                  .where((element) => element.seasonalRole == 'bowler')
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
                  return PlayerInfo(
                      player: playerList[index],
                      seasonPoints: seasonPoints,
                      creditValue: creditValue);
                });
          })
        ],
      ),
    );
  }
}
