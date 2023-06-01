import 'package:flutter/material.dart';

import '../service/models/ship_data.dart';
import '../service/provider.dart';

class ShipListView extends StatefulWidget {
  const ShipListView({Key? key}) : super(key: key);

  @override
  State<ShipListView> createState() => _ShipListViewState();
}

class _ShipListViewState extends State<ShipListView> {
  @override
  Widget build(BuildContext context) {
    var service = ServiceProvider.of(context);
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: service.ships(offset: 0, limit: 100),
          builder:
              (BuildContext context, AsyncSnapshot<List<ShipData>> snapshot) {
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
                  ShipData shipData = snapshot.data!.elementAt(index);
                  return ListTile(
                    title: Text(shipData.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(shipData.yearBuilt?.toString() ?? ""),
                        Text(shipData.status ?? "UnKnown"),
                      ],
                    ),
                    isThreeLine: true,
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
