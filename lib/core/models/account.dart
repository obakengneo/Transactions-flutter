class Account {
  String id;
  String userId;
  String accountNumber;
  String name;
  bool active;
  String created;
  String modified;
  int overdraft;
  int balance;
  
  Account({this.id, this.name, this.userId, this.accountNumber, this.balance, this.overdraft, this.modified, this.created, this.active});

  Account.initial()
      : id = '',
        name = '',
        userId = '',
        accountNumber = '',
        balance = 0,
        overdraft = 0,
        active = true,
        created = '',
        modified = '';

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userId = json['userId'];
    accountNumber = json['accountNumber'];
    balance = json['balance'];
    overdraft = json['overdraft'];
    active = json['active'];
    created = json['created'];
    modified = json['modified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['userId'] = this.userId;
    data['accountNumber'] = this.accountNumber;
    data['balance'] = this.balance;
    data['overdraft'] = this.overdraft;
    data['active'] = this.active;
    data['created'] = this.created;
    data['modified'] = this.modified;

    return data;
  }
}