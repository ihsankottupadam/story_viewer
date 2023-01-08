import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_viewer/models/person_story_model.dart';
import 'package:story_viewer/widgets/story_widget.dart';

class ViewStoryScreen extends StatefulWidget {
  const ViewStoryScreen(
      {super.key, required this.stories, required this.currIndex});
  final List<PersonStoryModel> stories;
  final int currIndex;

  @override
  State<ViewStoryScreen> createState() => _ViewStoryScreenState();
}

class _ViewStoryScreenState extends State<ViewStoryScreen> {
  late PageController pageController;
  StoryController storyController = StoryController();
  @override
  void initState() {
    pageController = PageController(initialPage: widget.currIndex);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: const Key('storyScreen'),
      direction: DismissDirection.down,
      onDismissed: (direction) {
        Navigator.pop(context);
      },
      child: PageView.builder(
        itemCount: widget.stories.length,
        controller: pageController,
        itemBuilder: (context, index) {
          return StoryWidget(
            pageController: pageController,
            personStoryItem: widget.stories[index],
          );
        },
      ),
    );
  }
}
