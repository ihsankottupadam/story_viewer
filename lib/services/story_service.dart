import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:story_viewer/models/story_model.dart';

class StoryService {
  Future<List<StoryModel>> getStories() async {
    try {
      final response = await Dio().get(
          'https://my-json-server.typicode.com/shakeebM/StoriesApi/stories');
      log(response.data.toString());
      if (response.statusCode == 200) {
        final stories = storiesFromJson(response.data);
        return stories;
      } else {
        throw 'Something went wrong';
      }
    } catch (e) {
      log(e.toString());
      throw 'Something went wrong';
    }
  }
}
