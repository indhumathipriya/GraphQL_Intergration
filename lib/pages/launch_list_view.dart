import 'package:flutter/material.dart';
import 'package:spacex/pages/launch_view.dart';

import '../service/models/launch_data.dart';
import '../service/provider.dart';

class LaunchListView extends StatefulWidget {
  const LaunchListView({Key? key}) : super(key: key);

  @override
  State<LaunchListView> createState() => _LaunchListViewState();
}

class _LaunchListViewState extends State<LaunchListView> {
  @override
  Widget build(BuildContext context) {
    var service = ServiceProvider.of(context);
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: service.launches(offset: 0, limit: 100),
          builder:
              (BuildContext context, AsyncSnapshot<List<LaunchData>> snapshot) {
            if (!snapshot.hasData && !snapshot.hasError) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  LaunchData launchData = snapshot.data!.elementAt(index);
                  return ListTile(
                    title: Text(launchData.missionName),
                    subtitle: Text("Launch Year\t\t${launchData.launchYear}"),
                    isThreeLine: true,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LaunchView(launchData: launchData)));
                    },
                  );
                },
                itemCount: snapshot.data!.length,
              );
            }
          },
        ),
      ),
    );
  }
}
