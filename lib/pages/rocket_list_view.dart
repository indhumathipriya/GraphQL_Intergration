import 'package:flutter/material.dart';
import 'package:spacex/pages/rocket_view.dart';

import '../service/models/rocket_data.dart';
import '../service/provider.dart';

class RocketListView extends StatefulWidget {
  const RocketListView({Key? key}) : super(key: key);

  @override
  State<RocketListView> createState() => _RocketListViewState();
}

class _RocketListViewState extends State<RocketListView> {
  @override
  Widget build(BuildContext context) {
    var service = ServiceProvider.of(context);
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: service.rockets(offset: 0, limit: 100),
          builder:
              (BuildContext context, AsyncSnapshot<List<RocketData>> snapshot) {
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
                  RocketData rocket = snapshot.data!.elementAt(index);
                  return ListTile(
                    title: Text(rocket.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(rocket.country),
                        Text(rocket.company),
                        Text("Height\t\t${rocket.height.meters}"),
                        Text("Landing Legs\t\t${rocket.landingLegs}"),
                        Text(rocket.description),
                      ],
                    ),
                    isThreeLine: true,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  RocketView(rocketData: rocket)));
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
