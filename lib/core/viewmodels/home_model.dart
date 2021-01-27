import 'package:topcode_interview_test/core/enums/viewstate.dart';
import 'package:topcode_interview_test/core/models/account.dart';
import 'package:topcode_interview_test/core/services/api.dart';
import 'package:topcode_interview_test/locator.dart';

import 'base_model.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  List<Account> accounts;

  Future getAccounts(String userId) async {
    setState(ViewState.Busy);
    accounts = await _api.getAccountsForUser(userId);
    setState(ViewState.Idle);
  }
}