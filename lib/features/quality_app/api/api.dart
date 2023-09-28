import 'package:workroom_flutter_app/common/constants/constants.dart';
import 'package:workroom_flutter_app/common/services/api_service/dio_api_service.dart';

import 'package:workroom_flutter_app/common/services/logger_service/logger_service.dart';

final headers ={
  'CtxNamespaceKey': 'x-namespace',
  'x-namespace': 'workroom',
};

Future<void> getMyInspectionList({String? supplierId,
  bool? includeIncomingParts,}) async {
  final dio = DioApiService(inspectionBaseUrl);
  final queryParams =<String,dynamic>{};
  if(supplierId!=null){
    queryParams['supplierId'] = supplierId;
  }
  if(includeIncomingParts!=null){
    queryParams['includeIncomingPart'] = includeIncomingParts;
  }
  final resp = await dio.get(
    '/incoming-quality-inspections/my',
    queryParams,
    headers,
  );
  AppLogger.printLog(resp);
}