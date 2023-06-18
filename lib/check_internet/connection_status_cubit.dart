import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:currency/check_internet/check_internet.dart';

final internetChecker = CheckInternetConnection();

class ConnectionStatusCubit extends Cubit<ConnectionStatus> {
  late StreamSubscription _connectionSubscription;

  ConnectionStatusCubit() : super(ConnectionStatus.online) {
    _connectionSubscription = internetChecker.internetStatus().listen(emit);
  }

  @override
  Future<void> close() {
    _connectionSubscription.cancel();
    return super.close();
  }
}