import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../config/app_constants.dart';
import '../config/size_configs.dart';
import '../models/pick_players.dart';

class PlayerInfo extends StatelessWidget {
  const PlayerInfo({
    super.key,
    required this.player,
    required this.seasonPoints,
    required this.creditValue,
  });

  final Cricketer player;
  final double seasonPoints;
  final double creditValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black45, width: .1)),
      width: SizeConfig.screenWidth,
      child: Row(
        children: [
          Icon(
            Icons.person_3,
            size: SizeConfig.screenWidth! * 0.075,
          ),
          Gap(SizeConfig.screenWidth! * 0.07),
          SizedBox(
            width: SizeConfig.screenWidth! * 0.3,
            child: Text(
              player.fullname!,
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
  }
}
