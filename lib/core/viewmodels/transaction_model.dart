import 'package:topcode_interview_test/core/enums/viewstate.dart';
import 'package:topcode_interview_test/core/services/api.dart';
import '../../locator.dart';
import 'base_model.dart';

class TransactionModel extends BaseModel {
  Api _api = locator<Api>();

  Future<bool> depositMoney(String amount, String id) async {
    setState(ViewState.Busy);

    bool deposit = await _api.postDeposit(amount, id);
    setState(ViewState.Idle);

    return deposit;
  }

  Future<bool> withdrawMoney(String amount, String id) async {
    setState(ViewState.Busy);

    bool withdraw = await _api.postWithdraw(amount, id);
    setState(ViewState.Idle);

    return withdraw;
  }
}