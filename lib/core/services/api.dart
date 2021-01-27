import 'dart:convert';
import 'package:topcode_interview_test/core/models/account.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = 'http://us-central1-momentumtest-bfdef.cloudfunctions.net/app/api/v1/account';

  var client = new http.Client();

  Future<List<Account>> getAccountsForUser(String userId) async {
    var accounts = List<Account>();
    var response = await client.get('$baseUrl/findByUserId?userId=$userId');

    var parsed = json.decode(response.body) as List<dynamic>;

    for (var account in parsed) {
      accounts.add(Account.fromJson(account));
    }

    return accounts;
  }

  Future<Account> getAccount(String id) async {

    var response = await client.get('$baseUrl/$id');

    return Account.fromJson(json.decode(response.body));
  }

  Future<bool> postDeposit(String depositAmount, String id) async {

    var response = await client.post('$baseUrl/deposit/$id?amount=$depositAmount');

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  Future<bool> postWithdraw(String withdrawAmount, String id) async {
    var response = await client.post('$baseUrl/withdraw/$id?amount=$withdrawAmount');

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}