import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/device_interface.dart';
import '../../../../core/widgets/custom_search_bar.dart';
import '../../controllers/search_device_cubit/search_device_cubit.dart';
import 'get_search_devices_bloc_builder.dart';

class SearchScreenBody extends StatefulWidget {
  const SearchScreenBody({
    super.key,
    this.onSelectDevice,
  });
  final void Function(DeviceInterface device)? onSelectDevice;

  @override
  State<SearchScreenBody> createState() => _SearchScreenBodyState();
}

class _SearchScreenBodyState extends State<SearchScreenBody> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(_onControllerChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onControllerChanged() {
    context.read<SearchDeviceCubit>().searchDevices(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: Column(
        children: [
          CustomSearchBar(
            autoFocus: true,
            controller: _controller,
          ),
          SizedBox(height: 16),
          Expanded(
            child: GetSearchDevicesBlocBuilder(
              controller: _controller,
              onSelectDevice: widget.onSelectDevice,
            ),
          ),
        ],
      ),
    );
  }

  EdgeInsets get _padding => EdgeInsets.symmetric(
    horizontal: 10,
  );
}
