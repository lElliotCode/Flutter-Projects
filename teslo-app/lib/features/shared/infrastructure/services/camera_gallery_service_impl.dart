import 'package:teslo_shop/main.dart';

import 'camera_gallery_service.dart';
import 'package:image_picker/image_picker.dart';

class CameraGalleryServiceImpl extends CameraGalleryService {
  final ImagePicker _picker = ImagePicker();

  @override
  Future<String?> selectPhoto() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80
    );
    if (image == null) return null;

    logger.i('Tenemos una img ${image.path}');

    return image.path;
  }

  @override
  Future<String?> takePhoto() async {
    final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
        preferredCameraDevice: CameraDevice.rear);

    if (photo == null) return null;

    logger.i('Tenemos una img ${photo.path}');

    return photo.path;
  }
}
