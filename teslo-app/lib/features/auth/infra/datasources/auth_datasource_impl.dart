import 'package:dio/dio.dart';
import 'package:teslo_shop/config/config.dart';
import 'package:teslo_shop/features/auth/domain/domain.dart';
import 'package:teslo_shop/features/auth/infra/infrastructure.dart';

class AuthDatasourceImpl extends AuthDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: Environment.apiUrl, contentType: 'application/json'));

  @override
  Future<User> checkAuthStatus(String token) async {
    try {
      final response = await dio.get('/auth/check-status',
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      final user = UserMapper.userJsonToEntity(response.data);
      return user;
      
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
        throw CustomError('Invalid Token');
      }

      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError(e.response?.data['message'] ?? 'Connection Timeout ');
      }

      throw Exception('Error no controlado de red o servidor');
    } catch (e) {
      throw Exception('Error desconocido al iniciar sesión: ${e.toString()}');
    }
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await dio
          .post('/auth/login', data: {'email': email, 'password': password});

      final user = UserMapper.userJsonToEntity(response.data);
      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
        throw CustomError(e.response?.data['message'] ?? 'Invalid Credentials');
      }

      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError(e.response?.data['message'] ?? 'Connection Timeout ');
      }

      throw Exception('Error no controlado de red o servidor');
    } catch (e) {
      throw Exception('Error desconocido al iniciar sesión: ${e.toString()}');
    }
  }

  @override
  Future<User> register(String email, String password, String fullName) async {
    try {
      final response = await dio.post('auth/register', data: {
        'email': email,
        'password': password,
        'fullName': fullName,
      });
      final user = UserMapper.userJsonToEntity(response.data);
      return user;
    } catch (e) {
      throw Exception();
    }
  }
}
