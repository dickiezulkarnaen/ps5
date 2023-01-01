import 'dart:convert';

import 'package:ps5_dicky_iskandar_z/app/models/games_response.dart';

class ApiConstant {
  static const rawgApiBaseUrl = 'https://api.rawg.io/api/';
  static const rawgApiKey = 'f1348109d6b942d1a86619c8b6049df6';
}

class Dummies {
  static final gamesItem = Results.fromJson(raw);
  static const Map<String, dynamic> raw = {
    "slug": "pre-purchase-romancing-saga-minstrel-song-remaster",
    "name": "Pre-purchase Romancing SaGa - Minstrel Song- Remastered",
    "playtime": 0,
    "platforms": [
      {
        "platform": {"id": 4, "name": "PC", "slug": "pc"}
      },
      {
        "platform": {"id": 187, "name": "PlayStation 5", "slug": "playstation5"}
      },
      {
        "platform": {"id": 18, "name": "PlayStation 4", "slug": "playstation4"}
      },
      {
        "platform": {"id": 7, "name": "Nintendo Switch", "slug": "nintendo-switch"}
      }
    ],
    "stores": [
      {
        "store": {"id": 1, "name": "Steam", "slug": "steam"}
      },
      {
        "store": {"id": 6, "name": "Nintendo Store", "slug": "nintendo"}
      }
    ],
    "released": "2022-12-01",
    "tba": false,
    "background_image": "https://media.rawg.io/media/screenshots/867/867f2c39a3f0b912653bedded87c9beb.jpg",
    "rating": 0,
    "rating_top": 0,
    "ratings": [],
    "ratings_count": 0,
    "reviews_text_count": 0,
    "added": 0,
    "added_by_status": null,
    "metacritic": null,
    "suggestions_count": 0,
    "updated": "2022-11-29T12:50:56",
    "id": 887670,
    "score": null,
    "clip": null,
    "tags": null,
    "esrb_rating": null,
    "user_game": null,
    "reviews_count": 0,
    "community_rating": 0,
    "saturated_color": "0f0f0f",
    "dominant_color": "0f0f0f",
    "short_screenshots": [
      {"id": -1, "image": "https://media.rawg.io/media/screenshots/867/867f2c39a3f0b912653bedded87c9beb.jpg"},
      {"id": 3670436, "image": "https://media.rawg.io/media/screenshots/161/161adf01358502100997fb8d1026fafe.jpg"},
      {"id": 3670437, "image": "https://media.rawg.io/media/screenshots/8bf/8bf606a71e8299a613a55a6068b009ce.jpg"},
      {"id": 3670438, "image": "https://media.rawg.io/media/screenshots/867/867f2c39a3f0b912653bedded87c9beb.jpg"}
    ],
    "parent_platforms": [
      {
        "platform": {"id": 1, "name": "PC", "slug": "pc"}
      },
      {
        "platform": {"id": 2, "name": "PlayStation", "slug": "playstation"}
      },
      {
        "platform": {"id": 7, "name": "Nintendo", "slug": "nintendo"}
      }
    ],
    "genres": [
      {"id": 5, "name": "RPG", "slug": "role-playing-games-rpg"}
    ]
  };
}
