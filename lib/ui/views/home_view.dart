import 'package:flutter/material.dart';
import 'package:topcode_interview_test/core/enums/viewstate.dart';
import 'package:topcode_interview_test/core/models/account.dart';
import 'package:topcode_interview_test/core/viewmodels/home_model.dart';
import 'package:topcode_interview_test/ui/shared/colors.dart';
import 'package:topcode_interview_test/ui/shared/styles.dart';
import 'package:topcode_interview_test/ui/shared/ui_helpers.dart';
import 'package:topcode_interview_test/ui/widgets/accountlist_item.dart';

import 'base_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) => model.getAccounts('UZyMgwSApiN0b148VDrZSAeWkfb2'),
      builder: (context, model, child) => Scaffold(
        backgroundColor: accentColor,
        body: model.state == ViewState.Busy
        ? Center(child: CircularProgressIndicator())
         : Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             UIHelper.verticalSpaceLarge(),
             Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text('Welcome to Neo',
              style: headerStyle,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10.0),
              child: Text('Here are all your accounts',
              style: subHeaderStyle),
            ),
            UIHelper.verticalSpaceSmall(),
            Expanded(child: getAccountsUi(model.accounts)),
        ],)
      ),
    );
  }

  Widget getAccountsUi(List<Account> accounts) => ListView.builder(
    itemCount: accounts.length,
     itemBuilder: (context, index) => AccountListItem(
      account: accounts[index],
      onTap: () {
        Navigator.pushNamed(context, '/account', arguments: accounts[index]);
      },
     )
  );
}
