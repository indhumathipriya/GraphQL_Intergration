class RocketData {
  RocketData({
    required this.country,
    required this.description,
    required this.height,
    required this.name,
    required this.landingLegs,
    required this.id,
    required this.company,
  });
  late final String country;
  late final String description;
  late final Height height;
  late final String name;
  late final LandingLegs landingLegs;
  late final String id;
  late final String company;

  RocketData.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    description = json['description'];
    height = Height.fromJson(json['height']);
    name = json['name'];
    landingLegs = LandingLegs.fromJson(json['landing_legs']);
    id = json['id'];
    company = json['company'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['country'] = country;
    _data['description'] = description;
    _data['height'] = height.toJson();
    _data['name'] = name;
    _data['landing_legs'] = landingLegs.toJson();
    _data['id'] = id;
    _data['company'] = company;
    return _data;
  }
}

class Height {
  Height({
    required this.meters,
  });
  late final double meters;

  Height.fromJson(Map<String, dynamic> json) {
    meters = double.tryParse(json['meters'].toString()) ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['meters'] = meters;
    return _data;
  }
}

class LandingLegs {
  LandingLegs({
    required this.number,
  });
  late final int number;

  LandingLegs.fromJson(Map<String, dynamic> json) {
    number = int.tryParse(json['number'].toString()) ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['number'] = number;
    return _data;
  }
}
