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
  String? authProvider;
  String? role;
  String? email;
  String? work;
  String? contact;
  List<Subjects>? subjects;
  num? hourlyRate;
  num? minuteRate;
  num? avgRating;
  bool? enableInstantSession;
  bool? disabled;
  bool? approved;
  String? createdAt;
  String? description;
  Experience? experience;
  num? students;
  String? profileURL;

  Teacher(
      {this.sId,
      this.name,
      this.authProvider,
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
      this.description,
      this.experience,
      this.students,
      this.profileURL});

  Teacher.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    authProvider = json['authProvider'];
    role = json['role'];
    email = json['email'];
    contact = json['contact'] != null ? json['contact'].toString() : "";
    work = json['work'];
    if (json['subjects'] != null) {
      subjects = <Subjects>[];
      json['subjects'].forEach((v) {
        subjects!.add(new Subjects.fromJson(v));
      });
    } else {
      subjects = [];
    }
    hourlyRate = json['hourlyRate'];
    minuteRate = json['minuteRate'];
    avgRating = json['avgRating'];
    enableInstantSession = json['enableInstantSession'];
    disabled = json['disabled'];
    approved = json['approved'];
    createdAt = json['createdAt'];
    description = json['description'];
    experience = json['experience'] != null
        ? new Experience.fromJson(json['experience'])
        : null;
    students = json['students'];
    profileURL = json['profileURL'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['authProvider'] = this.authProvider;
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
    data['description'] = this.description;
    if (this.experience != null) {
      data['experience'] = this.experience!.toJson();
    }
    data['students'] = this.students;
    data['profileURL'] = this.profileURL;
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

class Experience {
  String? numberDecimal;

  Experience({this.numberDecimal});

  Experience.fromJson(Map<String, dynamic> json) {
    numberDecimal = json['$numberDecimal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$numberDecimal'] = this.numberDecimal;
    return data;
  }
}
