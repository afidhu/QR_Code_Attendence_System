class Sessions {
  int? sessionId;
  int? timetableId;
  String? createdAt;
  int? expiredTime;
  String? createdTime;

  Sessions(
      {this.sessionId,
        this.timetableId,
        this.createdAt,
        this.expiredTime,
        this.createdTime});

  Sessions.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
    timetableId = json['timetable_id'];
    createdAt = json['created_at'];
    expiredTime = json['expired_time'];
    createdTime = json['created_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['session_id'] = this.sessionId;
    data['timetable_id'] = this.timetableId;
    data['created_at'] = this.createdAt;
    data['expired_time'] = this.expiredTime;
    data['created_time'] = this.createdTime;
    return data;
  }
}
