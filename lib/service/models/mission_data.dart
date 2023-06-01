class MissionData {
  MissionData({
    required this.description,
    required this.id,
    required this.manufacturers,
    required this.name,
    required this.wikipedia,
    required this.website,
    this.twitter,
  });
  late final String description;
  late final String id;
  late final List<String> manufacturers;
  late final String name;
  late final String wikipedia;
  late final String website;
  late final String? twitter;

  MissionData.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    manufacturers = List.castFrom<dynamic, String>(json['manufacturers']);
    name = json['name'];
    wikipedia = json['wikipedia'];
    website = json['website'];
    twitter = json['twitter'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['description'] = description;
    _data['id'] = id;
    _data['manufacturers'] = manufacturers;
    _data['name'] = name;
    _data['wikipedia'] = wikipedia;
    _data['website'] = website;
    _data['twitter'] = twitter;
    return _data;
  }
}
