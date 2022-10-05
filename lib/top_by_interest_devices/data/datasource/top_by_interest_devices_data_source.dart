import 'package:clean_arc_phony/core/error/exceptions.dart';
import 'package:clean_arc_phony/core/network/api_constance.dart';
import 'package:clean_arc_phony/core/network/error_message_model.dart';
import 'package:clean_arc_phony/top_by_interest_devices/data/models/top_by_interest_devices_model.dart';
import 'package:dio/dio.dart';

abstract class BaseTopByInterestDevicesDataSource {
  Future<List<TopByInterestDevicesModel>> getTopByInterestDevices();
}

class TopByInterestDevicesDataSource
    extends BaseTopByInterestDevicesDataSource {
  @override
  Future<List<TopByInterestDevicesModel>> getTopByInterestDevices() async {
    final response = await Dio().get(ApiConstance.topByInterestDevicesPath);

    if (response.statusCode == 200) {
      return List<TopByInterestDevicesModel>.from(
        (response.data["phones"] as List)
            .map((e) => TopByInterestDevicesModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}