import '../models/top_devices_section.dart';
import '../models/top_devices_by_fans.dart';
import '../models/top_devices_by_interest.dart';

enum TopDevicesEnum {
  fans(title: 'Top 10 By Fans', fromMap: TopDevicesByFans.fromMap),
  dailyInterest(title: 'Top 10 By Daily Interest', fromMap: TopDevicesByInterest.fromMap);

  final String title;

  final TopDevicesSection Function(Map<String, dynamic> map) fromMap;

  bool get isFans => this == fans;
  bool get isDailyHits => this == dailyInterest;

  static TopDevicesEnum convertTitleToEnum(String title) {
    final titleLowerCased = title.toLowerCase();
    if (titleLowerCased.contains('fans')) return fans;
    if (titleLowerCased.contains('daily interest')) return dailyInterest;
    throw Exception('Invalid title');
  }

  const TopDevicesEnum({
    required this.title,
    required this.fromMap,
  });
}
