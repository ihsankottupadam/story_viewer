import 'package:get/get.dart';
import 'package:story_view/story_view.dart';
import 'package:story_viewer/models/story_model.dart';
import 'package:story_viewer/services/story_service.dart';

import '../models/person_story_model.dart';
import '../util.dart';

class MyStoryController extends GetxController {
  bool isLoading = false;
  List<StoryModel>? allStories;
  List<PersonStoryModel> stories = [];
  StoryController storyController = StoryController();

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading = true;
    update();
    await StoryService()
        .getStories()
        .whenComplete(() {
          isLoading = false;
          update();
        })
        .then((value) => allStories = value)
        .onError((error, _) => Util.showError(error.toString()));
    _groupStories();
  }

  _groupStories() {
    stories = [];
    for (var story in allStories!) {
      int index =
          stories.indexWhere((element) => element.id == story.profile.id);
      if (index == -1) {
        stories.add(PersonStoryModel(
            id: story.profile.id,
            avatar: story.profile.image,
            name: story.profile.name,
            stories: [story]));
      } else {
        stories[index].stories.add(story);
      }
    }
  }
}
