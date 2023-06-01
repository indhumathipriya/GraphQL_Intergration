import 'package:flutter/material.dart';
import 'package:spacex/service/models/capsule_data.dart';
import 'package:spacex/service/provider.dart';

class CapsuleView extends StatefulWidget {
  final CapsuleData capsuleData;
  const CapsuleView({Key? key, required this.capsuleData}) : super(key: key);

  @override
  State<CapsuleView> createState() => _CapsuleViewState();
}

class _CapsuleViewState extends State<CapsuleView> {
  @override
  Widget build(BuildContext context) {
    var service = ServiceProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.capsuleData.id),
      ),
      body: FutureBuilder(
        future: service.capsule(widget.capsuleData.id),
        builder: (BuildContext context, AsyncSnapshot<CapsuleData> snapshot) {
          if (!snapshot.hasData && !snapshot.hasError) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            CapsuleData capsuleData = snapshot.data!;
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(capsuleData.id),
                  SizedBox(height: 20),
                  Text(capsuleData.originalLaunch),
                  SizedBox(height: 20),
                  Text(capsuleData.status),
                  SizedBox(height: 20),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
