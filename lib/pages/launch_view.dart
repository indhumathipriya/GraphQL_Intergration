import 'package:flutter/material.dart';

import '../service/models/launch_data.dart';

class LaunchView extends StatefulWidget {
  final LaunchData launchData;
  const LaunchView({Key? key, required this.launchData}) : super(key: key);

  @override
  State<LaunchView> createState() => _LaunchViewState();
}

class _LaunchViewState extends State<LaunchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
