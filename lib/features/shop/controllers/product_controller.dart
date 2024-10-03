
import 'package:get/get.dart';
import 'package:whs_deals_app/common/widgets/loaders/loaders.dart';

import '../../../data/repositories/product/product_repository.dart';
import '../models/product_model.dart';


class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> recentProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchRecentProducts();
    super.onInit();
  }

  void fetchRecentProducts() async {
    try {
      isLoading.value = true;
      // Fetch recent products from the database
      final products = await productRepository.getRecentProducts();

      recentProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(
          title: "Oh Snap!", message: "Failed to fetch recent products");
    } finally {
      isLoading.value = false;
    }
  }
  Future<List<ProductModel>> fetchAllRecentProducts() async {
    try {

      final products = await productRepository.getRecentProducts();
      return products;

    } catch (e) {
      TLoaders.errorSnackBar(
          title: "Oh Snap!", message: "Failed to fetch recent products");
      return [];
    }
  }
}
