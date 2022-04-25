class SubjectResponse {
  String? status;
  int? results;
  Data? data;

  SubjectResponse({this.status, this.results, this.data});

  SubjectResponse.fromJson(Map<String, dynamic> json) {
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
  List<Subjects>? subjects;

  Data({this.subjects});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['subjects'] != null) {
      subjects = <Subjects>[];
      json['subjects'].forEach((v) {
        subjects!.add(new Subjects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subjects != null) {
      data['subjects'] = this.subjects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subjects {
  String? sId;
  CourseId? courseId;
  String? name;
  bool? disabled;
  String? createdAt;

  Subjects({this.sId, this.courseId, this.name, this.disabled, this.createdAt});

  Subjects.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    courseId = json['courseId'] != null
        ? new CourseId.fromJson(json['courseId'])
        : null;
    name = json['name'];
    disabled = json['disabled'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.courseId != null) {
      data['courseId'] = this.courseId!.toJson();
    }
    data['name'] = this.name;
    data['disabled'] = this.disabled;
    data['createdAt'] = this.createdAt;
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
