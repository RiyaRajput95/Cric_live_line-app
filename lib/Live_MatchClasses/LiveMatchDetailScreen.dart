import 'package:flutter/material.dart';

import 'InfomatchDetalis.dart';
class MatchDetailScreen extends StatefulWidget {

  final MatchStatus status;
  const MatchDetailScreen({
    super.key,
    required this.status,
  });

  @override
  State<MatchDetailScreen> createState() =>
      _MatchDetailScreenState();
}

enum MatchStatus {
  live,
  upcoming,
  completed,
  FirstInningcomplted,
}
class _MatchDetailScreenState extends State<MatchDetailScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("MSGW vs WelshW"),
        ),
        body: DefaultTabController(
          length: 6,
          child: Column(
            children: [
              //tab list
              Container(
                height: 50,
                color: Colors.white,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      tab("Info", 0),
                      const SizedBox(width: 24),
                      tab("Live", 1),
                      const SizedBox(width: 24),
                      tab("Commentary", 2),
                      const SizedBox(width: 24),
                      tab("Scorecard", 3),
                      const SizedBox(width: 24),
                      tab("History", 4),
                      const SizedBox(width: 24),
                      tab("Points Table", 5),
                    ],
                  ),
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: IndexedStack(
                  index: selectedIndex,
                  children: [
                    // const Center(child: Text("Info")),
                    const InfoPage(),
                    getMatchPage(),
                    const Center(child: Text("Commentary")),
                    const Center(child: Text("Scorecard")),
                    const Center(child: Text("History")),
                    const Center(child: Text("Points Table")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
///tab selcted
  Widget tab(String title, int index) {
    bool selected = selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: selected ? Colors.black : Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            width: selected ? 30 : 0,
            height: 2,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
  /// matchstatuslive
  Widget getMatchPage() {
    switch (widget.status) {
      case MatchStatus.live:
        return const LivePage();

      case MatchStatus.upcoming:
        return const UpcomingPage();

      case MatchStatus.completed:
        return const CompletedPage();
      case MatchStatus.FirstInningcomplted:
        return const FirstInningcomplted();
    }

  }
}
  ///live details
class LivePage extends StatelessWidget {
  const LivePage({super.key});

  @override
  Widget build(BuildContext context) {

    final balls = [
      "3",
      "1",
      "W",
      "0",
      "5",
      "0",
      "",
      "",
      "",
      "",
      "",
      "0"
    ];

    return SingleChildScrollView(
      child: Column(
        children: [

          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [

                Container(
                  height: 170,
                  width: double.infinity,
                  color: Colors.black,
                  child: Stack(
                    children: [

                      const Positioned(
                        top: 10,
                        left: 10,
                        child: Icon(
                          Icons.volume_off,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),

                      const Center(
                        child: Text(
                          "0",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Positioned(
                        top: 10,
                        right: 10,
                        child: Row(
                          children: const [

                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.red,
                            ),

                            SizedBox(width: 5),

                            Text(
                              "Live",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: const Text(
                    "MSGW 46-6 (56 b)",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                /// over run list card
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 42,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: balls.length,
                        itemBuilder: (context, index) {
                          final value = balls[index];

                          Color bg = Colors.white;
                          Color txt = Colors.black;

                          if (value == "1") {
                            bg = Colors.green;
                            txt = Colors.white;
                          } else if (value == "W") {
                            bg = Colors.red;
                            txt = Colors.white;
                          } else if (value == "4") {
                            bg = Colors.blue;
                            txt = Colors.white;
                          } else if (value == "0") {
                            bg = Colors.grey.shade200;
                          }

                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: bg,
                              child: value.isEmpty
                                  ? Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey),
                                ),
                              )
                                  : Text(
                                value,
                                style: TextStyle(
                                  color: txt,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                /// win probability card
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD), // Apna color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [

                      // Runs Per Ball
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                        child: Row(
                          children: const [
                            Text(
                              "Runs Per Ball: 0.83",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "Balls Rem: 44",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Divider(height: 1),

                      // Win Probability
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                        child: Row(
                          children: [

                            const Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    "Win Probability",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(Icons.info_outline, size: 18),
                                ],
                              ),
                            ),

                            const Text("WelshW:"),

                            const SizedBox(width: 10),

                            statBox("09", const Color(0xfffde6ef), Colors.pink),

                            const SizedBox(width: 8),

                            statBox("10", const Color(0xffe6fbfb), Colors.teal),

                          ],
                        ),
                      ),

                      const Divider(height: 1),

                      // 75 Ball Runs
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                        child: Row(
                          children: [

                            const Expanded(
                              child: Text(
                                "75 Ball Runs:",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),

                            statBox("66", const Color(0xfffde6ef), Colors.pink),

                            const SizedBox(width: 8),

                            statBox("67", const Color(0xffe6fbfb), Colors.teal),

                            const Spacer(),

                            const Text("R X B:"),

                            const SizedBox(width: 10),

                            statBox("21", const Color(0xfffde6ef), Colors.pink),

                            const SizedBox(width: 8),

                            statBox("19", const Color(0xffe6fbfb), Colors.teal),

                          ],
                        ),
                      ),

                      const Divider(height: 1),

                      // 1st Innings
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                        child: Row(
                          children: [

                            const Expanded(
                              child: Text(
                                "1st Innings's Total Runs:",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),

                            statBox("94", const Color(0xfffde6ef), Colors.pink),

                            const SizedBox(width: 8),

                            statBox("96", const Color(0xffe6fbfb), Colors.teal),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                ///  Batter Table card
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD), // Apna color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        child: Row(
                          children: const [
                            Expanded(flex: 4, child: Text("Batter")),
                            Expanded(child: Center(child: Text("R"))),
                            Expanded(child: Center(child: Text("B"))),
                            Expanded(child: Center(child: Text("4s"))),
                            Expanded(child: Center(child: Text("6s"))),
                            Expanded(child: Center(child: Text("SR"))),
                          ],
                        ),
                      ),

                      const Divider(height: 1),

                      batterRow("Sophie Ecclestone", "6", "4", "1", "0", "150.0"),

                      batterRow("Richa Ghosh 🏏", "0", "2", "0", "0", "0.0"),

                      const Divider(height: 1),

                      const Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Text("P'ship: 0(2)"),
                            Spacer(),
                            Text("L' Wkt: M. Brown 10(18)"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                /// Bowler  card
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD), // Apna color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [

                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(flex: 4, child: Text("Bowler")),
                            Expanded(child: Center(child: Text("B"))),
                            Expanded(child: Center(child: Text("R"))),
                            Expanded(child: Center(child: Text("Wkt"))),
                            Expanded(child: Center(child: Text("RPB"))),
                          ],
                        ),
                      ),

                      const Divider(height: 1),

                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: const [
                            Expanded(flex: 4, child: Text("Orla Prendergast 🔴")),
                            Expanded(child: Center(child: Text("14"))),
                            Expanded(child: Center(child: Text("12"))),
                            Expanded(child: Center(child: Text("3"))),
                            Expanded(child: Center(child: Text("0.86"))),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 5),
                /// yet to bat card
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [

                        Text(
                          "Yet to bat",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(height: 10),
                        Divider(height: 1),
                        SizedBox(height: 10),

                        Text(
                          "Ryana Macdonald Gay,Grace Ballinger,Rebecca Tyson",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                /// team review card
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD), // Apna color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text(
                              "Team Review - UDRS",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text("Left"),
                          ],
                        ),
                      ),

                      const Divider(),

                      reviewRow("MSGW", "1", "0", "0"),
                      reviewRow("WelshW", "1", "0", "0"),

                    ],
                  ),
                ),
                const SizedBox(height: 5),
                /// setting card
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD), // Apna color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: const [
                      const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Settings",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Divider(height: 1),
                      ListTile(
                        leading: Icon(Icons.info_outline),
                        title: Text("Rules 100 ball cricket"),
                        trailing: Icon(Icons.chevron_right),
                      ),

                      Divider(height: 1),

                      ListTile(
                        leading: Icon(Icons.emoji_events_outlined),
                        title: Text("Series"),
                        trailing: Icon(Icons.chevron_right),
                      ),

                      Divider(height: 1),

                      ListTile(
                        leading: Icon(Icons.bar_chart),
                        title: Text("Points Table"),
                        trailing: Icon(Icons.chevron_right),
                      ),

                      Divider(height: 1),

                      ListTile(
                        leading: Icon(Icons.share),
                        title: Text("Share Score"),
                        trailing: Icon(Icons.chevron_right),
                      ),

                      Divider(height: 1),

                      ListTile(
                        leading: Icon(Icons.volume_up),
                        title: Text("Voice"),
                        trailing: Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  static Widget statBox(String text, Color bg, Color txt) {
    return Container(
      width: 42,
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: txt,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
  static Widget batterRow(String name, String r, String b, String f, String s, String sr,) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(child: Center(child: Text(r))),
          Expanded(child: Center(child: Text(b))),
          Expanded(child: Center(child: Text(f))),
          Expanded(child: Center(child: Text(s))),
          Expanded(child: Center(child: Text(sr))),
        ],
      ),
    );
  }
  Widget reviewRow(String team, String left, String ok, String wrong,) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(child: Text(team)),
          Text(left),
          const SizedBox(width: 40),
          Text(ok),
          const SizedBox(width: 40),
          Text(wrong),
        ],
      ),
    );
  }
}

///Delay and timing starting details
class UpcomingPage extends StatelessWidget {
  const UpcomingPage({super.key});

  @override
  Widget build(BuildContext context) {

    final balls = [
      "3",
      "1",
      "W",
      "0",
      "5",
      "0",
      "",
      "",
      "",
      "",
      "",
      "0"
    ];

    return SingleChildScrollView(
      child: Column(
        children: [

          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [

                Container(
                  height: 170,
                  width: double.infinity,
                  color: Colors.black,
                  child: Stack(
                    children: [

                      const Positioned(
                        top: 10,
                        left: 10,
                        child: Icon(
                          Icons.volume_off,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),

                      const Center(
                        child: Text(
                          "Toss Delayed due to rain",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Positioned(
                        top: 10,
                        right: 10,
                        child: Row(
                          children: const [

                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.red,
                            ),

                            SizedBox(width: 5),

                            Text(
                              "Live",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),
                /// over run list card
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 42,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: balls.length,
                        itemBuilder: (context, index) {
                          final value = balls[index];

                          Color bg = Colors.white;
                          Color txt = Colors.black;

                          if (value == "1") {
                            bg = Colors.green;
                            txt = Colors.white;
                          } else if (value == "W") {
                            bg = Colors.red;
                            txt = Colors.white;
                          } else if (value == "4") {
                            bg = Colors.blue;
                            txt = Colors.white;
                          } else if (value == "0") {
                            bg = Colors.grey.shade200;
                          }

                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: bg,
                              child: value.isEmpty
                                  ? Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey),
                                ),
                              )
                                  : Text(
                                value,
                                style: TextStyle(
                                  color: txt,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                /// win probability card
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD), // Apna color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      // Win Probability
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                        child: Row(
                          children: [

                            const Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    "Win Probability",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(Icons.info_outline, size: 18),
                                ],
                              ),
                            ),

                            const Text("Both:"),

                            const SizedBox(width: 10),

                            statBox("95", const Color(0xfffde6ef), Colors.pink),

                            const SizedBox(width: 8),

                            statBox("95", const Color(0xffe6fbfb), Colors.teal),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                ///Head to head
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Text(
                          "Head to Head",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 18),

                        IntrinsicHeight(
                          child: Row(
                            children: [

                              /// Left
                              SizedBox(
                                width: 90,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [

                                    Text(
                                      "1",
                                      style: TextStyle(
                                        fontSize: 38,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    SizedBox(height: 5),

                                    Text(
                                      "Matches",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              VerticalDivider(
                                thickness: 1,
                                color: Colors.grey.shade300,
                              ),

                              const SizedBox(width: 15),

                              /// Right
                              Expanded(
                                child: Column(
                                  children: [

                                    /// Team 1
                                    Row(
                                      children: [

                                        const CircleAvatar(
                                          radius: 18,
                                          backgroundImage:
                                          AssetImage("assets/team1.png"),
                                        ),

                                        const SizedBox(width: 10),

                                        const Expanded(
                                          child: Text(
                                            "South",
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),

                                        const Text("Won 1"),
                                      ],
                                    ),

                                    const SizedBox(height: 8),

                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: LinearProgressIndicator(
                                        value: 1,
                                        minHeight: 18,
                                        backgroundColor: Colors.grey.shade300,
                                        valueColor:
                                        const AlwaysStoppedAnimation(
                                          Color(0xff6666E8),
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 20),

                                    Divider(),

                                    const SizedBox(height: 20),

                                    /// Team 2
                                    Row(
                                      children: [

                                        const CircleAvatar(
                                          radius: 18,
                                          backgroundImage:
                                          AssetImage("assets/team2.png"),
                                        ),

                                        const SizedBox(width: 10),

                                        const Expanded(
                                          child: Text(
                                            "Outer",
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),

                                        const Text("Won 0"),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: LinearProgressIndicator(
                                        value: 0.15, // 15% fill
                                        minHeight: 18,
                                        backgroundColor: Colors.grey.shade300,
                                        valueColor: const AlwaysStoppedAnimation<Color>(
                                          Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                /// setting card
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD), // Apna color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Settings",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Divider(height: 1),
                      ListTile(
                        leading: Icon(Icons.info_outline),
                        title: Text("Rules 100 ball cricket"),
                        trailing: Icon(Icons.chevron_right),
                      ),

                      Divider(height: 1),
                      ListTile(
                        leading: Icon(Icons.emoji_events_outlined),
                        title: Text("Series"),
                        trailing: Icon(Icons.chevron_right),
                      ),

                      Divider(height: 1),

                      ListTile(
                        leading: Icon(Icons.bar_chart),
                        title: Text("Points Table"),
                        trailing: Icon(Icons.chevron_right),
                      ),

                      Divider(height: 1),

                      ListTile(
                        leading: Icon(Icons.volume_up),
                        title: Text("Voice"),
                        trailing: Icon(Icons.chevron_right),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  static Widget statBox(String text, Color bg, Color txt) {
    return Container(
      width: 42,
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: txt,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  static Widget batterRow(
      String name,
      String r,
      String b,
      String f,
      String s,
      String sr,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(child: Center(child: Text(r))),
          Expanded(child: Center(child: Text(b))),
          Expanded(child: Center(child: Text(f))),
          Expanded(child: Center(child: Text(s))),
          Expanded(child: Center(child: Text(sr))),
        ],
      ),
    );
  }
  Widget reviewRow(
      String team,
      String left,
      String ok,
      String wrong,
      ) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(child: Text(team)),
          Text(left),
          const SizedBox(width: 40),
          Text(ok),
          const SizedBox(width: 40),
          Text(wrong),
        ],
      ),
    );
  }
  }
///completed match
class CompletedPage extends StatelessWidget {
  const CompletedPage({super.key});

  @override
  Widget build(BuildContext context) {

    final balls = [
      "3",
      "1",
      "W",
      "0",
      "5",
      "0",
      "",
      "",
      "",
      "",
      "",
      "0"
    ];

    return SingleChildScrollView(
      child: Column(
        children: [

          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [

                Container(
                  height: 170,
                  width: double.infinity,
                  color: Colors.black,
                  child: Stack(
                    children: [

                      const Positioned(
                        top: 10,
                        left: 10,
                        child: Icon(
                          Icons.volume_off,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),

                      const Center(
                        child: Text(
                          "Trent Rockets won by 7 wickets",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: const [

                      Expanded(
                        child: Text(
                          "Trent 116-3 (83 b)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),

                      Text(
                        "BIRM 111-6 (100 b)",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),

                    ],
                  ),
                ),

                const SizedBox(height: 10),
                /// over run list card
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 42,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: balls.length,
                        itemBuilder: (context, index) {
                          final value = balls[index];

                          Color bg = Colors.white;
                          Color txt = Colors.black;

                          if (value == "1") {
                            bg = Colors.green;
                            txt = Colors.white;
                          } else if (value == "W") {
                            bg = Colors.red;
                            txt = Colors.white;
                          } else if (value == "4") {
                            bg = Colors.blue;
                            txt = Colors.white;
                          } else if (value == "0") {
                            bg = Colors.grey.shade200;
                          }

                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: bg,
                              child: value.isEmpty
                                  ? Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey),
                                ),
                              )
                                  : Text(
                                value,
                                style: TextStyle(
                                  color: txt,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                /// win probability card
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD), // Apna color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [

                      // Runs Per Ball
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                        child: Row(
                          children: const [
                            Text(
                              "Runs Needed: 0",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "Balls Rem: 17",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Divider(height: 1),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 12,
                        ),
                        child: Row(
                          children: const [

                            Expanded(
                              child: Text(
                                "RPB: 1.4",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),

                            Expanded(
                              child: Center(
                                child: Text(
                                  "RRPB: 0",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),

                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Target: 112",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 5),
                ///  Batter Table card
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD), // Apna color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        child: Row(
                          children: const [
                            Expanded(flex: 4, child: Text("Batter")),
                            Expanded(child: Center(child: Text("R"))),
                            Expanded(child: Center(child: Text("B"))),
                            Expanded(child: Center(child: Text("4s"))),
                            Expanded(child: Center(child: Text("6s"))),
                            Expanded(child: Center(child: Text("SR"))),
                          ],
                        ),
                      ),

                      const Divider(height: 1),

                      batterRow("Sophie Ecclestone", "6", "4", "1", "0", "150.0"),

                      batterRow("Richa Ghosh 🏏", "0", "2", "0", "0", "0.0"),

                      const Divider(height: 1),

                      const Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Text("P'ship: 0(2)"),
                            Spacer(),
                            Text("L' Wkt: M. Brown 10(18)"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                /// Bowler  card
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD), // Apna color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [

                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(flex: 4, child: Text("Bowler")),
                            Expanded(child: Center(child: Text("B"))),
                            Expanded(child: Center(child: Text("R"))),
                            Expanded(child: Center(child: Text("Wkt"))),
                            Expanded(child: Center(child: Text("RPB"))),
                          ],
                        ),
                      ),

                      const Divider(height: 1),

                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: const [
                            Expanded(flex: 4, child: Text("Orla Prendergast 🔴")),
                            Expanded(child: Center(child: Text("14"))),
                            Expanded(child: Center(child: Text("12"))),
                            Expanded(child: Center(child: Text("3"))),
                            Expanded(child: Center(child: Text("0.86"))),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 5),
                /// DID not Bat
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [

                        Text(
                          "Did not bat",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(height: 10),
                        Divider(height: 1),
                        SizedBox(height: 10),

                        Text(
                          "Ryana Macdonald Gay,Grace Ballinger,Rebecca Tyson",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                /// setting card
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD), // Apna color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Settings",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Divider(height: 1),
                      ListTile(
                        leading: Icon(Icons.info_outline),
                        title: Text("Rules 100 ball cricket"),
                        trailing: Icon(Icons.chevron_right),
                      ),

                      Divider(height: 1),

                      ListTile(
                        leading: Icon(Icons.emoji_events_outlined),
                        title: Text("Series"),
                        trailing: Icon(Icons.chevron_right),
                      ),

                      Divider(height: 1),

                      ListTile(
                        leading: Icon(Icons.bar_chart),
                        title: Text("Points Table"),
                        trailing: Icon(Icons.chevron_right),
                      ),

                      Divider(height: 1),

                      ListTile(
                        leading: Icon(Icons.share),
                        title: Text("Share Score"),
                        trailing: Icon(Icons.chevron_right),
                      ),

                      Divider(height: 1),

                      ListTile(
                        leading: Icon(Icons.volume_up),
                        title: Text("Voice"),
                        trailing: Icon(Icons.chevron_right),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 5),
                /// Innings card
        Card(
          elevation: 1,
          color: const Color(0xFFFDFDFD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [

              ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(horizontal: 16),
                childrenPadding: EdgeInsets.zero,
                shape: const Border(),
                collapsedShape: const Border(),
                title: const Text(
                  "1st Innings - MSGW",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                children: [
                  const Divider(
                      height: 1
                  ),
                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(1.5),
                      2: FlexColumnWidth(1.3),
                      3: FlexColumnWidth(2),
                    },
                    children: [

                      scoreRow("0", "-", "-", "Trent 56-57"),

                      scoreRow("25", "37-38", "25/1 ❌", "Trent 38-39"),

                      scoreRow("50", "61-62", "42/2 ❌", "Trent 16-17"),

                      scoreRow("75", "79-80", "83/3 ✅", "Trent 20-21"),

                      scoreRow("100", "127-128", "111/6 ❌", "Trent 06-07"),
                    ],
                  ),

                  const SizedBox(height: 10),
                ],
              ),

              const Divider(height: 1),

              ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(horizontal: 16),
                childrenPadding: EdgeInsets.zero,
                shape: const Border(),
                collapsedShape: const Border(),
                title: const Text(
                  "2nd Innings - WelshW",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                children: [
                  const Divider(
                    height: 1
                  ),
                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(1.5),
                      2: FlexColumnWidth(1.3),
                      3: FlexColumnWidth(2),
                    },
                    children: [

                      scoreRow("0", "-", "-", "-"),

                      scoreRow("25", "-", "-", "-"),

                      scoreRow("50", "-", "-", "-"),

                      scoreRow("75", "-", "-", "-"),

                      scoreRow("100", "-", "-", "-"),
                    ],
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  static Widget statBox(String text, Color bg, Color txt) {
    return Container(
      width: 42,
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: txt,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
  static Widget batterRow(String name, String r, String b, String f, String s, String sr,) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(child: Center(child: Text(r))),
          Expanded(child: Center(child: Text(b))),
          Expanded(child: Center(child: Text(f))),
          Expanded(child: Center(child: Text(s))),
          Expanded(child: Center(child: Text(sr))),
        ],
      ),
    );
  }
  Widget reviewRow(String team,String left, String ok, String wrong,) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(child: Text(team)),
          Text(left),
          const SizedBox(width: 40),
          Text(ok),
          const SizedBox(width: 40),
          Text(wrong),
        ],
      ),
    );
  }
  TableRow scoreRow(String ball, String prediction, String score, String need,) {
    return TableRow(
      children: [

        tableCell(ball),

        tableCell(prediction),

        tableCell(score),

        tableCell(need),
      ],
    );
  }
  Widget tableCell(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 8,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffE5E5E5),
          ),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}
class FirstInningcomplted extends StatelessWidget {
  const FirstInningcomplted({super.key});
  @override
  Widget build(BuildContext context) {

    final balls = [
      "3",
      "1",
      "W",
      "0",
      "5",
      "0",
      "",
      "",
      "",
      "",
      "",
      "0"
    ];

    return SingleChildScrollView(
      child: Column(
        children: [

          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [

                Container(
                  height: 170,
                  width: double.infinity,
                  color: Colors.black,
                  child: Stack(
                    children: [

                      const Positioned(
                        top: 10,
                        left: 10,
                        child: Icon(
                          Icons.volume_off,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),

                      const Center(
                        child: Text(
                          "Over Completed",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Positioned(
                        top: 10,
                        right: 10,
                        child: Row(
                          children: const [

                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.red,
                            ),

                            SizedBox(width: 5),

                            Text(
                              "Live",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: const [

                      Expanded(
                        child: Text(
                          "Trent 116-3 (83 b)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),

                      Text(
                        "BIRM 111-6 (100 b)",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),

                    ],
                  ),
                ),

                const SizedBox(height: 10),
                Card(
                  elevation: 1,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 16,
                    ),
                    child: Center(
                      child: Text(
                        "10 overs per side Match",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                  ),
                ),
                /// over run list card
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 42,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: balls.length,
                        itemBuilder: (context, index) {
                          final value = balls[index];

                          Color bg = Colors.white;
                          Color txt = Colors.black;

                          if (value == "1") {
                            bg = Colors.green;
                            txt = Colors.white;
                          } else if (value == "W") {
                            bg = Colors.red;
                            txt = Colors.white;
                          } else if (value == "4") {
                            bg = Colors.blue;
                            txt = Colors.white;
                          } else if (value == "0") {
                            bg = Colors.grey.shade200;
                          }

                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: bg,
                              child: value.isEmpty
                                  ? Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey),
                                ),
                              )
                                  : Text(
                                value,
                                style: TextStyle(
                                  color: txt,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                /// win probability card
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD), // Apna color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [

                      // Runs Per Ball
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                        child: Row(
                          children: const [
                            Text(
                              "Runs Needed: 0",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "Balls Rem: 17",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Divider(height: 1),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 12,
                        ),
                        child: Row(
                          children: const [

                            Expanded(
                              child: Text(
                                "CRR: 1.4",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),

                            Expanded(
                              child: Center(
                                child: Text(
                                  "RRR: 0",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),

                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Target: 112",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 1),

                      // Win Probability
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                        child: Row(
                          children: [

                            const Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    "Win Probability",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(Icons.info_outline, size: 18),
                                ],
                              ),
                            ),

                            const Text("WelshW:"),

                            const SizedBox(width: 10),

                            statBox("09", const Color(0xfffde6ef), Colors.pink),

                            const SizedBox(width: 8),

                            statBox("10", const Color(0xffe6fbfb), Colors.teal),

                          ],
                        ),
                      ),
                      const Divider(height: 1),
                      // 75 Ball Runs
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                        child: Row(
                          children: [

                            const Expanded(
                              child: Text(
                                "4 Over Runs:",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),

                            statBox("66", const Color(0xfffde6ef), Colors.pink),

                            const SizedBox(width: 8),

                            statBox("67", const Color(0xffe6fbfb), Colors.teal),

                            const Spacer(),

                            const Text("R X B:"),

                            const SizedBox(width: 10),

                            statBox("21", const Color(0xfffde6ef), Colors.pink),

                            const SizedBox(width: 8),

                            statBox("19", const Color(0xffe6fbfb), Colors.teal),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                const SizedBox(height: 5),
                ///  Batter Table card
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD), // Apna color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        child: Row(
                          children: const [
                            Expanded(flex: 4, child: Text("Batter")),
                            Expanded(child: Center(child: Text("R"))),
                            Expanded(child: Center(child: Text("B"))),
                            Expanded(child: Center(child: Text("4s"))),
                            Expanded(child: Center(child: Text("6s"))),
                            Expanded(child: Center(child: Text("SR"))),
                          ],
                        ),
                      ),

                      const Divider(height: 1),

                      batterRow("Sophie Ecclestone", "6", "4", "1", "0", "150.0"),

                      batterRow("Richa Ghosh 🏏", "0", "2", "0", "0", "0.0"),

                      const Divider(height: 1),

                      const Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Text("P'ship: 0(2)"),
                            Spacer(),
                            Text("L' Wkt: M. Brown 10(18)"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                /// Bowler  card
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD), // Apna color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [

                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(flex: 4, child: Text("Bowler")),
                            Expanded(child: Center(child: Text("B"))),
                            Expanded(child: Center(child: Text("R"))),
                            Expanded(child: Center(child: Text("Wkt"))),
                            Expanded(child: Center(child: Text("RPB"))),
                          ],
                        ),
                      ),

                      const Divider(height: 1),

                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: const [
                            Expanded(flex: 4, child: Text("Orla Prendergast 🔴")),
                            Expanded(child: Center(child: Text("14"))),
                            Expanded(child: Center(child: Text("12"))),
                            Expanded(child: Center(child: Text("3"))),
                            Expanded(child: Center(child: Text("0.86"))),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 5),
                /// yet to bat card
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [

                        Text(
                          "Yet to bat",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(height: 10),
                        Divider(height: 1),
                        SizedBox(height: 10),

                        Text(
                          "Ryana Macdonald Gay,Grace Ballinger,Rebecca Tyson",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                /// compare with other team
                Card(
                  elevation: 1,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 14,
                    ),
                    child: Row(
                      children: [

                        /// Left Team
                        Expanded(
                          child: Row(
                            children: [

                              const CircleAvatar(
                                radius: 16,
                                backgroundImage: AssetImage("assets/team1.png"),
                              ),

                              const SizedBox(width: 8),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [

                                  Text(
                                    "South",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  SizedBox(height: 2),

                                  Text(
                                    "5-1",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        /// Center Text
                        const Text(
                          "After 1.1 overs",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        /// Right Team
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [

                                  Text(
                                    "Outer",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  SizedBox(height: 2),

                                  Text(
                                    "15-0",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(width: 8),

                              const CircleAvatar(
                                radius: 16,
                                backgroundImage: AssetImage("assets/team2.png"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                /// team review card
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD), // Apna color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text(
                              "Team Review - UDRS",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text("Left"),
                          ],
                        ),
                      ),

                      const Divider(),

                      reviewRow("MSGW", "1", "0", "0"),
                      reviewRow("WelshW", "1", "0", "0"),

                    ],
                  ),
                ),
                const SizedBox(height: 5),
                /// setting card
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD), // Apna color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: const [
                      const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Settings",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Divider(height: 1),
                      ListTile(
                        leading: Icon(Icons.info_outline),
                        title: Text("Rules 100 ball cricket"),
                        trailing: Icon(Icons.chevron_right),
                      ),

                      Divider(height: 1),

                      ListTile(
                        leading: Icon(Icons.emoji_events_outlined),
                        title: Text("Series"),
                        trailing: Icon(Icons.chevron_right),
                      ),

                      Divider(height: 1),

                      ListTile(
                        leading: Icon(Icons.bar_chart),
                        title: Text("Points Table"),
                        trailing: Icon(Icons.chevron_right),
                      ),

                      Divider(height: 1),

                      ListTile(
                        leading: Icon(Icons.share),
                        title: Text("Share Score"),
                        trailing: Icon(Icons.chevron_right),
                      ),

                      Divider(height: 1),

                      ListTile(
                        leading: Icon(Icons.volume_up),
                        title: Text("Voice"),
                        trailing: Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Card(
                  elevation: 1,
                  color: const Color(0xFFFDFDFD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [

                      ExpansionTile(
                        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
                        childrenPadding: EdgeInsets.zero,
                        shape: const Border(),
                        collapsedShape: const Border(),
                        title: const Text(
                          "1st Innings - MSGW",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        children: [
                          const Divider(
                              height: 1
                          ),
                          Table(
                            columnWidths: const {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(1.5),
                              2: FlexColumnWidth(1.3),
                              3: FlexColumnWidth(2),
                            },
                            children: [

                              scoreRow("0", "-", "-", "Trent 56-57"),

                              scoreRow("25", "37-38", "25/1 ❌", "Trent 38-39"),

                              scoreRow("50", "61-62", "42/2 ❌", "Trent 16-17"),

                              scoreRow("75", "79-80", "83/3 ✅", "Trent 20-21"),

                              scoreRow("100", "127-128", "111/6 ❌", "Trent 06-07"),
                            ],
                          ),

                          const SizedBox(height: 10),
                        ],
                      ),

                      const Divider(height: 1),

                      ExpansionTile(
                        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
                        childrenPadding: EdgeInsets.zero,
                        shape: const Border(),
                        collapsedShape: const Border(),
                        title: const Text(
                          "2nd Innings - WelshW",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        children: [
                          const Divider(
                              height: 1
                          ),
                          Table(
                            columnWidths: const {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(1.5),
                              2: FlexColumnWidth(1.3),
                              3: FlexColumnWidth(2),
                            },
                            children: [

                              scoreRow("0", "-", "-", "-"),

                              scoreRow("25", "-", "-", "-"),

                              scoreRow("50", "-", "-", "-"),

                              scoreRow("75", "-", "-", "-"),

                              scoreRow("100", "-", "-", "-"),
                            ],
                          ),

                          const SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  static Widget statBox(String text, Color bg, Color txt) {
    return Container(
      width: 42,
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: txt,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
  static Widget batterRow(String name, String r, String b, String f, String s, String sr,) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(child: Center(child: Text(r))),
          Expanded(child: Center(child: Text(b))),
          Expanded(child: Center(child: Text(f))),
          Expanded(child: Center(child: Text(s))),
          Expanded(child: Center(child: Text(sr))),
        ],
      ),
    );
  }
  TableRow scoreRow(String ball, String prediction, String score, String need,) {
    return TableRow(
      children: [

        tableCell(ball),

        tableCell(prediction),

        tableCell(score),

        tableCell(need),
      ],
    );
  }
  Widget tableCell(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 8,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffE5E5E5),
          ),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
  Widget reviewRow(String team, String left, String ok, String wrong,) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(child: Text(team)),
          Text(left),
          const SizedBox(width: 40),
          Text(ok),
          const SizedBox(width: 40),
          Text(wrong),
        ],
      ),
    );
  }
}




