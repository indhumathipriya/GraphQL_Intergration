import 'package:flutter/material.dart';
import 'package:spacex/pages/mission_view.dart';

import '../service/models/mission_data.dart';
import '../service/provider.dart';

class MissionListView extends StatefulWidget {
  const MissionListView({Key? key}) : super(key: key);

  @override
  State<MissionListView> createState() => _MissionListViewState();
}

class _MissionListViewState extends State<MissionListView> {
  @override
  Widget build(BuildContext context) {
    var service = ServiceProvider.of(context);
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: service.missions(offset: 0, limit: 100),
          builder: (BuildContext context,
              AsyncSnapshot<List<MissionData>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  MissionData mission = snapshot.data!.elementAt(index);
                  return ListTile(
                      title: Text(mission.name),
                      subtitle: Text(mission.description),
                      isThreeLine: true,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MissionView(missionData: mission)));
                      });
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

_onMissionTapped(MissionData mission) {}
