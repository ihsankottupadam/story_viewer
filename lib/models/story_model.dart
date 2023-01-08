List<StoryModel> storiesFromJson(List list) =>
    List<StoryModel>.from(list.map((x) => StoryModel.fromJson(x)));

class StoryModel {
  StoryModel({
    required this.id,
    required this.title,
    required this.readStatus,
    required this.image,
    required this.profile,
  });

  final int id;
  final String title;
  bool readStatus;
  final String? image;
  final Profile profile;

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
        id: json["id"],
        title: json["title"],
        readStatus: json["read_status"],
        image: json["image"],
        profile: Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "read_status": readStatus,
        "image": image,
        "profile": profile.toJson(),
      };
}

class Profile {
  Profile({
    required this.id,
    required this.name,
    required this.image,
  });

  final int id;
  final String name;
  final String image;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
