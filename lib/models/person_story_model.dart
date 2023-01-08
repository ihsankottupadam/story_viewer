import 'package:story_viewer/models/story_model.dart';

class PersonStoryModel {
  final int id;
  final String avatar;
  final String name;
  final List<StoryModel> stories;

  PersonStoryModel({
    required this.id,
    required this.avatar,
    required this.name,
    required this.stories,
  });
}
