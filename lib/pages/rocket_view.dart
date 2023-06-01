import 'package:flutter/material.dart';
import 'package:spacex/service/models/rocket_data.dart';

class RocketView extends StatefulWidget {
  final RocketData rocketData;
  const RocketView({Key? key, required this.rocketData}) : super(key: key);

  @override
  State<RocketView> createState() => _RocketViewState();
}

class _RocketViewState extends State<RocketView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
