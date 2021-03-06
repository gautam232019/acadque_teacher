class TeacherProfileResponse {
  String? status;
  Data? data;

  TeacherProfileResponse({this.status, this.data});

  TeacherProfileResponse.fromJson(Map<String, dynamic> json) {
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
  Teacher? teacher;

  Data({this.teacher});

  Data.fromJson(Map<String, dynamic> json) {
    teacher =
        json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teacher != null) {
      data['teacher'] = this.teacher!.toJson();
    }
    return data;
  }
}

class Teacher {
  String? sId;
  String? name;
  String? uuid;
  String? authProvider;
  String? profileURL;
  String? role;
  String? email;
  String? work;
  List<Subjects>? subjects;
  int? hourlyRate;
  int? minuteRate;
  int? avgRating;
  bool? enableInstantSession;
  bool? disabled;
  bool? approved;
  String? createdAt;
  String? contact;
  List<Connects>? connects;

  Teacher(
      {this.sId,
      this.name,
      this.uuid,
      this.authProvider,
      this.profileURL,
      this.role,
      this.email,
      this.work,
      this.subjects,
      this.hourlyRate,
      this.minuteRate,
      this.avgRating,
      this.enableInstantSession,
      this.disabled,
      this.approved,
      this.createdAt,
      this.contact,
      this.connects});

  Teacher.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    uuid = json['uuid'];
    authProvider = json['authProvider'];
    profileURL = json['profileURL'];
    role = json['role'];
    email = json['email'];
    work = json['work'];
    if (json['subjects'] != null) {
      subjects = <Subjects>[];
      json['subjects'].forEach((v) {
        subjects!.add(new Subjects.fromJson(v));
      });
    }
    hourlyRate = json['hourlyRate'];
    minuteRate = json['minuteRate'];
    avgRating = json['avgRating'];
    enableInstantSession = json['enableInstantSession'];
    disabled = json['disabled'];
    approved = json['approved'];
    createdAt = json['createdAt'];
    contact = json['contact'] != null ? json['contact'].toString() : "";
    if (json['connects'] != null) {
      connects = <Connects>[];
      json['connects'].forEach((v) {
        connects!.add(new Connects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['uuid'] = this.uuid;
    data['authProvider'] = this.authProvider;
    data['profileURL'] = this.profileURL;
    data['role'] = this.role;
    data['email'] = this.email;
    data['work'] = this.work;
    if (this.subjects != null) {
      data['subjects'] = this.subjects!.map((v) => v.toJson()).toList();
    }
    data['hourlyRate'] = this.hourlyRate;
    data['minuteRate'] = this.minuteRate;
    data['avgRating'] = this.avgRating;
    data['enableInstantSession'] = this.enableInstantSession;
    data['disabled'] = this.disabled;
    data['approved'] = this.approved;
    data['createdAt'] = this.createdAt;
    data['contact'] = this.contact;
    if (this.connects != null) {
      data['connects'] = this.connects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subjects {
  String? sId;
  CourseId? courseId;
  String? name;
  bool? disabled;

  Subjects({this.sId, this.courseId, this.name, this.disabled});

  Subjects.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    courseId = json['courseId'] != null
        ? new CourseId.fromJson(json['courseId'])
        : null;
    name = json['name'];
    disabled = json['disabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.courseId != null) {
      data['courseId'] = this.courseId!.toJson();
    }
    data['name'] = this.name;
    data['disabled'] = this.disabled;
    return data;
  }
}

class CourseId {
  String? sId;
  String? name;

  CourseId({this.sId, this.name});

  CourseId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}

class Connects {
  String? name;
  String? url;
  String? sId;

  Connects({this.name, this.url, this.sId});

  Connects.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['_id'] = this.sId;
    return data;
  }
}
