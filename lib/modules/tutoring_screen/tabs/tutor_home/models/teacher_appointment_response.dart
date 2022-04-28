class TeacherAppointmentResponse {
  String? status;
  int? results;
  Data? data;

  TeacherAppointmentResponse({this.status, this.results, this.data});

  TeacherAppointmentResponse.fromJson(Map<String, dynamic> json) {
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
  List<Appointments>? appointments;

  Data({this.appointments});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['appointments'] != null) {
      appointments = <Appointments>[];
      json['appointments'].forEach((v) {
        appointments!.add(new Appointments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.appointments != null) {
      data['appointments'] = this.appointments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Appointments {
  String? sId;
  String? type;
  StudentId? studentId;
  StudentId? teacherId;
  String? from;
  String? to;
  int? duration;
  String? status;
  String? createdAt;
  int? iV;
  String? orderId;
  String? ratingId;

  Appointments(
      {this.sId,
      this.type,
      this.studentId,
      this.teacherId,
      this.from,
      this.to,
      this.duration,
      this.status,
      this.createdAt,
      this.iV,
      this.orderId,
      this.ratingId});

  Appointments.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    studentId = json['studentId'] != null
        ? new StudentId.fromJson(json['studentId'])
        : null;
    teacherId = json['teacherId'] != null
        ? new StudentId.fromJson(json['teacherId'])
        : null;
    from = json['from'];
    to = json['to'];
    duration = json['duration'];
    status = json['status'];
    createdAt = json['createdAt'];
    iV = json['__v'];
    orderId = json['orderId'];
    ratingId = json['ratingId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    if (this.studentId != null) {
      data['studentId'] = this.studentId!.toJson();
    }
    if (this.teacherId != null) {
      data['teacherId'] = this.teacherId!.toJson();
    }
    data['from'] = this.from;
    data['to'] = this.to;
    data['duration'] = this.duration;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    data['orderId'] = this.orderId;
    data['ratingId'] = this.ratingId;
    return data;
  }
}

class StudentId {
  String? sId;
  String? name;
  String? profileURL;

  StudentId({this.sId, this.name, this.profileURL});

  StudentId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    profileURL = json['profileURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['profileURL'] = this.profileURL;
    return data;
  }
}
