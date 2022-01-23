class DioCustomizeError {
  late String message;

  DioCustomizeError({
    message,
  });

  DioCustomizeError.fromJson(Map<String, dynamic> json) {
    message = json['message'] ?? "Please try again later!";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message.isEmpty;
    return data;
  }
}
