import 'package:clean_arc_phony/core/services/services_locator.dart';
import 'package:clean_arc_phony/core/utils/app_constance.dart';
import 'package:clean_arc_phony/core/utils/enums.dart';
import 'package:clean_arc_phony/top_by_fans_devices/presentation/controller/top_by_fans_devices_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopByFansDevicesScreen extends StatelessWidget {
  const TopByFansDevicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<TopByFansDevicesBloc>()..add(GetTopByFansDevicesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppConstance.topByFans),
          centerTitle: true,
        ),
        body: BlocBuilder<TopByFansDevicesBloc, TopByFansDevicesState>(
          builder: (context, state) {
            switch (state.topByFansRequestState) {
              case RequestState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case RequestState.loaded:
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2.3 / 3,
                  ),
                  itemCount: state.topByFansDevices.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        /// TODO: Navigate To Spec Screen
                      },
                      child: Container(
                        margin: EdgeInsets.all(5.r),
                        padding: EdgeInsets.all(5.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.grey.shade600,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.network(state
                                  .topByFansDevicesThumbnail[index].thumbnail),
                            ),
                            SizedBox(height: 10.h),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                state.topByFansDevices[index].deviceName,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppConstance.favorites,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    state.topByFansDevices[index].favorites
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              case RequestState.error:
                return Center(
                  child: Text(state.topByFansErrorMessage),
                );
            }
          },
        ),
      ),
    );
  }
}