
import '../../../../domain/core/core.dart';
import '../../network.dart';

abstract class BaseProvider {
  String buildPath(String path, {int? port}) {
    if (port == null) return path;
    return ':$port$path';
  }

  Future<ApiResponse<T>> apiCall<T>(
      Future<Response> request, {
        required T Function(dynamic data) dataFromJson,
        T? Function(dynamic errorData)? errorDataFromJson,
      }) async {
    try {
      final response = await request;
      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
            (data) {
          return dataFromJson(data);
        },
      );
    } on DioException catch (e, s) {
      if (e.error is SessionExpiredException) {
        throw SessionExpiredException();
      }

      final errors = e.response?.data.toString();
      if (errors != null &&
          (errors.contains('card_is_blacklisted') ||
              errors.contains('user_is_blocked') ||
              errors.contains('device_is_blocked'))) {
        throw UserBlockedException('user_is_blocked');
      }

      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return ApiResponse<T>(
            null,
            success: false,
            errors: ['connection TimeOut'],
            developerMessage: {
              'exception': e,
              'stackTrace': s,
            },
          );
        case DioExceptionType.connectionError:
          return ApiResponse<T>(
            null,
            success: false,
            errors: ['connection Error'],
            developerMessage: {
              'exception': e,
              'stackTrace': s,
            },
          );
        case DioExceptionType.badCertificate:
          return ApiResponse<T>(
            null,
            success: false,
            errors: [e.message],
            developerMessage: {
              'exception': e,
              'stackTrace': s,
            },
          );
        case DioExceptionType.badResponse:
        case DioExceptionType.unknown:
          final errorData = e.response?.data;
          if (errorData != null) {
            try {
              final errorResponse = ApiResponse.fromJson(
                errorData as Map<String, dynamic>,
                    (data) => errorDataFromJson?.call(data),
              );

              return ApiResponse<T>(
                errorResponse.data,
                success: errorResponse.success,
                errors: errorResponse.errors,
                developerMessage: {
                  'exception': e,
                  'stackTrace': s,
                },
              );
            } catch (ee) {
              return ApiResponse(
                null,
                success: false,
                errors: ['Error code: ${e.response?.statusCode}'],
              );
            }
          }
          return ApiResponse(
            null,
            success: false,
            errors: ['Error code: ${e.response?.statusCode}'],
          );
        case DioExceptionType.cancel:
          throw RequestCancelled(e.message);
      }
    } on RequestCancelled {
      rethrow;
    } on Exception catch (e, s) {
      return ApiResponse<T>(
        null,
        errors: ['something Went Wrong'],
        success: false,
        developerMessage: {
          'exception': e,
          'stackTrace': s,
        },
      );
    }
  }
}
