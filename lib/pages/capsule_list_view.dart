import 'package:flutter/material.dart';

import '../service/models/capsule_data.dart';
import '../service/provider.dart';
import 'capsule_view.dart';

class CapsuleListView extends StatefulWidget {
  const CapsuleListView({Key? key}) : super(key: key);

  @override
  State<CapsuleListView> createState() => _CapsuleListViewState();
}

class _CapsuleListViewState extends State<CapsuleListView> {
  @override
  Widget build(BuildContext context) {
    var service = ServiceProvider.of(context);
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: service.capsules(offset: 0, limit: 100),
          builder: (BuildContext context,
              AsyncSnapshot<List<CapsuleData>> snapshot) {
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
                  CapsuleData capsule = snapshot.data!.elementAt(index);
                  return ListTile(
                    title: Text(capsule.originalLaunch),
                    subtitle: Text(capsule.status),
                    isThreeLine: true,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CapsuleView(
                                    capsuleData: capsule,
                                  )));
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
