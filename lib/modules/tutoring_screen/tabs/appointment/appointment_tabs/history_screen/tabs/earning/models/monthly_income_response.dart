class MonthlyIncomeResponse {
  String? status;
  Data? data;

  MonthlyIncomeResponse({this.status, this.data});

  MonthlyIncomeResponse.fromJson(Map<String, dynamic> json) {
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
  List<Incomes>? incomes;

  Data({this.incomes});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['incomes'] != null) {
      incomes = <Incomes>[];
      json['incomes'].forEach((v) {
        incomes!.add(new Incomes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.incomes != null) {
      data['incomes'] = this.incomes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Incomes {
  num? income;
  num? month;

  Incomes({this.income, this.month});

  Incomes.fromJson(Map<String, dynamic> json) {
    income = json['income'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['income'] = this.income;
    data['month'] = this.month;
    return data;
  }
}
