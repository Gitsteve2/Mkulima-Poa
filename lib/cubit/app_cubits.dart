import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkulima_poa/cubit/app_cubit_states.dart';
import 'package:mkulima_poa/pages/home_page.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits() : super(InitialState()) {
    emit(WelcomeState());
  }

  void getData() {
    try {
      emit(HomeState());
    } catch (e) {
      // print(e);
    }
  }

  detailPage() {
    emit(DetailState());
  }

  goHome() {
    emit(HomeState());
  }
}
