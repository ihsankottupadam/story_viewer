import 'package:flutter/material.dart';

import 'package:story_viewer/models/person_story_model.dart';
import 'package:story_viewer/models/story_model.dart';

class PersonStoryCard extends StatelessWidget {
  const PersonStoryCard({
    super.key,
    required this.personStoryModel,
    required this.onTap,
  });
  final PersonStoryModel personStoryModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: 2),
      leading: SizedBox(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
                width: 55,
                height: 55,
                child: _buildProgress(personStoryModel.stories)),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                personStoryModel.avatar,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      title: Text(personStoryModel.name),
      onTap: onTap,
    );
  }

  Widget _buildProgress(List<StoryModel> stories) {
    int viewedCount =
        stories.where((element) => element.readStatus == true).toList().length;

    return CircularProgressIndicator(
        strokeWidth: 2,
        backgroundColor: Colors.grey[400],
        color: const Color(0xff25D366),
        value: (stories.length - viewedCount) / stories.length);
  }
}
