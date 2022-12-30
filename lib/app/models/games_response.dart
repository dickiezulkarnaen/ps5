
class GamesResponse {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;

  GamesResponse({this.count, this.next, this.previous, this.results});

  GamesResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? slug;
  String? name;
  String? released;
  bool? tba;
  String? backgroundImage;
  double? rating;
  int? ratingTop;
  List<Ratings>? ratings;
  int? ratingsCount;
  int? added;
  int? metacritic;
  int? playtime;
  int? suggestionsCount;
  String? updated;
  EsrbRating? esrbRating;
  List<Platforms>? platforms;

  Results(
      {this.id,
        this.slug,
        this.name,
        this.released,
        this.tba,
        this.backgroundImage,
        this.rating,
        this.ratingTop,
        this.ratings,
        this.ratingsCount,
        this.added,
        this.metacritic,
        this.playtime,
        this.suggestionsCount,
        this.updated,
        this.esrbRating,
        this.platforms});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    released = json['released'];
    tba = json['tba'];
    backgroundImage = json['background_image'];
    rating = json['rating'];
    ratingTop = json['rating_top'];
    if (json['ratings'] != null) {
      ratings = <Ratings>[];
      json['ratings'].forEach((v) {
        ratings!.add(Ratings.fromJson(v));
      });
    }
    ratingsCount = json['ratings_count'];
    added = json['added'];
    metacritic = json['metacritic'];
    playtime = json['playtime'];
    suggestionsCount = json['suggestions_count'];
    updated = json['updated'];
    esrbRating = json['esrb_rating'] != null
        ? EsrbRating.fromJson(json['esrb_rating'])
        : null;
    if (json['platforms'] != null) {
      platforms = <Platforms>[];
      json['platforms'].forEach((v) {
        platforms!.add(Platforms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['name'] = name;
    data['released'] = released;
    data['tba'] = tba;
    data['background_image'] = backgroundImage;
    data['rating'] = rating;
    data['rating_top'] = ratingTop;
    if (ratings != null) {
      data['ratings'] = ratings!.map((v) => v.toJson()).toList();
    }
    data['ratings_count'] = ratingsCount;
    data['added'] = added;
    data['metacritic'] = metacritic;
    data['playtime'] = playtime;
    data['suggestions_count'] = suggestionsCount;
    data['updated'] = updated;
    if (esrbRating != null) {
      data['esrb_rating'] = esrbRating!.toJson();
    }
    if (platforms != null) {
      data['platforms'] = platforms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ratings {
  int? id;
  String? title;
  int? count;
  double? percent;

  Ratings({this.id, this.title, this.count, this.percent});

  Ratings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    count = json['count'];
    percent = json['percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['count'] = count;
    data['percent'] = percent;
    return data;
  }
}

class EsrbRating {
  int? id;
  String? slug;
  String? name;

  EsrbRating({this.id, this.slug, this.name});

  EsrbRating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['name'] = name;
    return data;
  }
}

class Platforms {
  EsrbRating? platform;
  String? releasedAt;
  Requirements? requirements;

  Platforms({this.platform, this.releasedAt, this.requirements});

  Platforms.fromJson(Map<String, dynamic> json) {
    platform = json['platform'] != null
        ? EsrbRating.fromJson(json['platform'])
        : null;
    releasedAt = json['released_at'];
    requirements = json['requirements'] != null
        ? Requirements.fromJson(json['requirements'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (platform != null) {
      data['platform'] = platform!.toJson();
    }
    data['released_at'] = releasedAt;
    if (requirements != null) {
      data['requirements'] = requirements!.toJson();
    }
    return data;
  }
}

class Requirements {
  String? minimum;
  String? recommended;

  Requirements({this.minimum, this.recommended});

  Requirements.fromJson(Map<String, dynamic> json) {
    minimum = json['minimum'];
    recommended = json['recommended'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['minimum'] = minimum;
    data['recommended'] = recommended;
    return data;
  }
}
