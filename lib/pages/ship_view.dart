import 'package:flutter/material.dart';
import 'package:spacex/service/models/ship_data.dart';

class ShipView extends StatefulWidget {
  final ShipData shipData;
  const ShipView({Key? key, required this.shipData}) : super(key: key);

  @override
  State<ShipView> createState() => _ShipViewState();
}

class _ShipViewState extends State<ShipView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
