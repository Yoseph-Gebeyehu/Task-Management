import 'package:task_management/domain/constant/api.dart';

import '../model/api_response.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<ApiResponse> getQuote() async {
    String baseUrl = ApiUrl.apiPath;
    var url = Uri.parse(baseUrl);
    var response = await http.get(url);
    return ApiResponse.fromResponse(response);
  }
}
