class HomeResponse {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  HomeResponse({
    this.data,
    this.message,
    this.error,
    this.status,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    return HomeResponse(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      message: json['message'],
      error: json['error'] ?? [],
      status: json['status'],
    );
  }
}

class Data {
  List<SliderModel>? sliders;

  Data({this.sliders});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      sliders: json['sliders'] != null
          ? (json['sliders'] as List)
          .map((e) => SliderModel.fromJson(e))
          .toList()
          : null,
    );
  }
}

class SliderModel {
  String? image;

  SliderModel({this.image});

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      image: json['image'],
    );
  }
}