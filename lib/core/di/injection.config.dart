// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas, cascade_invocations
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'package:workroom_flutter_app/common/services/connection_service/connection_service.dart'
    as _i4;
import 'package:workroom_flutter_app/common/services/hive_service/hive_service.dart'
    as _i3;
import 'package:workroom_flutter_app/common/services/navigation_service/navigation_service.dart'
    as _i5;
import 'package:workroom_flutter_app/features/part_status_managment/bloc/state.dart'
    as _i6;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AuthHive>(() => _i3.AuthHive());
    gh.lazySingleton<_i4.ConnectionService>(
      () => _i4.ConnectionService()..initialize(),
      dispose: (i) => i.dispose(),
    );
    gh.singleton<_i5.NavigationService>(_i5.NavigationService());
    gh.lazySingleton<_i6.RxStateClass>(() => _i6.RxStateClass());
    return this;
  }
}
