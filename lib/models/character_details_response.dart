class CharacterDetailsResponse {
  Character? character;

  CharacterDetailsResponse({this.character});

  CharacterDetailsResponse.fromJson(Map<String, dynamic> json) {
    if (json["character"] is Map) {
      character = json["character"] == null
          ? null
          : Character.fromJson(json["character"]);
    }
  }

  static List<CharacterDetailsResponse> fromList(
      List<Map<String, dynamic>> list) {
    return list.map(CharacterDetailsResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (character != null) {
      _data["character"] = character?.toJson();
    }
    return _data;
  }
}

class Character {
  String? created;
  String? name;
  String? gender;
  String? image;
  String? species;
  String? status;
  String? type;
  List<Episode>? episode;
  Location? location;
  Origin? origin;

  Character(
      {this.created,
      this.name,
      this.gender,
      this.image,
      this.species,
      this.status,
      this.type,
      this.episode,
      this.location,
      this.origin});

  Character.fromJson(Map<String, dynamic> json) {
    if (json["created"] is String) {
      created = json["created"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["gender"] is String) {
      gender = json["gender"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["species"] is String) {
      species = json["species"];
    }
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["episode"] is List) {
      episode = json["episode"] == null
          ? null
          : (json["episode"] as List).map((e) => Episode.fromJson(e)).toList();
    }
    if (json["location"] is Map) {
      location =
          json["location"] == null ? null : Location.fromJson(json["location"]);
    }
    if (json["origin"] is Map) {
      origin = json["origin"] == null ? null : Origin.fromJson(json["origin"]);
    }
  }

  static List<Character> fromList(List<Map<String, dynamic>> list) {
    return list.map(Character.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["created"] = created;
    _data["name"] = name;
    _data["gender"] = gender;
    _data["image"] = image;
    _data["species"] = species;
    _data["status"] = status;
    _data["type"] = type;
    if (episode != null) {
      _data["episode"] = episode?.map((e) => e.toJson()).toList();
    }
    if (location != null) {
      _data["location"] = location?.toJson();
    }
    if (origin != null) {
      _data["origin"] = origin?.toJson();
    }
    return _data;
  }
}

class Origin {
  String? name;
  String? dimension;

  Origin({this.name, this.dimension});

  Origin.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["dimension"] is String) {
      dimension = json["dimension"];
    }
  }

  static List<Origin> fromList(List<Map<String, dynamic>> list) {
    return list.map(Origin.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["dimension"] = dimension;
    return _data;
  }
}

class Location {
  String? type;
  String? name;

  Location({this.type, this.name});

  Location.fromJson(Map<String, dynamic> json) {
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
  }

  static List<Location> fromList(List<Map<String, dynamic>> list) {
    return list.map(Location.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["type"] = type;
    _data["name"] = name;
    return _data;
  }
}

class Episode {
  String? name;
  String? airDate;
  String? episode;

  Episode({this.name, this.airDate, this.episode});

  Episode.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["air_date"] is String) {
      airDate = json["air_date"];
    }
    if (json["episode"] is String) {
      episode = json["episode"];
    }
  }

  static List<Episode> fromList(List<Map<String, dynamic>> list) {
    return list.map(Episode.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["air_date"] = airDate;
    _data["episode"] = episode;
    return _data;
  }
}
