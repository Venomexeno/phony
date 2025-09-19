import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCubit<State> extends Cubit<State>{
  CustomCubit(super.initialState);

  @override
  void emit(State state) {
    if(!isClosed){
      super.emit(state);
    }
  }
}