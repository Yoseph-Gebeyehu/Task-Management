import 'dart:convert';

class ApiResponse {
  int? status;
  dynamic body;

  ApiResponse({
    required this.status,
    this.body,
  });

  factory ApiResponse.fromResponse(dynamic response) {
    int code = response.statusCode;
    dynamic body;
    

    try {
      body = jsonDecode(response.body);
    } catch (e) {
      body = null;
    }

    return ApiResponse(
      status: code,
      body: body,
    );
  }
}
