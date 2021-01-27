import 'package:get_it/get_it.dart';
import 'package:topcode_interview_test/core/services/api.dart';
import 'package:topcode_interview_test/core/viewmodels/account_model.dart';
import 'package:topcode_interview_test/core/viewmodels/transaction_model.dart';
import 'package:topcode_interview_test/core/viewmodels/home_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => HomeModel());
  locator.registerLazySingleton(() => AccountModel());
  locator.registerLazySingleton(() => TransactionModel());
  locator.registerLazySingleton(() => Api());
}