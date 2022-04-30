class AppointmentDetailResponse {
  String? status;
  Data? data;

  AppointmentDetailResponse({this.status, this.data});

  AppointmentDetailResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Appointment? appointment;

  Data({this.appointment});

  Data.fromJson(Map<String, dynamic> json) {
    appointment = json['appointment'] != null
        ? new Appointment.fromJson(json['appointment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.appointment != null) {
      data['appointment'] = this.appointment!.toJson();
    }
    return data;
  }
}

class Appointment {
  String? sId;
  String? type;
  StudentId? studentId;
  StudentId? teacherId;
  String? from;
  String? to;
  num? duration;
  String? status;
  String? createdAt;
  num? iV;
  String? orderId;

  Appointment(
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
      this.orderId});

  Appointment.fromJson(Map<String, dynamic> json) {
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
    profileURL = json['profileURL'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['profileURL'] = this.profileURL;
    return data;
  }
}
