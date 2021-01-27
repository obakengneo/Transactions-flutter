import 'package:topcode_interview_test/core/enums/viewstate.dart';
import 'package:topcode_interview_test/core/models/account.dart';
import 'package:topcode_interview_test/core/services/api.dart';

import '../../locator.dart';
import 'base_model.dart';

class AccountModel extends BaseModel {
  Api _api = locator<Api>();

  Account account;

  Future fetchAccount(String id) async {
    setState(ViewState.Busy);
    account = await _api.getAccount(id);
    setState(ViewState.Idle);
  }
}