import 'package:cricket/screens/crypto_page.dart';
import 'package:cricket/screens/home_page.dart';
import 'package:cricket/screens/matches_page.dart';
import 'package:cricket/screens/portfolio_page.dart';
import 'package:cricket/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../config/size_configs.dart';
import '../controllers/screen_controller.dart';
import '../utils/screen_data.dart';

const List<ScreenData> allDestinations = <ScreenData>[
  ScreenData(0, 'Home', 'assets/svgs/home.svg'),
  ScreenData(1, 'Matches', 'assets/svgs/matches.svg'),
  ScreenData(2, 'Crypto', 'assets/svgs/cypto.svg'),
  ScreenData(3, 'Portfolio', 'assets/svgs/portfolio.svg'),
  ScreenData(4, 'Profile', 'assets/svgs/profile.svg'),
];

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> with SingleTickerProviderStateMixin {
  late TabController tabController;
  final ScreenController _screenController = Get.find<ScreenController>();

  @override
  initState() {
    super.initState();
    tabController = TabController(length: allDestinations.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      bottomNavigationBar: Obx(() => SizedBox(
            height: (kBottomNavigationBarHeight * 1.25) +
                SizeConfig.safeAreaBottom!,
            child: BottomAppBar(
              child: TabBar(
                  indicator: const UnderlineTabIndicator(
                      insets: EdgeInsets.fromLTRB(
                          0, 0, 0, kBottomNavigationBarHeight * 1.25),
                      borderSide: BorderSide(
                        width: 1,
                      )),
                  onTap: (index) => _screenController.changeScreenIndex(index),
                  controller: tabController,
                  tabs: allDestinations
                      .map((e) => Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                e.svgPath,
                                height: SizeConfig.screenWidth! * 0.06,
                                color: _screenController.screenIndex ==
                                        allDestinations.indexOf(e)
                                    ? Colors.black
                                    : Colors.black38,
                              ),
                              Text(
                                e.title,
                                style: TextStyle(
                                    color: _screenController.screenIndex ==
                                            allDestinations.indexOf(e)
                                        ? Colors.black
                                        : Colors.black38,
                                    fontWeight: _screenController.screenIndex ==
                                            allDestinations.indexOf(e)
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                    fontSize: SizeConfig.screenWidth! * 0.028),
                              )
                            ],
                          ))
                      .toList()),
            ),
          )),
      body: Obx(() => IndexedStack(
              index: _screenController.screenIndex,
              children: const [
                HomePage(),
                MatchesPage(),
                CryptoPage(),
                PortfolioPage(),
                ProfilePage()
              ])),
    );
  }
}
