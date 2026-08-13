import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          // ================= TEAMS =================
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 18,
            ),
            child: Row(
              children: [

                // Australia
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffEAEAEA),
                          ),
                          child: const Icon(
                            Icons.flag,
                            size: 28,
                            color: Colors.grey,
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          "AUS",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Center icon
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(
                    Icons.flash_on,
                    color: Colors.grey,
                    size: 24,
                  ),
                ),

                // Bangladesh
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffEAEAEA),
                          ),
                          child: const Icon(
                            Icons.flag,
                            size: 28,
                            color: Colors.grey,
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          "BAN",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
           ///match details
          Card(
            elevation: 1,
            color: const Color(0xFFFDFDFD),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),

            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  // Dummy match image
                  SizedBox(
                    width: 75,
                    height: 75,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        color: const Color(0xffEEEEEE),
                        child: const Icon(
                          Icons.sports_cricket,
                          size: 38,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Text
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [

                        Text(
                          "1st Test Match",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        SizedBox(height: 6),

                        Text(
                          "Australia Vs Bangladesh",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Bangladesh tour of Australia 2026",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 5),

                  // Arrow
                  const Icon(
                    Icons.chevron_right,
                    color: Colors.black54,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          ///timing and statium
          Card(
            elevation: 1,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            color: const Color(0xFFFDFDFD), // Apna color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [

                // Date & Time
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 32,
                        child: Text(
                          "📅",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          "Thu, 13 Aug, 06:00 AM at Your Time",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const Divider(
                  height: 1
                ),

                // Toss
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 32,
                        child: Text(
                          "👍",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          "Australia opt to bat",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                        ),
                      ),
                    ],
                  ),
                ),

                const Divider(
                  height: 1
                ),

                // Venue
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 32,
                        child: Text(
                          "📍",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          "Marrara Cricket Ground, Darwin, Australia",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          /// team squads
          Card(
            elevation: 1,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            color: const Color(0xFFFDFDFD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "Team Squads",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),

                const Divider(
                  height: 1,
                ),

                // Australia
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  leading: Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffE6E6E6),
                    ),
                    child: const Icon(
                      Icons.flag,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                  title: const Text(
                    "Australia",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Colors.black87,
                  ),
                  onTap: () {
                    // Australia squad
                  },
                ),

                const Divider(
                  height: 1,
                  indent: 12,
                  endIndent: 12,
                ),

                // Bangladesh
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  leading: Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffE6E6E6),
                    ),
                    child: const Icon(
                      Icons.flag,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                  title: const Text(
                    "Bangladesh",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Colors.black87,
                  ),
                  onTap: () {
                    // Bangladesh squad
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          ///recentperformance
          Card(
            elevation: 1,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            color: const Color(0xFFFDFDFD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Heading

                const Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(

                    children: const [

                      Text(
                        "Recent Performance",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          "(Last 5 Matches)",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                // Australia
                _performanceRow(
                  "Australia",
                  ["*", "W", "L", "W", "W", "W"],
                ),

                const SizedBox(height: 10),
                const Divider(
                  height: 1,
                ),

                // Bangladesh
                _performanceRow(
                  "Bangladesh",
                  ["*", "L", "W", "W", "W", "W"],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(height: 8),
          /// head to head
          Card(
            elevation: 1,
            margin: const EdgeInsets.symmetric(horizontal: 10),
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
                      fontSize: 15,
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
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
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
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
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
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
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
          const SizedBox(height: 8),
          /// umpire details
          Card(
            elevation: 1,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            color: const Color(0xFFFDFDFD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 14,
                      bottom: 10,
                    ),
                    child: Text(
                      "Umpire",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Divider(),

                  // Icon + Details
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Umpire Icon
                      SizedBox(
                        width: 55,
                        child: Center(
                          child: Icon(
                            Icons.person_outline,
                            size: 38,
                            color: Color(0xFFD9D6E8),
                          ),
                        ),
                      ),

                      const SizedBox(width: 20),

                      // Details
                      Expanded(
                        child: Column(
                          children: [
                            _umpireRow(
                              "Umpires",
                              "Richard Illingworth, Kumar\nDharmasena",
                            ),

                            const SizedBox(height: 14),

                            _umpireRow(
                              "3rd Umpire",
                              "Nitin Menon",
                            ),

                            const SizedBox(height: 14),

                            _umpireRow(
                              "Referee",
                              "Richie Richardson",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
         ///venue guide
          Card(
            elevation: 1,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            color: const Color(0xFFFDFDFD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 14,
                      bottom: 10,
                    ),
                    child: Text(
                      "Venue Guide",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Divider(),

                  // Icon + Details
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Details
                      Expanded(
                        child: Column(
                          children: [
                            _umpireRow(
                              "stadium",
                              "Cricket Stadium Australia",
                            ),
                            const SizedBox(height: 14),
                            _umpireRow(
                              "City",
                              "Darwin",
                            ),

                            const SizedBox(height: 14),
                            _umpireRow(
                              "Capacity",
                              "15000",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

Widget _umpireRow(String title, String value) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: 110,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Expanded(
        child: Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.3,
          ),
        ),
      ),
    ],
  );
}

Widget _performanceRow(String teamName, List<String> results,) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 12,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [

        // Team name
        Expanded(
          flex: 3,
          child: Text(
            teamName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
        ),

        const SizedBox(width: 8),

        // Results
        Expanded(
          flex: 5,
          child: Row(
            children: results.map((result) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: _resultBox(result),
                ),
              );
            }).toList(),
          ),
        ),

        const SizedBox(width: 5),

        // Arrow
        const SizedBox(
          width: 24,
          child: Icon(
            Icons.keyboard_arrow_down,
            size: 24,
            color: Colors.black87,
          ),
        ),
      ],
    ),
  );
}
Widget _resultBox(String result) {
  Color borderColor;
  Color textColor;
  Color backgroundColor;

  if (result == "W") {
    borderColor = const Color(0xff42B883);
    textColor = const Color(0xff159447);
    backgroundColor = const Color(0xffF3FFF8);
  } else if (result == "L") {
    borderColor = const Color(0xffE46A7A);
    textColor = const Color(0xffD9364F);
    backgroundColor = const Color(0xfffff5f6);
  } else {
    borderColor = const Color(0xffC8C8C8);
    textColor = Colors.black54;
    backgroundColor = const Color(0xffF5F5F5);
  }

  return AspectRatio(
    aspectRatio: 1,
    child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          result,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    ),
  );
}
