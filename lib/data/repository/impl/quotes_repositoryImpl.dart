import 'package:task_management/data/model/api_response.dart';
import 'package:task_management/data/remote/api.dart';
import 'package:task_management/data/repository/quotes_repository.dart';

class QuotesRepositoryimpl extends QuotesRepository {
  QuotesRepositoryimpl({required this.api});
  final Api api;
  @override
  Future<ApiResponse> getQuote() {
    return api.getQuote();
  }
}
