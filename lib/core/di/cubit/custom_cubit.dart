import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCubit<State> extends Cubit<State>{
  CustomCubit(super.initialState);

  /// دي ميثود عملتلها override عشان اتجنب مشكلة اني ابعت emit بعد ما ال cubit اتقفل
  /// ودي مشكلة معروفة في ال bloc library
  /// Cannot emit new states after calling close اللي هي دي ;
  @override
  void emit(State state) {
    if(!isClosed){
      super.emit(state);
    }
  }
}