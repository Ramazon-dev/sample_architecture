import '../../network.dart';

abstract class AuthProvider extends BaseProvider {
  Future<ApiResponse<List<CbuRate>>> getUserByNumber(String phone);

  Future<ApiResponse<DynamicDto>> getDynamicData();
}
