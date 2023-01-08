import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';
import 'package:story_viewer/models/person_story_model.dart';

import '../controllers/story_controller.dart';
import '../models/story_model.dart';
import 'person_profile.dart';

class StoryWidget extends StatelessWidget {
  StoryWidget({
    super.key,
    required this.personStoryItem,
    required this.pageController,
  });
  final PageController pageController;
  final PersonStoryModel personStoryItem;
  final MyStoryController myStoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    final stories = _getStories(personStoryItem.stories);
    return Material(
      child: Stack(
        children: [
          StoryView(
            storyItems: stories,
            controller: myStoryController.storyController,
            onComplete: () {
              if (pageController.page! < myStoryController.stories.length - 1) {
                pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              } else {
                Navigator.pop(context);
              }
            },
            onStoryShow: (storyItem) {
              int index = stories.indexOf(storyItem);
              personStoryItem.stories[index].readStatus = true;
              Future.delayed(const Duration(milliseconds: 100), () {
                myStoryController.update();
              });
            },
          ),
          ProfileWidget(personStoryItem: personStoryItem)
        ],
      ),
    );
  }

  List<StoryItem> _getStories(List<StoryModel> stories) {
    return List<StoryItem>.from(stories.map((x) => _getStoryItem(x)));
  }

  StoryItem _getStoryItem(StoryModel storyModel) {
    const storyDuration = Duration(seconds: 10);
    if (storyModel.image != null && storyModel.image!.isNotEmpty) {
      return StoryItem.pageImage(
          url: storyModel.image!,
          controller: myStoryController.storyController,
          caption: storyModel.title,
          imageFit: BoxFit.contain,
          shown: storyModel.readStatus,
          duration: storyDuration);
    }
    return StoryItem.text(
        title: storyModel.title,
        backgroundColor: Colors.deepPurple,
        shown: storyModel.readStatus,
        duration: storyDuration);
  }
}
