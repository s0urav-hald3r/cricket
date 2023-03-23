import 'package:cricket/config/app_constants.dart';
import 'package:cricket/config/size_configs.dart';
import 'package:cricket/controllers/screen_controller.dart';
import 'package:cricket/utils/init_app.dart';
import 'package:cricket/utils/screen_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

void main() async {
  await initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cricket .',
      home: AppPage(),
    );
  }
}

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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}

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

class UpcomingMatch extends StatelessWidget {
  const UpcomingMatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Upcoming Match'),
      ),
    );
  }
}

class LiveMatch extends StatelessWidget {
  const LiveMatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Live Match'),
      ),
    );
  }
}

class CompletedMatch extends StatelessWidget {
  const CompletedMatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Completed Match'),
      ),
    );
  }
}

class CryptoPage extends StatelessWidget {
  const CryptoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Crypto Page'),
      ),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Protfolio Page'),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Profile Page'),
      ),
    );
  }
}
