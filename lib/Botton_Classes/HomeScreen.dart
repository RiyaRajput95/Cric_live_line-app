import 'package:flutter/material.dart';

import '../Live_MatchClasses/LiveMatchDetailScreen.dart';
import 'MoreDetails.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 1;
  int bottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: bottomIndex == 0
          ? AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        titleSpacing: 15,
        title: Row(
          children: [
            Container(
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.sports_cricket,
                color: Colors.deepPurple,
                size: 20,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              "Cric Live Line",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Roboto",
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      )
          : null,

      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            bottomIndex = index;
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: "Series",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.sports_cricket),
            label: "Matches",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_sharp),
            label: "News",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "More",
          ),
        ],
      ),
    );
  }

  Widget tab(String title, int index) {
    bool selected = selectedTab == index;
    return InkWell(
      onTap: () {
        if (index == 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Featured Coming Soon"),
            ),
          );
        }
        setState(() {
          selectedTab = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 17,
              fontWeight:
              selected ? FontWeight.bold : FontWeight.w500,
              color: selected ? Colors.black : Colors.grey,
            ),
          ),
          const SizedBox(height: 6),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            height: 3,
            width: selected ? 40 : 0,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    switch (bottomIndex) {
      case 0:
        return homeBody();

      case 1:
        return const Center(
          child: Text("Series Screen"),
        );

      case 2:
        return const Center(
          child: Text("Matches Screen"),
        );

      case 3:
        return const Center(
          child: Text("News Screen"),
        );

      case 4:
        return const MoreScreen();

      default:
        return homeBody();
    }
  }
  Widget homeBody() {
    int liveCount = 3;
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              tab("Featured", 0),
              const SizedBox(width: 30),
              tab("Live", 1),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: const [
              MatchCard(
                status: MatchStatus.live,
              ),
              MatchCard(
                status: MatchStatus.upcoming,
              ),

              MatchCard(
                status: MatchStatus.completed,
              ),
              MatchCard(
                status: MatchStatus.FirstInningcomplted,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class MatchCard extends StatelessWidget {
  final MatchStatus status;
  const MatchCard({
    super.key,
    required this.status,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MatchDetailScreen(
                status: status,
              ),
            ),
          );
        },
        child: Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 12),
            child: Row(
              children: [

                const Expanded(
                  child: Text(
                    "The Hundred Women's Competition 2026, 21st Match",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ),

                Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade600,
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Today, 04:00 PM",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Divider(height: 1),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// LEFT TEAM
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Logo + Team Name
                      Column(
                        children: [

                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.red.shade100,
                            child: const Text(
                              "M",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(height: 5),

                          const Text(
                            "MSGW 🏏",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(width: 14),

                      // Score + Overs
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "67-7",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "8.5 Ov",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w300,
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Icon(
                    Icons.flash_on,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 18),
                /// RIGHT TEAM
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Yet to bat
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [

                          Text(
                            "Yet to bat",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 14),
                      // Logo + Team Name
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.red.shade100,
                            child: const Text(
                              "W",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "WelshW",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 5),
          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 10),
            child: Row(
              children: [

                const Expanded(
                  child: Text(
                    "WelshW opt to bowl 🏏",
                    style: TextStyle(
                      color: Color(0xffd68a00),
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(
                    Icons.bar_chart,
                    size: 16,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
        ),
    );
  }
}