import 'package:get/get.dart';
import 'package:story_viewer/controllers/story_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MyStoryController());
  }
}
