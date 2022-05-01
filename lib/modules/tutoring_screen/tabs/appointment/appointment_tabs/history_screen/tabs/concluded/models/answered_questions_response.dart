class AnsweredQuestionResponse {
  String? status;
  int? results;
  Data? data;

  AnsweredQuestionResponse({this.status, this.results, this.data});

  AnsweredQuestionResponse.fromJson(Map<String, dynamic> json) {
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
  List<Answers>? answers;

  Data({this.answers});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(new Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answers {
  String? sId;
  QuestionId? questionId;
  String? teacherId;
  String? answer;
  String? createdAt;

  Answers(
      {this.sId, this.questionId, this.teacherId, this.answer, this.createdAt});

  Answers.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    questionId = json['questionId'] != null
        ? new QuestionId.fromJson(json['questionId'])
        : null;
    teacherId = json['teacherId'];
    answer = json['answer'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.questionId != null) {
      data['questionId'] = this.questionId!.toJson();
    }
    data['teacherId'] = this.teacherId;
    data['answer'] = this.answer;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class QuestionId {
  String? sId;
  String? question;
  bool? solved;

  QuestionId({this.sId, this.question, this.solved});

  QuestionId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    question = json['question'];
    solved = json['solved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['question'] = this.question;
    data['solved'] = this.solved;
    return data;
  }
}
