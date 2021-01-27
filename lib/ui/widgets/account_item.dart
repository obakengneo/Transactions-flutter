import 'package:flutter/material.dart';
import 'package:topcode_interview_test/core/enums/viewstate.dart';
import 'package:topcode_interview_test/core/models/account.dart';
import 'package:topcode_interview_test/core/viewmodels/account_model.dart';
import 'package:topcode_interview_test/ui/shared/colors.dart';
import 'package:topcode_interview_test/ui/views/base_view.dart';

class Accounts extends StatelessWidget {
  final String account;
  Accounts(this.account);

  @override
  Widget build(BuildContext context) {
    return BaseView<AccountModel>(
      onModelReady: (model) => model.fetchAccount(account),
      builder: (context, model, child) => model.state == ViewState.Busy
      ? Center(child: CircularProgressIndicator())
      : Expanded(child: AccountItem(model.account),)
    );
  }
}

/// Renders a single comment given a comment model
class AccountItem extends StatelessWidget {
  final Account account;
  const AccountItem(this.account);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: accentColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Account: '+account.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

