class LaunchData {
  LaunchData({
    required this.id,
    required this.launchYear,
    required this.launchSuccess,
    required this.missionName,
    required this.upcoming,
  });
  late final String id;
  late final String launchYear;
  late final bool launchSuccess;
  late final String missionName;
  late final bool upcoming;

  LaunchData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    launchYear = json['launch_year'];
    launchSuccess = json['launch_success'];
    missionName = json['mission_name'];
    upcoming = json['upcoming'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['launch_year'] = launchYear;
    _data['launch_success'] = launchSuccess;
    _data['mission_name'] = missionName;
    _data['upcoming'] = upcoming;
    return _data;
  }
}
