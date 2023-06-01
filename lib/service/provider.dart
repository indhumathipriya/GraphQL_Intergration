import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:spacex/service/models/mission_data.dart';
import 'package:spacex/service/schema.dart';

import 'models/capsule_data.dart';
import 'models/launch_data.dart';
import 'models/rocket_data.dart';
import 'models/ship_data.dart';

final _httpLink = HttpLink(
  'https://api.spacex.land/graphql',
);

final _authLink = AuthLink(
  getToken: () async => '',
);

Link _link = _authLink.concat(_httpLink);

class ServiceProvider extends InheritedWidget {
  ServiceProvider({Key? key, required super.child}) : super(key: key);

  @override
  bool updateShouldNotify(ServiceProvider oldWidget) => true;

  static ServiceProvider of(BuildContext context) {
    var result = context.dependOnInheritedWidgetOfExactType<ServiceProvider>();
    assert(result != null, 'No service provider found in context');
    return result!;
  }

  final GraphQLClient client = GraphQLClient(
    ///The default store is the InMemoryStore, which does NOT persist to disk
    cache: GraphQLCache(),
    link: _link,
  );

  Future<List<MissionData>> missions(
      {int limit = 10, required int offset}) async {
    var result = await client.query(
      QueryOptions(
        document: GQL.missions(offset: offset, limit: limit),
      ),
    );
    if (result.hasException) {
      throw Exception("Something went wrong");
    } else if (result.data == null) {
      throw Exception("Data not found");
    } else {
      return (result.data!["missions"] as List).map((e) {
        return MissionData.fromJson(Map.of(e));
      }).toList();
    }
  }

  Future<List<CapsuleData>> capsules(
      {int limit = 10, required int offset}) async {
    var result = await client.query(
      QueryOptions(
        document: GQL.capsules(offset: offset, limit: limit),
      ),
    );
    print(result.data);
    if (result.hasException) {
      throw Exception("Something went wrong");
    } else if (result.data == null) {
      throw Exception("Data not found");
    } else {
      return (result.data!["capsules"] as List).map((e) {
        return CapsuleData.fromJson(Map.of(e));
      }).toList();
    }
  }

  Future<List<LaunchData>> launches(
      {int limit = 10, required int offset}) async {
    var result = await client.query(
      QueryOptions(
        document: GQL.launches(offset: offset, limit: limit),
      ),
    );
    if (result.hasException) {
      throw Exception("Something went wrong");
    } else if (result.data == null) {
      throw Exception("Data not found");
    } else {
      return (result.data!["launches"] as List).map((e) {
        return LaunchData.fromJson(Map.of(e));
      }).toList();
    }
  }

  Future<List<RocketData>> rockets(
      {int limit = 10, required int offset}) async {
    var result = await client.query(
      QueryOptions(
        document: GQL.rockets(offset: offset, limit: limit),
      ),
    );
    print(result.data);
    if (result.hasException) {
      throw Exception("Something went wrong");
    } else if (result.data == null) {
      throw Exception("Data not found");
    } else {
      return (result.data!["rockets"] as List).map((e) {
        return RocketData.fromJson(Map.of(e));
      }).toList();
    }
  }

  Future<List<ShipData>> ships({int limit = 10, required int offset}) async {
    var result = await client.query(
      QueryOptions(
        document: GQL.ships(offset: offset, limit: limit),
      ),
    );
    print(result.data);
    if (result.hasException) {
      throw Exception("Something went wrong");
    } else if (result.data == null) {
      throw Exception("Data not found");
    } else {
      return (result.data!["ships"] as List).map((e) {
        return ShipData.fromJson(Map.of(e));
      }).toList();
    }
  }

  Future<CapsuleData> capsule(String id) async {
    var result = await client.query(
      QueryOptions(document: GQL.capsule(), variables: {"id": id}),
    );
    print(result.data);
    if (result.hasException) {
      print(result.exception);
      throw Exception("Something went wrong");
    } else if (result.data == null) {
      throw Exception("Data not found");
    } else {
      return CapsuleData.fromJson(Map.of(result.data!['capsule']));
    }
  }
}
