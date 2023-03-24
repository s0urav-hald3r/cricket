import 'package:cricket/config/size_configs.dart';
import 'package:cricket/widgets/ar.dart';
import 'package:cricket/widgets/bat.dart';
import 'package:cricket/widgets/bowl.dart';
import 'package:cricket/widgets/wk.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../config/app_constants.dart';
import '../controllers/data_controller.dart';

class PickPlayers extends StatefulWidget {
  final String? matchKey;
  const PickPlayers({Key? key, required this.matchKey}) : super(key: key);

  @override
  State<PickPlayers> createState() => _PickPlayersState();
}

class _PickPlayersState extends State<PickPlayers>
    with TickerProviderStateMixin {
  late TabController? _tabController;
  final DataController _dataController = Get.find<DataController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Add Your Code here.
      _dataController.fetchPickPlayersDetails(widget.matchKey ?? '');
    });
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
        body: Obx(
          () {
            int wk = 0;
            int bat = 0;
            int ar = 0;
            int bowl = 0;

            if (_dataController.isLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppConstants.redColor,
                ),
              );
            }

            return SizedBox(
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
                                        fontSize:
                                            SizeConfig.screenWidth! * 0.0425,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    '0',
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize:
                                            SizeConfig.screenWidth! * 0.04,
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
                                        fontSize:
                                            SizeConfig.screenWidth! * 0.0425,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    '0',
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize:
                                            SizeConfig.screenWidth! * 0.04,
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
                                        fontSize:
                                            SizeConfig.screenWidth! * 0.0425,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    '0',
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize:
                                            SizeConfig.screenWidth! * 0.04,
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
                                        fontSize:
                                            SizeConfig.screenWidth! * 0.0425,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    '100.0',
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize:
                                            SizeConfig.screenWidth! * 0.04,
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
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
                        fontSize: SizeConfig.screenWidth! * 0.0325,
                        fontWeight: FontWeight.w700),
                    unselectedLabelColor: Colors.black45,
                    unselectedLabelStyle: TextStyle(
                        color: Colors.black45,
                        letterSpacing: 1,
                        fontSize: SizeConfig.screenWidth! * 0.0325,
                        fontWeight: FontWeight.w600),
                    labelPadding: const EdgeInsets.only(
                        right: 12.5, left: 12.5, top: 20, bottom: 20),
                    // ignore: prefer_const_literals_to_create_immutables
                    tabs: [
                      Text(
                        'WK ($wk)',
                      ),
                      Text(
                        'BAT ($bat)',
                      ),
                      Text(
                        'AR ($ar)',
                      ),
                      Text(
                        'BOWL ($bowl)',
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
            );
          },
        ));
  }
}
