import 'package:cricket/config/size_configs.dart';
import 'package:cricket/widgets/ar.dart';
import 'package:cricket/widgets/bat.dart';
import 'package:cricket/widgets/bowl.dart';
import 'package:cricket/widgets/wk.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../config/app_constants.dart';

class PickPlayers extends StatefulWidget {
  const PickPlayers({Key? key}) : super(key: key);

  @override
  State<PickPlayers> createState() => _PickPlayersState();
}

class _PickPlayersState extends State<PickPlayers>
    with TickerProviderStateMixin {
  late TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Preview',
              style: TextStyle(
                  fontSize: SizeConfig.screenWidth! * 0.0375,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              '19 hrs 6 min 12 sec left',
              style: TextStyle(
                  fontSize: SizeConfig.screenWidth! * 0.035,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      body: SizedBox(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Column(
          children: [
            Container(
              color: Colors.black,
              width: SizeConfig.screenWidth,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Max 7 players from a team',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.screenWidth! * 0.0425,
                          fontWeight: FontWeight.w700),
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Players',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: SizeConfig.screenWidth! * 0.0425,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              '0',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: SizeConfig.screenWidth! * 0.04,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'NAM',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: SizeConfig.screenWidth! * 0.0425,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              '0',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: SizeConfig.screenWidth! * 0.04,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'PNG',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: SizeConfig.screenWidth! * 0.0425,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              '0',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: SizeConfig.screenWidth! * 0.04,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Credits Left',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: SizeConfig.screenWidth! * 0.0425,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              '100.0',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: SizeConfig.screenWidth! * 0.04,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ],
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          11,
                          (index) => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                              )),
                    )
                  ],
                ),
              ),
            ),
            TabBar(
              isScrollable: false,
              controller: _tabController,
              indicatorColor: AppConstants.redColor,
              indicatorWeight: 4,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.black,
              labelStyle: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1,
                  fontSize: SizeConfig.screenWidth! * 0.04,
                  fontWeight: FontWeight.w700),
              unselectedLabelColor: Colors.black45,
              unselectedLabelStyle: TextStyle(
                  color: Colors.black45,
                  letterSpacing: 1,
                  fontSize: SizeConfig.screenWidth! * 0.04,
                  fontWeight: FontWeight.w600),
              labelPadding: const EdgeInsets.only(
                  right: 15, left: 15, top: 20, bottom: 20),
              // ignore: prefer_const_literals_to_create_immutables
              tabs: const [
                Text(
                  'WK',
                ),
                Text(
                  'BAT',
                ),
                Text(
                  'AR',
                ),
                Text(
                  'BOWL',
                ),
              ],
            ),
            Flexible(
              child: TabBarView(
                  controller: _tabController,
                  children: const [WK(), BAT(), AR(), BOWL()]),
            )
          ],
        ),
      ),
    );
  }
}
