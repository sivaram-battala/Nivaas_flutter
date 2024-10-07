import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nivaas/app/repo/login/login_repo.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        final loginModel = await loginRepository.login(event.phoneNumber);
        if (loginModel != null) {
          yield LoginSuccess(loginModel: loginModel);
        } else {
          yield LoginFailure(error: 'Login failed');
        }
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
