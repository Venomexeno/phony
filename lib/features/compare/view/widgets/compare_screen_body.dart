import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/device_interface.dart';
import '../../controllers/compare_devices_cubit/compare_devices_cubit.dart';
import 'comare_devices_bloc_builder.dart';
import 'compare_add_device_button.dart';

class CompareScreenBody extends StatefulWidget {
  const CompareScreenBody({
    super.key,
    required this.hasScaffold,
    required this.firstDevice,
  });
  final bool hasScaffold;
  final DeviceInterface? firstDevice;

  @override
  State<CompareScreenBody> createState() => _CompareScreenBodyState();
}

class _CompareScreenBodyState extends State<CompareScreenBody> {
  late DeviceInterface? _firstDevice = widget.firstDevice;
  DeviceInterface? _secondDevice;

  void _onSelectDevice(DeviceInterface device) {
    setState(() {
      _firstDevice = device;
    });
    _onCompareDevices();
  }

  void _onSelectSecondDevice(DeviceInterface device) {
    setState(() {
      _secondDevice = device;
    });
    _onCompareDevices();
  }

  void _onCompareDevices() {
    if (_firstDevice == null || _secondDevice == null) return;
    context.read<CompareDevicesCubit>().compareDevices(
      _firstDevice!,
      _secondDevice!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: widget.hasScaffold ? 0 : 100,
      ),
      child: Column(
        spacing: 16,
        children: [
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: CompareAddDeviceButton(
                  onSelectDevice: _onSelectDevice,
                  device: _firstDevice,
                ),
              ),
              Expanded(
                child: CompareAddDeviceButton(
                  onSelectDevice: _onSelectSecondDevice,
                  device: _secondDevice,
                ),
              ),
            ],
          ),
          ComareDevicesBlocBuilder(
            device: _firstDevice,
            secondDevice: _secondDevice,
          ),
        ],
      ),
    );
  }
}
