import 'package:cricket/config/app_constants.dart';
import 'package:cricket/config/size_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CompletedMatch extends StatelessWidget {
  const CompletedMatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
            5,
            (index) => Container(
                  margin: const EdgeInsets.all(20),
                  width: SizeConfig.screenWidth,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15, left: 20, right: 20, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'England Women vs India Women',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: SizeConfig.screenWidth! * 0.0375),
                            ),
                            const Gap(15),
                            Container(
                              width: SizeConfig.screenWidth,
                              height: .5,
                              color: Colors.grey,
                            ),
                            const Gap(15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ENGW',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: SizeConfig.screenWidth! * 0.04),
                                ),
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      'MEGA',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize:
                                              SizeConfig.screenWidth! * 0.04),
                                    )),
                                Text(
                                  'INDW',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: SizeConfig.screenWidth! * 0.04),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: SizeConfig.screenWidth,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppConstants.redColor,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Game Over',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: SizeConfig.screenWidth! * 0.045),
                            ),
                            SvgPicture.asset(
                              'assets/svgs/trophy.svg',
                              height: SizeConfig.screenWidth! * 0.125,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
      ),
    );
  }
}
