import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'network_connection_helper.dart';

class InternetConnectionCheckerHelper extends NetworkConnectionHelper<InternetConnectionStatus> {
  
  final InternetConnectionChecker checker;

  InternetConnectionCheckerHelper({
    required this.checker,
  });

  @override
  bool isConnectedBuilder(InternetConnectionStatus status) {
    return status == InternetConnectionStatus.connected;
  }
  
  @override
  Stream<InternetConnectionStatus> streamBuilder() {
    return checker.onStatusChange;
  }
  
  @override
  Future<bool> pingConnection() async{
    return await checker.hasConnection;
  }

}