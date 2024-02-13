
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_fintech_app/features/login/bloc/login_stae.dart';
import 'package:my_fintech_app/features/login/repository/login_repository.dart';


class LoginBloc extends Cubit<LoginState>{
  LoginBloc(): super(LoginState.empty);

  LoginRepository loginRepository = LoginRepository();

  void logout()async{
    await FirebaseAuth.instance.signOut();
  }

  void login(String emailAddress, String password)async{
    emit(state.copyWith(loginStatus: LoginStatus.Processing));

    try{
      await loginRepository.loginUser(email: emailAddress, password: password);
      emit(state.copyWith(loginStatus: LoginStatus.Successful));
    }catch(e,s){
      print(e);
      emit(state.copyWith(loginStatus: LoginStatus.Error));
    }
  }

  void reset() async{
    emit(LoginState.empty);
  }
}