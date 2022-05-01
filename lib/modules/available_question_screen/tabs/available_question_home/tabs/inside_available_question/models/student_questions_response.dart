class StudentQuestionsResponse {
  String? status;
  int? results;
  Data? data;

  StudentQuestionsResponse({this.status, this.results, this.data});

  StudentQuestionsResponse.fromJson(Map<String, dynamic> json) {
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
  List<Questions>? questions;

  Data({this.questions});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? sId;
  String? studentId;
  String? subjectId;
  String? question;
  bool? solved;
  String? createdAt;
  String? mediaURL;

  Questions(
      {this.sId,
      this.studentId,
      this.subjectId,
      this.question,
      this.solved,
      this.createdAt,
      this.mediaURL});

  Questions.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    studentId = json['studentId'];
    subjectId = json['subjectId'];
    question = json['question'];
    solved = json['solved'];
    createdAt = json['createdAt'];
    mediaURL = json['mediaURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['studentId'] = this.studentId;
    data['subjectId'] = this.subjectId;
    data['question'] = this.question;
    data['solved'] = this.solved;
    data['createdAt'] = this.createdAt;
    data['mediaURL'] = this.mediaURL;
    return data;
  }
}
