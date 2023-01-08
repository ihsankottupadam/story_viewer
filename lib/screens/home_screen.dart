import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_viewer/controllers/story_controller.dart';
import 'package:story_viewer/screens/view_story_screen.dart';
import 'package:story_viewer/widgets/person_story_card.dart';

class HomeScreen extends GetView<MyStoryController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff128C7E),
        centerTitle: true,
        title: const Text('Stories'),
      ),
      body: GetBuilder<MyStoryController>(
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final stories = controller.stories;
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: stories.length,
              itemBuilder: (context, index) {
                return PersonStoryCard(
                  personStoryModel: stories[index],
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (_, __, ___) => ViewStoryScreen(
                                  stories: stories,
                                  currIndex: index,
                                )));
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
