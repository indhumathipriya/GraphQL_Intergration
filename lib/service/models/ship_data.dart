class ShipData {
  ShipData({
    required this.id,
    this.image,
    required this.missions,
    required this.name,
    this.status,
    this.yearBuilt,
  });
  late final String id;
  late final String? image;
  late final List<Missions> missions;
  late final String name;
  late final String? status;
  late final int? yearBuilt;

  ShipData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    missions =
        List.from(json['missions']).map((e) => Missions.fromJson(e)).toList();
    name = json['name'];
    status = json['status'];
    yearBuilt = json['year_built'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['image'] = image;
    _data['missions'] = missions.map((e) => e.toJson()).toList();
    _data['name'] = name;
    _data['status'] = status;
    _data['year_built'] = yearBuilt;
    return _data;
  }
}

class Missions {
  Missions({
    required this.name,
  });
  late final String name;

  Missions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    return _data;
  }
}
