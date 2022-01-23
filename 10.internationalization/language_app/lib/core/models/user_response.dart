class UserResponse {
  List<LabelsArr> labelsArr;
  final String error;

  UserResponse(this.labelsArr, this.error);

  UserResponse.fromJson(Map<String, dynamic> json)
      : labelsArr = (json["labelsArr"] as List)
            .map((i) => LabelsArr.fromJson(i))
            .toList(),
        error = "";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.labelsArr != null) {
      data['labelsArr'] = this.labelsArr.map((v) => v.toJson()).toList();
    }
    return data;
  }

  UserResponse.withError(String errorValue)
      : labelsArr = List(),
        error = errorValue;
}

class LabelsArr {
  Labels labels;

  LabelsArr({this.labels});

  LabelsArr.fromJson(Map<String, dynamic> json) {
    labels =
        json['labels'] != null ? new Labels.fromJson(json['labels']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.labels != null) {
      data['labels'] = this.labels.toJson();
    }
    return data;
  }
}

class Labels {
  String nameEn;
  String nameAr;

  Labels({this.nameEn, this.nameAr});

  Labels.fromJson(Map<String, dynamic> json) {
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    return data;
  }
}
