import 'package:flutter/material.dart';
import 'package:spacex/pages/capsule_list_view.dart';
import 'package:spacex/pages/launch_list_view.dart';
import 'package:spacex/pages/mission_list_view.dart';
import 'package:spacex/pages/rocket_list_view.dart';
import 'package:spacex/pages/ship_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spacex"),
      ),
      body: ListView(children: [
        ListTile(
          title: const Text("Missions"),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MissionListView()));
          },
        ),
        ListTile(
          title: const Text("Capsules"),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CapsuleListView()));
          },
        ),
        ListTile(
          title: const Text("Launches"),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LaunchListView()));
          },
        ),
        ListTile(
          title: const Text("Rockets"),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RocketListView()));
          },
        ),
        ListTile(
          title: const Text("Ships"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ShipListView()));
          },
        ),
      ]),
    );
  }
}
