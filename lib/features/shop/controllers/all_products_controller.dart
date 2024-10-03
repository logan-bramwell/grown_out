import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../common/widgets/loaders/loaders.dart';
import '../../../data/repositories/product/product_repository.dart';
import '../models/product_model.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  final repository = ProductRepository.instance;
  final RxString selectedSortOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if (query == null) return [];

      final products = await repository.fetchProductsByQuery(query);

      return products;

    } catch (e) {
      TLoaders.errorSnackBar(
          title: "Oh Snap!", message: "Failed to fetch products");
      return [];
    }
  }

  void sortProducts (String sortOption) {
    selectedSortOption.value = sortOption;
    switch (sortOption) {
      case 'Highest Price':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Lowest Price':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Newest':
        products.sort((a, b) => a.date!.compareTo(b.date!));
        break;
      case 'Oldest':
        products.sort((a, b) => b.date!.compareTo(a.date!));
        break;
      default:
        products.sort((a, b) => a.date!.compareTo(b.date!));
    }
  }
  void assignProducts(List<ProductModel> products) {
    this.products.assignAll(products);
    sortProducts('Newest');
  }
}