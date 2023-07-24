import 'package:dio/dio.dart';

import '../../../../constants/constants_methods.dart';
import '../../../../constants/end_points.dart';
import '../../data_providers/my_dio.dart';
import '../../responses/tv_shows/tv_shows_response.dart';

class TVShowsRequest {
  Future tvShowsRequest({
    required String apiKey,
  }) async {
    try {
      Response response = await MyDio.getData(
        endPoint: popularTVShows,
        query: {
          'api_key': apiKey,
        },
      );
      printTest('tvShowsRequestStatusCode ${response.statusCode}');
      printResponse(response.data.toString());
      return TvShowsResponse.fromJson(response.data);
    } catch (error) {
      printError('tvShowsRequest $error');
    }
  }
}
