import 'dart:async';

abstract class NetworkConnectionHelper<T>{

  Stream<T>? _connectionStram;

  bool _isConnected =false;

  Future<bool> get isConnected async{
    if(_connectionStram == null){
      _isConnected = await pingConnection();
      _openStream();
    }

    return _isConnected;
  }

  void _openStream() {
    _connectionStram = streamBuilder();
    _connectionStram!.listen((T connectionIndicator){
      _isConnected = isConnectedBuilder(connectionIndicator);
    });
  }

  Stream<T> streamBuilder();

  bool isConnectedBuilder(T connectionIndicator);

  Future<bool> pingConnection();

}

