import 'dart:async';

abstract class NetworkConnectionHelper<T>{

  Stream<T>? _connectionStream;

  bool _isConnected =false;

  Future<bool> get isConnected async{
    if(_connectionStream == null){
      _isConnected = await pingConnection();
      _openStream();
    }

    return _isConnected;
  }

  void _openStream() {
    _connectionStream = streamBuilder();
    _connectionStream!.listen((T connectionIndicator){
      _isConnected = isConnectedBuilder(connectionIndicator);
    });
  }

  Stream<T> streamBuilder();

  bool isConnectedBuilder(T connectionIndicator);

  Future<bool> pingConnection();

}

