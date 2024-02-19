import 'package:e_com/core/extensions.dart';
import 'package:image_picker/image_picker.dart';

class MediaService {
  Future<List<XFile>> pickImages() async {
    try {
      final picker = ImagePicker();
      return await picker.pickMultiImage();
    } catch (e) {
      e.logError();
    }
    return [];
  }
}
