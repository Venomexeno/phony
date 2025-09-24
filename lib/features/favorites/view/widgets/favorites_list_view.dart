import 'package:flutter/material.dart';
import '../../../../core/models/detailed_device.dart';
import '../../../../core/widgets/custom_list_view.dart';
import 'favorite_item_widget.dart';

class FavoritesListView extends StatelessWidget {
  const FavoritesListView({
    super.key,
    required this.devices,
  });

  final List<DetailedDevice> devices;

  @override
  Widget build(BuildContext context) {
    return CustomListView<DetailedDevice>(
      padding: _padding,
      items: devices,
      itemBuilder: (context, index) => FavoriteItemWidget(device: devices[index]),
      separatorBuilder: (context, index) => SizedBox(height: 10),
    );
  }

  EdgeInsetsGeometry get _padding => EdgeInsets.only(
    left: 10,
    right: 10,
    bottom: 100,
  );
}
