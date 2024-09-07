import 'package:task_management/data/model/api_response.dart';

abstract class QuotesRepository {
  Future<ApiResponse> getQuote();
}
