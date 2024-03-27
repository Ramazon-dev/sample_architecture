
import '../../../../database/app_storage.dart';
import '../../../network.dart';

class AuthProviderImpl extends AuthProvider {
  final Dio apiClient;
  final AppStorage storage;

  AuthProviderImpl(this.apiClient, this.storage);

  @override
  Future<ApiResponse<List<CbuRate>>> getUserByNumber(String phone) {
    final item = apiCall(
      apiClient.get('https://cbu.uz/uz/arkhiv-kursov-valyut/json/'),
      dataFromJson: (data) {
        print('qqqqqq $data');
        return (data as List<dynamic>)
            .cast<Map<String, dynamic>>()
            .map((e) => CbuRate.fromJson(e))
            .toList();
      },
    );
    return item;
  }

  @override
  Future<ApiResponse<DynamicDto>> getDynamicData() async {
    final res = await apiClient.get(DynamicEndpoint.apiUrl);
    print('object response ${res.data}');
    return ApiResponse(DynamicDto.fromJson(res.data), success: true);
  }
}
