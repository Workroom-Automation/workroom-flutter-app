import 'package:workroom_flutter_app/common/constants/constants.dart';
import 'package:workroom_flutter_app/common/services/api_service/dio_api_service.dart';
import 'package:workroom_flutter_app/common/services/logger_service/logger_service.dart';
import 'package:workroom_flutter_app/features/quality_app/dto/response.dart';
import 'package:workroom_flutter_app/features/quality_app/model/inspection.dart';
import 'package:workroom_flutter_app/features/quality_app/model/inspection_sample.dart';

final headers = {
  'CtxNamespaceKey': 'x-namespace',
  'x-namespace': 'workroom',
};

Future<List<Inspection>> getMyInspectionList({
  String? supplierId,
  bool? includeIncomingParts,
}) async {
  final dio = DioApiService(inspectionBaseUrl);
  final queryParams = <String, dynamic>{};
  if (supplierId != null) {
    queryParams['supplierId'] = supplierId;
  }
  if (includeIncomingParts != null) {
    queryParams['includeIncomingPart'] = includeIncomingParts;
  }
  var myInspections = <Inspection>[];
  try {
    final resp = await dio.get(
      '/incoming-quality-inspections/my',
      queryParams,
      headers,
    );

    if (resp.statusCode == 200) {
      final res = GetInspectionListResponse.fromJson(resp.data!);
      myInspections = res.data;
    }
  } catch (e) {
    AppLogger.printLog(e);
  }
  return myInspections;
}

Future<Inspection?> getInspection(
  String inspectionId, {
  bool includeSamples = false,
}) async {
  if (inspectionId.isEmpty) {
    return null;
  }
  final dio = DioApiService(inspectionBaseUrl);
  final queryParams = <String, dynamic>{};
  if (includeSamples) {
    queryParams['includeSamples'] = 'true';
  }
  try {
    final resp = await dio.get(
      '/incoming-quality-inspections/{$inspectionId}',
      queryParams,
      headers,
    );

    if (resp.statusCode == 200) {
      final res = GetInspectionResponse.fromJson(resp.data!);
      return res.data;
    }
  } catch (e) {
    AppLogger.printLog(e);
  }
  return null;
}

Future<bool> startInspection(String inspectionId) async {
  final dio = DioApiService(inspectionBaseUrl);
  final queryParams = <String, dynamic>{};
  final postData = <String, dynamic>{};
  if (inspectionId.isEmpty) {
    return false;
  }
  var isStarted = true;
  try {
    final resp = await dio.post(
      '/incoming-quality-inspections/{$inspectionId}/start',
      postData,
      queryParams,
      headers,
    );

    if (resp.statusCode == 200) {
      final res =
          StartInspectionResponse.fromJson(resp.data as Map<String, dynamic>);
    }
  } catch (e) {
    isStarted = false;
    AppLogger.printLog(e);
  }
  return isStarted;
}

Future<InspectionSample?> createInspectionSample({
  required String inspectionId,
  required String title,
}) async {
  final dio = DioApiService(inspectionBaseUrl);
  final queryParams = <String, dynamic>{};
  final postData = <String, dynamic>{
    'title': title,
  };
  try {
    final resp = await dio.post(
      '/incoming-quality-inspections/{$inspectionId}/sample',
      postData,
      queryParams,
      headers,
    );

    if (resp.statusCode == 200) {
      final res = CreateInspectionSampleResponse.fromJson(
        resp.data as Map<String, dynamic>,
      );
      return res.data;
    }
  } catch (e) {
    AppLogger.printLog(e);
  }
  return null;
}

Future<InspectionSample?> getInspectionSample({
  required String inspectionId,
  required String sampleId,
}) async {
  final dio = DioApiService(inspectionBaseUrl);
  final queryParams = <String, dynamic>{};
  try {
    final resp = await dio.get(
      '/incoming-quality-inspections/{$inspectionId}/sample/{$sampleId}',
      queryParams,
      headers,
    );

    if (resp.statusCode == 200) {
      final res = GetInspectionSampleResponse.fromJson(
        resp.data!,
      );
      return res.data;
    }
  } catch (e) {
    AppLogger.printLog(e);
  }
  return null;
}

Future<bool> updateInspectionSample({
  required String inspectionId,
  required String sampleId,
  String? title,
  String? status,
}) async {
  final dio = DioApiService(inspectionBaseUrl);
  final queryParams = <String, dynamic>{};
  final postData = <String, dynamic>{};
  if (title != null) {
    postData['title'] = title;
  }
  if (status != null) {
    postData['status'] = status;
  }
  try {
    final resp = await dio.patch(
      '/incoming-quality-inspections/{$inspectionId}/sample',
      postData,
      queryParams,
      headers,
    );

    if (resp.statusCode == 200) {
      final res = UpdateInspectionSampleResponse.fromJson(
        resp.data as Map<String, dynamic>,
      );
      return true;
    }
  } catch (e) {
    AppLogger.printLog(e);
  }
  return false;
}

Future<bool> deleteInspectionSample({
  required String inspectionId,
  required String sampleId,
}) async {
  final dio = DioApiService(inspectionBaseUrl);
  final queryParams = <String, dynamic>{};
  try {
    final resp = await dio.delete(
      '/incoming-quality-inspections/{$inspectionId}/sample/{$sampleId}',
      queryParams,
      headers,
    );

    if (resp.statusCode == 200) {
      final res = DeleteInspectionSampleResponse.fromJson(
        resp.data as Map<String, dynamic>,
      );
      return true;
    }
  } catch (e) {
    AppLogger.printLog(e);
  }
  return false;
}
