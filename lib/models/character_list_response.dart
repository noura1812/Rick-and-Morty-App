class CharactersListResponse {
  Characters? characters;

  CharactersListResponse({this.characters});

  CharactersListResponse.fromJson(Map<String, dynamic> json) {
    if (json["characters"] is Map) {
      characters = json["characters"] == null
          ? null
          : Characters.fromJson(json["characters"]);
    }
  }

  static List<CharactersListResponse> fromList(
      List<Map<String, dynamic>> list) {
    return list.map(CharactersListResponse.fromJson).toList();
  }
}

class Characters {
  Info? info;
  List<Results>? results;

  Characters({this.info, this.results});

  Characters.fromJson(Map<String, dynamic> json) {
    if (json["info"] is Map) {
      info = json["info"] == null ? null : Info.fromJson(json["info"]);
    }
    if (json["results"] is List) {
      results = json["results"] == null
          ? null
          : (json["results"] as List).map((e) => Results.fromJson(e)).toList();
    }
  }

  static List<Characters> fromList(List<Map<String, dynamic>> list) {
    return list.map(Characters.fromJson).toList();
  }
}

class Results {
  String? name;
  String? id;
  String? gender;
  String? image;
  String? status;
  String? type;

  Results(
      {this.name,
      this.id,
      this.gender,
      this.image,
      this.status,
      this.type = "Human"});

  Results.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["gender"] is String) {
      gender = json["gender"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["type"] is String) {
      type = json["type"] == "" ? "Human" : json["type"];
    }
  }

  static List<Results> fromList(List<Map<String, dynamic>> list) {
    return list.map(Results.fromJson).toList();
  }
}

class Info {
  int? count;
  int? pages;

  Info({this.count, this.pages});

  Info.fromJson(Map<String, dynamic> json) {
    if (json["count"] is int) {
      count = json["count"];
    }
    if (json["pages"] is int) {
      pages = json["pages"];
    }
  }

  static List<Info> fromList(List<Map<String, dynamic>> list) {
    return list.map(Info.fromJson).toList();
  }
}
