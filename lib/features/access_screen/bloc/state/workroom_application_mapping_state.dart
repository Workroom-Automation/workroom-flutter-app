import 'package:rxdart/subjects.dart';
import 'package:workroom_flutter_app/common/services/api_service/dio_api_service.dart';
import 'package:workroom_flutter_app/common/services/logger_service/logger_service.dart';
import 'package:workroom_flutter_app/features/access_screen/bloc/models/workroom_mappings.dart';

class WorkRoomAppLicationMappingState {
  final _workRoomAppLicationMap = <String, List<Application>>{};

  Map<String, List<Application>> get workRoomAppLicationMap =>
      _workRoomAppLicationMap;

  Future<void> fetchDataFromApi() async {
    try {
      final dio = DioApiService('https://35.154.249.16:8005');
      // final response.dart = await dio.get('/api/v1/applications', {
      //   'includeWorkroom': 'true',
      //   'name': '',
      // }, {
      //   'Authorization':
      //       'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik1EUHJXMWF2eVNDTEs1dFEtNllzSSJ9.eyJpc3MiOiJodHRwczovL2Rldi14NG5vb2g2ZmRkZWtoNmRkLnVzLmF1dGgwLmNvbS8iLCJzdWIiOiJhQlhGWUt5VVVCdXdSbVBMaUR0eTZ6Q0ZBQmF1UFVnckBjbGllbnRzIiwiYXVkIjoiaHR0cHM6Ly9kZXYteDRub29oNmZkZGVraDZkZC51cy5hdXRoMC5jb20vYXBpL3YyLyIsImlhdCI6MTY5MDAyMTY3MSwiZXhwIjoxNjkyNjEzNjcxLCJhenAiOiJhQlhGWUt5VVVCdXdSbVBMaUR0eTZ6Q0ZBQmF1UFVnciIsInNjb3BlIjoicmVhZDpjbGllbnRfZ3JhbnRzIGNyZWF0ZTpjbGllbnRfZ3JhbnRzIGRlbGV0ZTpjbGllbnRfZ3JhbnRzIHVwZGF0ZTpjbGllbnRfZ3JhbnRzIHJlYWQ6dXNlcnMgdXBkYXRlOnVzZXJzIGRlbGV0ZTp1c2VycyBjcmVhdGU6dXNlcnMgcmVhZDp1c2Vyc19hcHBfbWV0YWRhdGEgdXBkYXRlOnVzZXJzX2FwcF9tZXRhZGF0YSBkZWxldGU6dXNlcnNfYXBwX21ldGFkYXRhIGNyZWF0ZTp1c2Vyc19hcHBfbWV0YWRhdGEgcmVhZDp1c2VyX2N1c3RvbV9ibG9ja3MgY3JlYXRlOnVzZXJfY3VzdG9tX2Jsb2NrcyBkZWxldGU6dXNlcl9jdXN0b21fYmxvY2tzIGNyZWF0ZTp1c2VyX3RpY2tldHMgcmVhZDpjbGllbnRzIHVwZGF0ZTpjbGllbnRzIGRlbGV0ZTpjbGllbnRzIGNyZWF0ZTpjbGllbnRzIHJlYWQ6Y2xpZW50X2tleXMgdXBkYXRlOmNsaWVudF9rZXlzIGRlbGV0ZTpjbGllbnRfa2V5cyBjcmVhdGU6Y2xpZW50X2tleXMgcmVhZDpjb25uZWN0aW9ucyB1cGRhdGU6Y29ubmVjdGlvbnMgZGVsZXRlOmNvbm5lY3Rpb25zIGNyZWF0ZTpjb25uZWN0aW9ucyByZWFkOnJlc291cmNlX3NlcnZlcnMgdXBkYXRlOnJlc291cmNlX3NlcnZlcnMgZGVsZXRlOnJlc291cmNlX3NlcnZlcnMgY3JlYXRlOnJlc291cmNlX3NlcnZlcnMgcmVhZDpkZXZpY2VfY3JlZGVudGlhbHMgdXBkYXRlOmRldmljZV9jcmVkZW50aWFscyBkZWxldGU6ZGV2aWNlX2NyZWRlbnRpYWxzIGNyZWF0ZTpkZXZpY2VfY3JlZGVudGlhbHMgcmVhZDpydWxlcyB1cGRhdGU6cnVsZXMgZGVsZXRlOnJ1bGVzIGNyZWF0ZTpydWxlcyByZWFkOnJ1bGVzX2NvbmZpZ3MgdXBkYXRlOnJ1bGVzX2NvbmZpZ3MgZGVsZXRlOnJ1bGVzX2NvbmZpZ3MgcmVhZDpob29rcyB1cGRhdGU6aG9va3MgZGVsZXRlOmhvb2tzIGNyZWF0ZTpob29rcyByZWFkOmFjdGlvbnMgdXBkYXRlOmFjdGlvbnMgZGVsZXRlOmFjdGlvbnMgY3JlYXRlOmFjdGlvbnMgcmVhZDplbWFpbF9wcm92aWRlciB1cGRhdGU6ZW1haWxfcHJvdmlkZXIgZGVsZXRlOmVtYWlsX3Byb3ZpZGVyIGNyZWF0ZTplbWFpbF9wcm92aWRlciBibGFja2xpc3Q6dG9rZW5zIHJlYWQ6c3RhdHMgcmVhZDppbnNpZ2h0cyByZWFkOnRlbmFudF9zZXR0aW5ncyB1cGRhdGU6dGVuYW50X3NldHRpbmdzIHJlYWQ6bG9ncyByZWFkOmxvZ3NfdXNlcnMgcmVhZDpzaGllbGRzIGNyZWF0ZTpzaGllbGRzIHVwZGF0ZTpzaGllbGRzIGRlbGV0ZTpzaGllbGRzIHJlYWQ6YW5vbWFseV9ibG9ja3MgZGVsZXRlOmFub21hbHlfYmxvY2tzIHVwZGF0ZTp0cmlnZ2VycyByZWFkOnRyaWdnZXJzIHJlYWQ6Z3JhbnRzIGRlbGV0ZTpncmFudHMgcmVhZDpndWFyZGlhbl9mYWN0b3JzIHVwZGF0ZTpndWFyZGlhbl9mYWN0b3JzIHJlYWQ6Z3VhcmRpYW5fZW5yb2xsbWVudHMgZGVsZXRlOmd1YXJkaWFuX2Vucm9sbG1lbnRzIGNyZWF0ZTpndWFyZGlhbl9lbnJvbGxtZW50X3RpY2tldHMgcmVhZDp1c2VyX2lkcF90b2tlbnMgY3JlYXRlOnBhc3N3b3Jkc19jaGVja2luZ19qb2IgZGVsZXRlOnBhc3N3b3Jkc19jaGVja2luZ19qb2IgcmVhZDpjdXN0b21fZG9tYWlucyBkZWxldGU6Y3VzdG9tX2RvbWFpbnMgY3JlYXRlOmN1c3RvbV9kb21haW5zIHVwZGF0ZTpjdXN0b21fZG9tYWlucyByZWFkOmVtYWlsX3RlbXBsYXRlcyBjcmVhdGU6ZW1haWxfdGVtcGxhdGVzIHVwZGF0ZTplbWFpbF90ZW1wbGF0ZXMgcmVhZDptZmFfcG9saWNpZXMgdXBkYXRlOm1mYV9wb2xpY2llcyByZWFkOnJvbGVzIGNyZWF0ZTpyb2xlcyBkZWxldGU6cm9sZXMgdXBkYXRlOnJvbGVzIHJlYWQ6cHJvbXB0cyB1cGRhdGU6cHJvbXB0cyByZWFkOmJyYW5kaW5nIHVwZGF0ZTpicmFuZGluZyBkZWxldGU6YnJhbmRpbmcgcmVhZDpsb2dfc3RyZWFtcyBjcmVhdGU6bG9nX3N0cmVhbXMgZGVsZXRlOmxvZ19zdHJlYW1zIHVwZGF0ZTpsb2dfc3RyZWFtcyBjcmVhdGU6c2lnbmluZ19rZXlzIHJlYWQ6c2lnbmluZ19rZXlzIHVwZGF0ZTpzaWduaW5nX2tleXMgcmVhZDpsaW1pdHMgdXBkYXRlOmxpbWl0cyBjcmVhdGU6cm9sZV9tZW1iZXJzIHJlYWQ6cm9sZV9tZW1iZXJzIGRlbGV0ZTpyb2xlX21lbWJlcnMgcmVhZDplbnRpdGxlbWVudHMgcmVhZDphdHRhY2tfcHJvdGVjdGlvbiB1cGRhdGU6YXR0YWNrX3Byb3RlY3Rpb24gcmVhZDpvcmdhbml6YXRpb25zIHVwZGF0ZTpvcmdhbml6YXRpb25zIGNyZWF0ZTpvcmdhbml6YXRpb25zIGRlbGV0ZTpvcmdhbml6YXRpb25zIGNyZWF0ZTpvcmdhbml6YXRpb25fbWVtYmVycyByZWFkOm9yZ2FuaXphdGlvbl9tZW1iZXJzIGRlbGV0ZTpvcmdhbml6YXRpb25fbWVtYmVycyBjcmVhdGU6b3JnYW5pemF0aW9uX2Nvbm5lY3Rpb25zIHJlYWQ6b3JnYW5pemF0aW9uX2Nvbm5lY3Rpb25zIHVwZGF0ZTpvcmdhbml6YXRpb25fY29ubmVjdGlvbnMgZGVsZXRlOm9yZ2FuaXphdGlvbl9jb25uZWN0aW9ucyBjcmVhdGU6b3JnYW5pemF0aW9uX21lbWJlcl9yb2xlcyByZWFkOm9yZ2FuaXphdGlvbl9tZW1iZXJfcm9sZXMgZGVsZXRlOm9yZ2FuaXphdGlvbl9tZW1iZXJfcm9sZXMgY3JlYXRlOm9yZ2FuaXphdGlvbl9pbnZpdGF0aW9ucyByZWFkOm9yZ2FuaXphdGlvbl9pbnZpdGF0aW9ucyBkZWxldGU6b3JnYW5pemF0aW9uX2ludml0YXRpb25zIHJlYWQ6b3JnYW5pemF0aW9uc19zdW1tYXJ5IGNyZWF0ZTphY3Rpb25zX2xvZ19zZXNzaW9ucyBjcmVhdGU6YXV0aGVudGljYXRpb25fbWV0aG9kcyByZWFkOmF1dGhlbnRpY2F0aW9uX21ldGhvZHMgdXBkYXRlOmF1dGhlbnRpY2F0aW9uX21ldGhvZHMgZGVsZXRlOmF1dGhlbnRpY2F0aW9uX21ldGhvZHMgcmVhZDpjbGllbnRfY3JlZGVudGlhbHMgY3JlYXRlOmNsaWVudF9jcmVkZW50aWFscyB1cGRhdGU6Y2xpZW50X2NyZWRlbnRpYWxzIGRlbGV0ZTpjbGllbnRfY3JlZGVudGlhbHMiLCJndHkiOiJjbGllbnQtY3JlZGVudGlhbHMifQ.s1qcp73MrWe5c1Gi2WB0mCWEBLfl5LV1Cw0DLa8R5yPuZrc5moW5HDyVg1di_yCZTMz7mlBarcQaEcuXwa--uR6ABCic63uKtzIqXPJDVhfiIOY3RXgBpnuMdFozEdkMqr32j5oGaLsQMycQJJLxKxQPpWVcRBx5n-WKnW7zMcz2IuYUYO7-OxUfM8iwdpNZ9C_Y7XTsieWzdi4ZpkyAVoPGnS3TFRAnVzuZZ031ELW_KU1NXFjG8qXV-VQqRgS0tKt3hW-6GR5lcUZAWSrEva3BpH_FbUJT8B8aSkZ2tLxYsnLthwLAQOGJigItJci52BDoFlmio2WMecPZ0P6Ssg',
      //   'CtxNamespaceKey': 'x-namespace',
      //   'x-namespace': 'workroom',
      // });
      final response = {
        'status': {
          'code': 200,
          'message': 'applications fetched successfully',
          'type': 'success',
          'totalCount': 3
        },
        'data': [
          {
            'created_at': '2023-07-21T12:01:30.6402Z',
            'updated_at': '2023-07-21T12:01:30.6402Z',
            'created_by': 'auth0|63d10e2eb495640a8f2c7299',
            'updated_by': '',
            'deleted_by': '',
            'id': '61997861-60f7-4885-8aff-2803244095c4a',
            'name': 'Test App1',
            'workroomId': '59af934e-3eac-4dbc-9399-8e7a8eedd4fd',
            'workroom': {
              'created_at': '2023-07-21T11:53:34.579686Z',
              'updated_at': '2023-07-21T11:53:34.579686Z',
              'created_by': 'auth0|63d10e2eb495640a8f2c7299',
              'updated_by': '',
              'deleted_by': '',
              'id': '59af934e-3eac-4dbc-9399-8e7a8eedd4fd',
              'name': 'Test Workroom'
            }
          },
          {
            'created_at': '2023-07-21T12:01:30.6402Z',
            'updated_at': '2023-07-21T12:01:30.6402Z',
            'created_by': 'auth0|63d10e2eb495640a8f2c7299',
            'updated_by': '',
            'deleted_by': '',
            'id': '61997861-60f7-4885-8aff-2803244095c411',
            'name': 'Test App',
            'workroomId': '59af934e-3eac-4dbc-9399-8e7a8eedd4fd',
            'workroom': {
              'created_at': '2023-07-21T11:53:34.579686Z',
              'updated_at': '2023-07-21T11:53:34.579686Z',
              'created_by': 'auth0|63d10e2eb495640a8f2c7299',
              'updated_by': '',
              'deleted_by': '',
              'id': '59af934e-3eac-4dbc-9399-8e7a8eedd4fd',
              'name': 'Test Workroom'
            }
          },
          {
            'created_at': '2023-07-21T12:01:30.6402Z',
            'updated_at': '2023-07-21T12:01:30.6402Z',
            'created_by': 'auth0|63d10e2eb495640a8f2c7299',
            'updated_by': '',
            'deleted_by': '',
            'id': '61997861-60f7-4885-8aff-2803244095c411',
            'name': 'Test App',
            'workroomId': '59af934e-3eac-4dbc-9399-8e7a8eedd4fd',
            'workroom': {
              'created_at': '2023-07-21T11:53:34.579686Z',
              'updated_at': '2023-07-21T11:53:34.579686Z',
              'created_by': 'auth0|63d10e2eb495640a8f2c7299',
              'updated_by': '',
              'deleted_by': '',
              'id': '59af934e-3eac-4dbc-9399-8e7a8eedd4fd',
              'name': 'Test Workroom'
            }
          },
          {
            'created_at': '2023-07-21T12:01:30.6402Z',
            'updated_at': '2023-07-21T12:01:30.6402Z',
            'created_by': 'auth0|63d10e2eb495640a8f2c7299',
            'updated_by': '',
            'deleted_by': '',
            'id': '61997861-60f7-4885-8aff-2803244095c411',
            'name': 'Test App',
            'workroomId': '59af934e-3eac-4dbc-9399-8e7a8eedd4fd',
            'workroom': {
              'created_at': '2023-07-21T11:53:34.579686Z',
              'updated_at': '2023-07-21T11:53:34.579686Z',
              'created_by': 'auth0|63d10e2eb495640a8f2c7299',
              'updated_by': '',
              'deleted_by': '',
              'id': '59af934e-3eac-4dbc-9399-8e7a8eedd4fd',
              'name': 'Test Workroom'
            }
          },
          {
            'created_at': '2023-07-21T12:01:30.6402Z',
            'updated_at': '2023-07-21T12:01:30.6402Z',
            'created_by': 'auth0|63d10e2eb495640a8f2c7299',
            'updated_by': '',
            'deleted_by': '',
            'id': '61997861-60f7-4885-8aff-2803244095c411',
            'name': 'Test App',
            'workroomId': '59af934e-3eac-4dbc-9399-8e7a8eedd4fd',
            'workroom': {
              'created_at': '2023-07-21T11:53:34.579686Z',
              'updated_at': '2023-07-21T11:53:34.579686Z',
              'created_by': 'auth0|63d10e2eb495640a8f2c7299',
              'updated_by': '',
              'deleted_by': '',
              'id': '59af934e-3eac-4dbc-9399-8e7a8eedd4fd',
              'name': 'Test Workroom'
            }
          },
          {
            'created_at': '2023-07-21T12:01:30.6402Z',
            'updated_at': '2023-07-21T12:01:30.6402Z',
            'created_by': 'auth0|63d10e2eb495640a8f2c7299',
            'updated_by': '',
            'deleted_by': '',
            'id': '61997861-60f7-4885-8aff-2803244095c411',
            'name': 'Test App',
            'workroomId': '59af934e-3eac-4dbc-9399-8e7a8eedd4fd',
            'workroom': {
              'created_at': '2023-07-21T11:53:34.579686Z',
              'updated_at': '2023-07-21T11:53:34.579686Z',
              'created_by': 'auth0|63d10e2eb495640a8f2c7299',
              'updated_by': '',
              'deleted_by': '',
              'id': '59af934e-3eac-4dbc-9399-8e7a8eedd4fd',
              'name': 'Test Workroom'
            }
          },
          {
            'created_at': '2023-07-21T12:01:30.6402Z',
            'updated_at': '2023-07-21T12:01:30.6402Z',
            'created_by': 'auth0|63d10e2eb495640a8f2c7299',
            'updated_by': '',
            'deleted_by': '',
            'id': '61997861-60f7-4885-8aff-2803244095c411',
            'name': 'Test App',
            'workroomId': '59af934e-3eac-4dbc-9399-8e7a8eedd4fd',
            'workroom': {
              'created_at': '2023-07-21T11:53:34.579686Z',
              'updated_at': '2023-07-21T11:53:34.579686Z',
              'created_by': 'auth0|63d10e2eb495640a8f2c7299',
              'updated_by': '',
              'deleted_by': '',
              'id': '59af934e-3eac-4dbc-9399-8e7a8eedd4fd',
              'name': 'Test Workroom'
            }
          },
          {
            'created_at': '2023-07-21T12:01:30.6402Z',
            'updated_at': '2023-07-21T12:01:30.6402Z',
            'created_by': 'auth0|63d10e2eb495640a8f2c7299',
            'updated_by': '',
            'deleted_by': '',
            'id': '61997861-60f7-4885-8aff-2803244095c411',
            'name': 'Test App',
            'workroomId': '59af934e-3eac-4dbc-9399-8e7a8eedd4fd',
            'workroom': {
              'created_at': '2023-07-21T11:53:34.579686Z',
              'updated_at': '2023-07-21T11:53:34.579686Z',
              'created_by': 'auth0|63d10e2eb495640a8f2c7299',
              'updated_by': '',
              'deleted_by': '',
              'id': '59af934e-3eac-4dbc-9399-8e7a8eedd4fd',
              'name': 'Test Workroom'
            }
          },
          {
            'created_at': '2023-07-21T12:01:30.6402Z',
            'updated_at': '2023-07-21T12:01:30.6402Z',
            'created_by': 'auth0|63d10e2eb495640a8f2c7299',
            'updated_by': '',
            'deleted_by': '',
            'id': '61997861-60f7-4885-8aff-2803244095c411',
            'name': 'Test App',
            'workroomId': '59af934e-3eac-4dbc-9399-8e7a8eedd4fd',
            'workroom': {
              'created_at': '2023-07-21T11:53:34.579686Z',
              'updated_at': '2023-07-21T11:53:34.579686Z',
              'created_by': 'auth0|63d10e2eb495640a8f2c7299',
              'updated_by': '',
              'deleted_by': '',
              'id': '59af934e-3eac-4dbc-9399-8e7a8eedd4fd',
              'name': 'Test Workroom'
            }
          },
          {
            'created_at': '2023-07-21T12:01:30.6402Z',
            'updated_at': '2023-07-21T12:01:30.6402Z',
            'created_by': 'auth0|63d10e2eb495640a8f2c7299',
            'updated_by': '',
            'deleted_by': '',
            'id': '61997861-60f7-4885-8aff-2803244095c411',
            'name': 'Test App',
            'workroomId': '59af934e-3eac-4dbc-9399-8e7a8eedd4fd',
            'workroom': {
              'created_at': '2023-07-21T11:53:34.579686Z',
              'updated_at': '2023-07-21T11:53:34.579686Z',
              'created_by': 'auth0|63d10e2eb495640a8f2c7299',
              'updated_by': '',
              'deleted_by': '',
              'id': '59af934e-3eac-4dbc-9399-8e7a8eedd4fd',
              'name': 'Test Workroom'
            }
          },
          {
            'created_at': '2023-07-21T12:01:30.6402Z',
            'updated_at': '2023-07-21T12:01:30.6402Z',
            'created_by': 'auth0|63d10e2eb495640a8f2c7299',
            'updated_by': '',
            'deleted_by': '',
            'id': '61997861-60f7-4885-8aff-2803244095c411',
            'name': 'Test App',
            'workroomId': '59af934e-3eac-4dbc-9399-8e7a8eedd4fd',
            'workroom': {
              'created_at': '2023-07-21T11:53:34.579686Z',
              'updated_at': '2023-07-21T11:53:34.579686Z',
              'created_by': 'auth0|63d10e2eb495640a8f2c7299',
              'updated_by': '',
              'deleted_by': '',
              'id': '59af934e-3eac-4dbc-9399-8e7a8eedd4fd',
              'name': 'Test Workroom'
            }
          },
          {
            'created_at': '2023-07-21T12:01:30.6402Z',
            'updated_at': '2023-07-21T12:01:30.6402Z',
            'created_by': 'auth0|63d10e2eb495640a8f2c7299',
            'updated_by': '',
            'deleted_by': '',
            'id': '61997861-60f7-4885-8aff-2803244095c4',
            'name': 'Test App',
            'workroomId': '59af934e-3eac-4dbc-9399-8e7a8eedd4fd',
            'workroom': {
              'created_at': '2023-07-21T11:53:34.579686Z',
              'updated_at': '2023-07-21T11:53:34.579686Z',
              'created_by': 'auth0|63d10e2eb495640a8f2c7299',
              'updated_by': '',
              'deleted_by': '',
              'id': '59af934e-3eac-4dbc-9399-8e7a8eedd4fd',
              'name': 'Test Workroom'
            }
          },
          {
            'created_at': '2023-07-22T11:02:03.695491Z',
            'updated_at': '2023-07-22T11:02:03.695491Z',
            'created_by': 'aBXFYKyUUBuwRmPLiDty6zCFABauPUgr@clients',
            'updated_by': '',
            'deleted_by': '',
            'id': 'eab37dd6-5af3-481b-8b9c-6b7a61d98e26',
            'name': 'Cycle Quality',
            'workroomId': '9fb24049-a419-4123-bd57-4d5507596269',
            'workroom': {
              'created_at': '2023-07-22T11:01:45.544477Z',
              'updated_at': '2023-07-22T11:01:45.544477Z',
              'created_by': 'aBXFYKyUUBuwRmPLiDty6zCFABauPUgr@clients',
              'updated_by': '',
              'deleted_by': '',
              'id': '9fb24049-a419-4123-bd57-4d5507596269',
              'name': 'Quality Workroom'
            }
          },
          {
            'created_at': '2023-07-22T11:02:08.76398Z',
            'updated_at': '2023-07-22T11:02:08.76398Z',
            'created_by': 'aBXFYKyUUBuwRmPLiDty6zCFABauPUgr@clients',
            'updated_by': '',
            'deleted_by': '',
            'id': 'd14d1b98-ead7-4c01-8fd3-6712acb53ae1',
            'name': 'Harvest Quality',
            'workroomId': '9fb24049-a419-4123-bd57-4d5507596269',
            'workroom': {
              'created_at': '2023-07-22T11:01:45.544477Z',
              'updated_at': '2023-07-22T11:01:45.544477Z',
              'created_by': 'aBXFYKyUUBuwRmPLiDty6zCFABauPUgr@clients',
              'updated_by': '',
              'deleted_by': '',
              'id': '9fb24049-a419-4123-bd57-4d5507596269',
              'name': 'Quality Workroom'
            }
          }
        ]
      };
      for (final element in response!['data'] as List<dynamic>) {
        final applications =
            _workRoomAppLicationMap[element['workroomId']] ?? [];
        applications.add(Application.fromJson(element as Map<String, dynamic>));

        _workRoomAppLicationMap[element['workroomId'] as String] = applications;
      }
      AppLogger.printLog(_workRoomAppLicationMap.keys);
    } catch (e) {
      AppLogger.printLog(e);
    }
  }
}
