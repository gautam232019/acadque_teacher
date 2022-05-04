class TotalIncomeResponse {
  String? status;
  Data? data;

  TotalIncomeResponse({this.status, this.data});

  TotalIncomeResponse.fromJson(Map<String, dynamic> json) {
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
  List<Balance>? balance;

  Data({this.balance});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['balance'] != null) {
      balance = <Balance>[];
      json['balance'].forEach((v) {
        balance!.add(new Balance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.balance != null) {
      data['balance'] = this.balance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Balance {
  num? totalBalance;
  num? withdraw;
  num? available;

  Balance({this.totalBalance, this.withdraw, this.available});

  Balance.fromJson(Map<String, dynamic> json) {
    totalBalance = json['totalBalance'] ?? 0;
    withdraw = json['withdraw'] ?? 0;
    available = json['available'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalBalance'] = this.totalBalance;
    data['withdraw'] = this.withdraw;
    data['available'] = this.available;
    return data;
  }
}
