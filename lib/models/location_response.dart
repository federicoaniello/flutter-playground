class LocationResponse {
  bool? succeeded;
  String? message;
  List<Result>? result;

  LocationResponse({this.succeeded, this.message, this.result});

  LocationResponse.fromJson(Map<String, dynamic> json) {
    succeeded = json['succeeded'];
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['succeeded'] = succeeded;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int? geoNameId;
  String? name;
  double? longitude;
  double? latitude;
  String? alias;
  String? regionName;
  String? provinceCode;
  int? population;
  int? featureCode;
  bool? isPreferredName;
  bool? isProvinceCapeTown;

  Result(
      {this.geoNameId,
      this.name,
      this.longitude,
      this.latitude,
      this.alias,
      this.regionName,
      this.provinceCode,
      this.population,
      this.featureCode,
      this.isPreferredName,
      this.isProvinceCapeTown});

  Result.fromJson(Map<String, dynamic> json) {
    geoNameId = json['geoNameId'];
    name = json['name'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    alias = json['alias'];
    regionName = json['regionName'];
    provinceCode = json['provinceCode'];
    population = json['population'];
    featureCode = json['featureCode'];
    isPreferredName = json['isPreferredName'];
    isProvinceCapeTown = json['isProvinceCapeTown'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['geoNameId'] = geoNameId;
    data['name'] = name;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['alias'] = alias;
    data['regionName'] = regionName;
    data['provinceCode'] = provinceCode;
    data['population'] = population;
    data['featureCode'] = featureCode;
    data['isPreferredName'] = isPreferredName;
    data['isProvinceCapeTown'] = isProvinceCapeTown;
    return data;
  }
}