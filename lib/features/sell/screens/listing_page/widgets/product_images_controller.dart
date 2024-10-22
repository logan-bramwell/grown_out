import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class ProductImagesController extends GetxController {
  // Singleton instance
  static ProductImagesController get instance => Get.find();

  // Rx Observables for the selected thumbnail image
  Rx<String?> selectedThumbnailImageUrl = Rx<String?>(null);

  // Lists to store additional product images
  final RxList<String> additionalProductImagesUrls = <String>[].obs;

  /// Function to remove Product image
  Future<void> removeImage(int index) async {
    additionalProductImagesUrls.removeAt(index);
  }

  /// Pick Thumbnail Image from Media
  void selectThumbnailImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    // Handle the selected image
    if (image != null) {
      // Update the main image using the selected image
      selectedThumbnailImageUrl.value = image.path;
    }
  }
}
/*
  /// Pick Thumbnail Image from Gallery
  void selectMultipleProductImages() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages =
        await controller.selectImagesFromMedia(allowMultipleSelection: true, alreadySelectedUrls: additionalProductImagesUrls);

    // Handle the selected images
    if (selectedImages != null && selectedImages.isNotEmpty) {
      additionalProductImagesUrls.assignAll(selectedImages.map((e) => e.url));
    }
  }
}


 */
