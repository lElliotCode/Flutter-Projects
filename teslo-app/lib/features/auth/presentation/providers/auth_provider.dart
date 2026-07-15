import 'package:flutter_riverpod/legacy.dart';
import 'package:teslo_shop/features/auth/domain/domain.dart';
import 'package:teslo_shop/features/auth/infra/infrastructure.dart';



final authProvider =
    StateNotifierProvider.autoDispose<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();

  return AuthNotifier(authRepository: authRepository);
});



class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  AuthNotifier({required this.authRepository}) : super(AuthState());

  Future<void> loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final user = await authRepository.login(email, password);
      _setLoggedUser(user);

    } on WrongCredentials catch (e) {
      logout(' Invalid user credentials $e');

    } on ConnectionTimeout catch (e){
      logout(' Timeout in request $e');

    } catch (e) {
      logout('Error: $e');

    }
    // final user = await authRepository.login(email, password);
    // state = state.copyWith(user: user, authStatus: AuthStatus.authenticated);
  }

  void registerStatus(String email, String password) async {
    
  }

  void checkAuthStatus() async {

  }

  void _setLoggedUser(User user) {
    // TODO: save token on device
    state = state.copyWith(
        user: user, 
        authStatus: AuthStatus.authenticated);
  }

  Future<void> logout(String? errorMessage) async {
    // TODO: clear token
    state = state.copyWith(
      authStatus: AuthStatus.notAuthenticated,
      user: null,
      errorMessage: errorMessage,
    );
  }
}



enum AuthStatus { checking, authenticated, notAuthenticated }



class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String? errorMessage;

  AuthState({
    this.authStatus = AuthStatus.checking,
    this.user,
    this.errorMessage = ''
  });

  AuthState copyWith({
    AuthStatus? authStatus, 
    User? user, 
    String? errorMessage
  }) => AuthState(
        authStatus: authStatus ?? this.authStatus,
        user: user ?? this.user,
        errorMessage: errorMessage ?? this.errorMessage,
      );

}
