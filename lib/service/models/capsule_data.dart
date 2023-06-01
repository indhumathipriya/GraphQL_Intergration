class CapsuleData {
  CapsuleData({
    required this.id,
    required this.landings,
    required this.originalLaunch,
    required this.reuseCount,
    required this.status,
    required this.type,
  });
  late final String id;
  late final int landings;
  late final String originalLaunch;
  late final int reuseCount;
  late final String status;
  late final String type;

  CapsuleData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    landings = int.tryParse(json['landings'].toString()) ?? 0;
    originalLaunch = json['original_launch'] ?? "Unknown";
    reuseCount = int.tryParse(json['reuse_count'].toString()) ?? 0;
    status = json['status'] ?? "Unknown";
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['landings'] = landings;
    _data['original_launch'] = originalLaunch;
    _data['reuse_count'] = reuseCount;
    _data['status'] = status;
    _data['type'] = type;
    return _data;
  }
}
