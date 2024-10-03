

import 'package:get/get.dart';
import 'package:whs_deals_app/data/repositories/categories/category_repository.dart';

import '../../../common/widgets/loaders/loaders.dart';
import '../models/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }


/// - Load category data
Future<void> fetchCategories() async {
  try {
    // show loader while loading categories
    isLoading.value = true;

    // Fetch categories from data source
    final categories = await _categoryRepository.getAllCategories();

    // update categories list
    allCategories.assignAll(categories);

    //filter featured categories
    featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());


  } catch (e) {
    TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  } finally {
    isLoading.value = false;
  }
}

/// - Load selected category data

/// - Get Category or Sub-Category Products
}