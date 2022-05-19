class TeacherSchedules {
  String? status;
  int? results;
  Data? data;

  TeacherSchedules({this.status, this.results, this.data});

  TeacherSchedules.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['results'] = this.results;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Schedules>? schedules;

  Data({this.schedules});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['schedules'] != null) {
      schedules = <Schedules>[];
      json['schedules'].forEach((v) {
        schedules!.add(new Schedules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.schedules != null) {
      data['schedules'] = this.schedules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Schedules {
  String? sId;
  String? teacherId;
  int? year;
  int? month;
  List<int>? days;
  From? from;
  From? to;
  String? createdAt;

  Schedules(
      {this.sId,
      this.teacherId,
      this.year,
      this.month,
      this.days,
      this.from,
      this.to,
      this.createdAt});

  Schedules.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    teacherId = json['teacherId'];
    year = json['year'];
    month = json['month'];
    days = json['days'].cast<int>();
    from = json['from'] != null ? new From.fromJson(json['from']) : null;
    to = json['to'] != null ? new From.fromJson(json['to']) : null;
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['teacherId'] = this.teacherId;
    data['year'] = this.year;
    data['month'] = this.month;
    data['days'] = this.days;
    if (this.from != null) {
      data['from'] = this.from!.toJson();
    }
    if (this.to != null) {
      data['to'] = this.to!.toJson();
    }
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class From {
  int? hour;
  int? minute;

  From({this.hour, this.minute});

  From.fromJson(Map<String, dynamic> json) {
    hour = json['hour'];
    minute = json['minute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hour'] = this.hour;
    data['minute'] = this.minute;
    return data;
  }
}
