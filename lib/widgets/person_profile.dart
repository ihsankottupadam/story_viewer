import 'package:flutter/material.dart';
import 'package:story_viewer/models/person_story_model.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
    required this.personStoryItem,
  }) : super(key: key);

  final PersonStoryModel personStoryItem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(personStoryItem.avatar),
            ),
            const SizedBox(width: 16),
            Text(
              personStoryItem.name,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
