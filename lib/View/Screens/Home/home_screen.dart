import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shop/Constant/colors.dart';
import 'package:online_shop/Constant/height_width.dart';
import 'package:online_shop/Helper/helper.dart';
import 'package:online_shop/Model/sneakers.dart';
import 'package:online_shop/View/Screens/Home/tab_bar_view.dart';
import 'package:online_shop/View/Widgets/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late Future<List<Sneaker>> menSneaker;
late Future<List<Sneaker>> womenSneaker;
late Future<List<Sneaker>> kidsSneaker;

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  @override
  void initState() {
    super.initState();
    menSneaker = loadMenSneakers();
    womenSneaker = loadWomenSneakers();
    kidsSneaker = loadKidsSneakers();
  }

  Future<List<Sneaker>> loadMenSneakers() async {
    return await Helper.getMenSneakers();
  }

  Future<List<Sneaker>> loadWomenSneakers() async {
    return await Helper.getWomenSneakers();
  }

  Future<List<Sneaker>> loadKidsSneakers() async {
    return await Helper.getKidsSneakers();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Stack(
        children: [
          Container(
            height: height(0.4, context),
            padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.fill)),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Athletics shoes",
                    style: GoogleFonts.robotoSerif(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        color: whiteColor),
                  ),
                  Text(
                    "Collections",
                    style: GoogleFonts.robotoSerif(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        color: whiteColor),
                  ),
                  TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: transparent,
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: whiteColor,
                      unselectedLabelColor: greyColor.withOpacity(0.3),
                      dividerColor: transparent,
                      labelStyle: textStyle(24, whiteColor, FontWeight.bold),
                      tabs: const [
                        Tab(text: "Men's Shoes"),
                        Tab(text: "Women Shoes"),
                        Tab(text: "Kid's Shoes"),
                      ]),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height(0.275, context)),
            child: TabBarView(controller: _tabController, children: [
              TabView(sneakers: menSneaker),
              TabView(sneakers: womenSneaker),
              TabView(sneakers: kidsSneaker)
            ]),
          ),
        ],
      ),
    );
  }
}
