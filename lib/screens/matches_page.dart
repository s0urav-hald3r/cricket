import 'package:cricket/screens/completed_match.dart';
import 'package:cricket/screens/live_match.dart';
import 'package:cricket/screens/upcoming_match.dart';
import 'package:flutter/material.dart';

import '../config/app_constants.dart';
import '../config/size_configs.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({Key? key}) : super(key: key);

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage>
    with TickerProviderStateMixin {
  late TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
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
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('My Matches'),
      ),
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            labelPadding:
                const EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 15),
            // ignore: prefer_const_literals_to_create_immutables
            tabs: const [
              Text(
                'Upcoming',
              ),
              Text(
                'Live',
              ),
              Text(
                'Completed',
              ),
            ],
          ),
          Flexible(
            child: TabBarView(controller: _tabController, children: const [
              UpcomingMatch(),
              LiveMatch(),
              CompletedMatch()
            ]),
          )
        ]),
      ),
    );
  }
}
