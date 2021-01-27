import 'package:flutter/material.dart';
import 'package:topcode_interview_test/core/models/account.dart';
import 'package:topcode_interview_test/ui/shared/colors.dart';

class AccountListItem extends StatelessWidget {
  final Account account;
  final Function onTap;
  const AccountListItem({this.account, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                  blurRadius: 3.0,
                  offset: Offset(0.0, 2.0),
                  color: Color.fromARGB(80, 0, 0, 0))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name: '+account.name, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16.0),),
            Text('Acc No.:'+account.accountNumber.toString(), maxLines: 2, overflow: TextOverflow.ellipsis),
            Text('Active: '+account.active.toString(), maxLines: 2, overflow: TextOverflow.ellipsis),
            Text('Balance: '+account.balance.toString(), maxLines: 2, overflow: TextOverflow.ellipsis)
          ],
        ),
      ),
    );
  }
}