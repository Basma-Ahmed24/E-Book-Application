import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/blocs/state_theme.dart';

class ModeChangeCubit extends Cubit<ModeChangerStates> {
  static ModeChangeCubit get(context) => BlocProvider.of(context);

  ModeChangeCubit() : super(ModeChangerInitialState());
  bool isdark = true;

  void changeMode() {
    isdark = !isdark;
    emit(ModeChangState());
  }
}
