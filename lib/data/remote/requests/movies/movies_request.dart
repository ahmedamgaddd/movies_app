import 'package:dio/dio.dart';

import '../../../../constants/constants_methods.dart';
import '../../../../constants/end_points.dart';
import '../../data_providers/my_dio.dart';
import '../../responses/movies/movies_response.dart';

class MoviesRequest {
  Future moviesRequest({
    required String apiKey,
  }) async {
    try {
      Response response = await MyDio.getData(
        endPoint: popularMovies,
        query: {
          'api_key': apiKey,
        },
      );
      printTest('moviesRequestStatusCode ${response.statusCode}');
      printResponse(response.data.toString());
      return MoviesResponse.fromJson(response.data);
    } catch (error) {
      printError('moviesRequest $error');
    }
  }
}
