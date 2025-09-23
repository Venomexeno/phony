import '../../../../core/models/device.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/network/api_helper.dart';

abstract class SearchRemoteDataSource {
  Future<List<Device>> searchDevices(String query);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiHelper _apiHelper;

  SearchRemoteDataSourceImpl(this._apiHelper);

  @override
  Future<List<Device>> searchDevices(String query) async {
    final response = await _apiHelper.get<List<dynamic>>(
      endPoint: ApiK.search,
      queries: {
        'q': query,
      },
    );

    return response.map((e) => Device.fromMap(e)).toList();
  }
}
