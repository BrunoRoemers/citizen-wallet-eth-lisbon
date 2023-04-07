import 'package:citizenwallet/models/transaction.dart';
import 'package:citizenwallet/models/wallet.dart';
import 'package:flutter/cupertino.dart';

class WalletState extends ChangeNotifier {
  Wallet? wallet;
  bool loading = false;
  bool error = false;

  final List<Wallet> wallets = [];
  bool loadingWallets = false;
  bool errorWallets = false;

  final List<Transaction> transactions = [];
  bool loadingTransactions = false;
  bool errorTransactions = false;

  void walletRequest() {
    loading = true;
    error = false;
    notifyListeners();
  }

  void walletSuccess(Wallet wallet) {
    this.wallet = wallet;
    loading = false;
    error = false;
    notifyListeners();
  }

  void walletError() {
    loading = false;
    error = true;
    notifyListeners();
  }

  void walletListRequest() {
    loadingWallets = true;
    errorWallets = false;
    notifyListeners();
  }

  void walletListSuccess(List<Wallet> wallets) {
    this.wallets.clear();
    this.wallets.addAll(wallets);
    loadingWallets = false;
    errorWallets = false;
    notifyListeners();
  }

  void walletListError() {
    loadingWallets = false;
    errorWallets = true;
    notifyListeners();
  }

  void transactionListRequest() {
    loadingTransactions = true;
    errorTransactions = false;
    notifyListeners();
  }

  void transactionListSuccess(List<Transaction> transactions) {
    this.transactions.clear();
    this.transactions.addAll(transactions);
    loadingTransactions = false;
    errorTransactions = false;
    notifyListeners();
  }

  void transactionListError() {
    loadingTransactions = false;
    errorTransactions = true;
    notifyListeners();
  }
}
