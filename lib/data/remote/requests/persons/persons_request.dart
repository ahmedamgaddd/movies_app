import 'package:dio/dio.dart';

import '../../../../constants/constants_methods.dart';
import '../../../../constants/end_points.dart';
import '../../data_providers/my_dio.dart';
import '../../responses/persons/persons_response.dart';

class PersonsRequest {
  Future personsRequest({
    required String apiKey,
  }) async {
    try {
      Response response = await MyDio.getData(
        endPoint: popularPersons,
        query: {
          'api_key': apiKey,
        },
      );
      printTest('personsRequestStatusCode ${response.statusCode}');
      printResponse(response.data.toString());
      return PersonsResponse.fromJson(response.data);
    } catch (error) {
      printError('personsRequest $error');
    }
  }
}
