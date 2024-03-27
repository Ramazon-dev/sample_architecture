import 'dart:async';
import 'dart:developer';

import '../../data/network/network.dart';
import '../core/core.dart';

abstract class BaseRepository {

  @Deprecated('Use toResult2()')
  Future<Result<DATA>> toResult<DATA, T extends ApiResponse<DATA>>(
      Future<T> future, {
        Future Function(DATA data)? onSuccess,
        Future Function(ApiResponse)? onError,
        Future Function(Object e)? onFailed,
      }) async {
    try {
      final response = await future;
      if (response.success) {
        final data = response.data as DATA;
        await onSuccess?.call(data);
        return Result.completed(data);
      }
      await onError?.call(response);

      final errors = response.errors;

      if (errors is List) {
        return Result.error(
          errorCodesToMessage(errors.cast<String>()),
          errorCodes: List.from(errors),
        );
      } else if (errors is Map<String, dynamic>) {
        final errorMessage = errors['msg'];
        if (errorMessage != null && errorMessage is String) {
          return Result.error(
            errorCodesToMessage([errorMessage]),
            errorCodes: [errorMessage],
          );
        }
      }
      return Result.error(
        response.errors?.toString() ?? 'LocaleKeys.somethingWentWrong.tr()',
        errorCodes: [response.errors.toString()],
      );
    } on SessionExpiredException {
      // final currentContext =
      //     GetIt.I.get<AppRouter>().navigatorKey.currentContext;
      // currentContext?.read<AuthCubit>().onLogout(invalidSession: true);
      return Result.error('SessionExpired');
    } catch (e) {
      await onFailed?.call(e);
      return Result.error('LocaleKeys.somethingWentWrong.tr()');
    }
  }

  String errorCodesToMessage(List<String> errorCodes) {
    final localizedErrors = errorCodes.map((errorCode) {
      return errorCode;
    });
    return localizedErrors.join(', ');
  }

  Future<Result<DATA>> toResult2<DATA, RESPONSE extends ApiResponse>(
      Future<RESPONSE> future, {
        required FutureOr<DATA> Function(RESPONSE response) fromSuccessResponse,
        FutureOr<Result<DATA>> Function(Result<DATA> result)? switchMap,
      }) async {
    try {
      final response = await future;
      if (response.success) {
        final data = await fromSuccessResponse.call(response);
        final result = Result.completed(data);
        return switchMap?.call(result) ?? result;
      }

      final errors = response.errors;

      if (errors is List) {
        final Result<DATA> errorResult = Result.error(
          errorCodesToMessage(errors.cast<String>()),
          errorCodes: List.from(errors),
        );
        return switchMap?.call(errorResult) ?? errorResult;
      } else if (errors is Map<String, dynamic>) {
        final errorMessage = errors['msg'];
        if (errorMessage != null && errorMessage is String) {
          final errorResult = Result<DATA>.error(
            errorCodesToMessage([errorMessage]),
            errorCodes: [errorMessage],
            errorData: errors,
          );
          return switchMap?.call(errorResult) ?? errorResult;
        }
      }

      final errorResult = Result<DATA>.error(
        response.errors?.toString() ?? 'LocaleKeys.somethingWentWrong.tr()',
        errorCodes: [response.errors.toString()],
      );
      return switchMap?.call(errorResult) ?? errorResult;
    } on SessionExpiredException {
      // final currentContext =
      //     GetIt.I.get<AppRouter>().navigatorKey.currentContext;
      // currentContext?.read<AuthCubit>().onLogout(invalidSession: true);
      return Result<DATA>.error('SessionExpired');
    } on UserBlockedException catch (e) {
      // final currentContext =
      //     GetIt.I.get<AppRouter>().navigatorKey.currentContext;
      // currentContext?.read<AuthCubit>().onLogout(invalidSession: true);
      return Result<DATA>.error('backendCodeToMessage($e.message)');
    } on RequestCancelled catch (e) {
      final errorResult =
      Result<DATA>.error('LocaleKeys.somethingWentWrong.tr()', errorData: e);
      return switchMap?.call(errorResult) ?? errorResult;
    } on Exception catch (e) {
      log(e.toString());
      final errorResult =
      Result<DATA>.error('LocaleKeys.somethingWentWrong.tr()');
      return switchMap?.call(errorResult) ?? errorResult;
    } catch (e) {
      log(e.toString());
      final errorResult =
      Result<DATA>.error('LocaleKeys.somethingWentWrong.tr()');
      return switchMap?.call(errorResult) ?? errorResult;
    }
  }
}
