class SingleQuestionResponse {
  String? status;
  Data? data;

  SingleQuestionResponse({this.status, this.data});

  SingleQuestionResponse.fromJson(Map<String, dynamic> json) {
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
  List<Question>? question;

  Data({this.question});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['question'] != null) {
      question = <Question>[];
      json['question'].forEach((v) {
        question!.add(new Question.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.question != null) {
      data['question'] = this.question!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Question {
  String? sId;
  StudentId? studentId;
  SubjectId? subjectId;
  String? question;
  bool? solved;
  String? mediaUrl;
  String? createdAt;
  List<Answers>? answers;

  Question(
      {this.sId,
      this.studentId,
      this.subjectId,
      this.mediaUrl,
      this.question,
      this.solved,
      this.createdAt,
      this.answers});

  Question.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    mediaUrl = json["mediaURL"] ?? "";
    studentId = json['studentId'] != null
        ? new StudentId.fromJson(json['studentId'])
        : null;
    subjectId = json['subjectId'] != null
        ? new SubjectId.fromJson(json['subjectId'])
        : null;
    question = json['question'];
    solved = json['solved'];
    createdAt = json['createdAt'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(new Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.studentId != null) {
      data['studentId'] = this.studentId!.toJson();
    }
    if (this.subjectId != null) {
      data['subjectId'] = this.subjectId!.toJson();
    }
    data['question'] = this.question;
    data['solved'] = this.solved;
    data['createdAt'] = this.createdAt;
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudentId {
  String? sId;
  String? name;

  StudentId({this.sId, this.name});

  StudentId.fromJson(Map<String, dynamic> json) {
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

class SubjectId {
  String? sId;
  StudentId? courseId;
  String? name;

  SubjectId({this.sId, this.courseId, this.name});

  SubjectId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    courseId = json['courseId'] != null
        ? new StudentId.fromJson(json['courseId'])
        : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.courseId != null) {
      data['courseId'] = this.courseId!.toJson();
    }
    data['name'] = this.name;
    return data;
  }
}

class Answers {
  String? sId;
  TeacherId? teacherId;
  String? answer;
  String? createdAt;

  Answers({this.sId, this.teacherId, this.answer, this.createdAt});

  Answers.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    teacherId = json['teacherId'] != null
        ? new TeacherId.fromJson(json['teacherId'])
        : null;
    answer = json['answer'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.teacherId != null) {
      data['teacherId'] = this.teacherId!.toJson();
    }
    data['answer'] = this.answer;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class TeacherId {
  String? sId;
  String? name;
  String? profileURL;

  TeacherId({this.sId, this.name, this.profileURL});

  TeacherId.fromJson(Map<String, dynamic> json) {
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
