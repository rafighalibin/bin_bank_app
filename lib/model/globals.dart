library my_prj.globals;

import 'package:bin_bank_app/utility/transactions_fetch.dart';
import '../model/transactions.dart';

String username = "";
Future<List<Transactions>> list = fetchTransactions1(username);
