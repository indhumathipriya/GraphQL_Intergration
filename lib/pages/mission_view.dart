import 'package:flutter/material.dart';
import 'package:spacex/service/models/mission_data.dart';

class MissionView extends StatefulWidget {
  final MissionData missionData;
  const MissionView({Key? key, required this.missionData}) : super(key: key);

  @override
  State<MissionView> createState() => _MissionViewState();
}

class _MissionViewState extends State<MissionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
