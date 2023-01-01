
class GameScreenShotsResponse {
  int? count;
  String? next;
  String? previous;
  List<ScreenShot>? results;

  GameScreenShotsResponse({this.count, this.next, this.previous, this.results});

  GameScreenShotsResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <ScreenShot>[];
      json['results'].forEach((v) {
        results!.add(ScreenShot.fromJson(v));
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

class ScreenShot {
  int? id;
  String? image;
  int? width;
  int? height;
  bool? isDeleted;

  ScreenShot({this.id, this.image, this.width, this.height, this.isDeleted});

  ScreenShot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    width = json['width'];
    height = json['height'];
    isDeleted = json['is_deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['width'] = width;
    data['height'] = height;
    data['is_deleted'] = isDeleted;
    return data;
  }
}
