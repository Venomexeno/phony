import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/functions/functions.dart';
import '../../../../core/models/device.dart';
import '../data_source/search_remote_data_source.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<Device>>> searchDevices(String query);
}

class SearchRepoImpl implements SearchRepo {
  final SearchRemoteDataSource _searchRemoteDataSource;

  SearchRepoImpl(this._searchRemoteDataSource);

  @override
  Future<Either<Failure, List<Device>>> searchDevices(String query) async {
    return await tryAndCatchBlock(
      functionToExecute: () async => await _searchRemoteDataSource.searchDevices(query),
    );
  }
}