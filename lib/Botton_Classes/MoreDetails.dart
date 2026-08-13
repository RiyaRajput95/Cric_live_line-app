import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "More",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView(
        children: [

          const SizedBox(height: 10),

          _heading("BROWSE"),

          _tile(Icons.emoji_events_outlined, "All Series"),
          _tile(Icons.bar_chart, "ICC Men's Rankings"),
          _tile(Icons.bar_chart, "ICC Women's Rankings"),

          const SizedBox(height: 10),

          _heading("OTHER OPTIONS"),

          _tile(Icons.info_outline, "About us"),
          _tile(Icons.star_border, "Rate us"),
          _tile(Icons.share_outlined, "Share"),
          _tile(Icons.privacy_tip_outlined, "Privacy Policy"),
          _tile(Icons.description_outlined, "Terms & Condition"),

          SizedBox(height: width * .15),

          const Center(
            child: Text(
              "Version : 1.0",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }

  Widget _heading(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget _tile(IconData icon, String title) {
    return Column(
      children: [

        ListTile(

          leading: Icon(
            icon,
            color: Colors.grey,
          ),

          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),

          trailing: const Icon(
            Icons.chevron_right,
            color: Colors.grey,
          ),

          onTap: () {},

        ),

        const Divider(height: 1),

      ],
    );
  }
}