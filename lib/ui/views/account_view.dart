import 'package:flutter/material.dart';
import 'package:topcode_interview_test/core/models/account.dart';
import 'package:topcode_interview_test/core/viewmodels/transaction_model.dart';
import 'package:topcode_interview_test/ui/shared/colors.dart';
import 'package:topcode_interview_test/ui/shared/styles.dart';
import 'package:topcode_interview_test/ui/shared/ui_helpers.dart';
import 'package:toast/toast.dart';

import 'base_view.dart';

class AccountView extends StatelessWidget {
  final Account account;
  AccountView({this.account});

  var amount;

  final amountController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<TransactionModel>(
      builder: (context, model, child) => WillPopScope(
        onWillPop: () {
          Navigator.pushNamed(context, '/home'); 
        },
              child: Scaffold(
        backgroundColor: accentColor,
        body: Padding (
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              UIHelper.verticalSpaceLarge(),
              Text(account.name, style: headerStyle),
              UIHelper.verticalSpaceMedium(),

              Text('Account No.: '+account.accountNumber, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0)),
              Text('Account ID: '+account.id, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0)),
              Text('Balance: '+account.balance.toString(), maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0)),
              Text('Overdraft: '+account.overdraft.toString(), maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0)),
              Text('Date created: '+account.created.toString(), maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0)),
              Text('Date modified: '+account.modified, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0)),
              Text('Active: '+account.active.toString(), maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0)),
              
            Column(children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                child: TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                decoration: InputDecoration(
                labelText: 'Amount to Deposit/Withdraw eg. 500'
               ),
              ),
              )
            ],),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                margin: EdgeInsets.all(10),
                child: FlatButton(
                  child: Text('Deposit'),
                  color: backgroundColor,
                  textColor: Colors.black,
                  onPressed: () async {
                    var depositSuccess = await model.depositMoney(amountController.text, account.id);

                    if (depositSuccess) {
                      _showToast(context, 'R'+amountController.text+' was deposited into Account: '+account.name);
                      Navigator.pushNamed(context, '/home', arguments: account);
                    } else {
                      _showToast(context, 'Transaction failed');
                    }
                  },
                ),
              ),

                Container(
                margin: EdgeInsets.all(10),
                child: FlatButton(
                  child: Text('Withdraw'),
                  color: backgroundColor,
                  textColor: Colors.black,
                  onPressed: () async {
                    var withdrawSuccess = await model.withdrawMoney(amountController.text, account.id);

                    if(withdrawSuccess) {
                      _showToast(context, 'R'+amountController.text+' was withdrawn from Account: '+account.name);   
                      Navigator.pushNamed(context, '/home');                                   
                    } else {
                      _showToast(context, 'Transaction failed');
                    }   
                  },
                ),
              ),
              ],
            ),
            ],
          ),
        ),
    ),
      ),);
  }

  _showToast(BuildContext context, String message) {
    Toast.show(message, context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
  }
}