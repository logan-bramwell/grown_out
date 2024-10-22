import 'package:get/get.dart';
import 'package:whs_deals_app/data/repositories/categories/category_repository.dart';

import '../../../common/widgets/loaders/loaders.dart';
import '../../../data/abstract/base_data_table_controller.dart';
import '../models/category_model.dart';

class CategoryController extends TBaseController<CategoryModel> {
  static CategoryController get instance => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;
      // Fetch all categories from the database
      final categories = await _categoryRepository.getAllCategories();

      allCategories.assignAll(categories);

      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
    } catch (e) {
      TLoaders.errorSnackBar(
          title: "Oh Snap!", message: "Failed to fetch categories");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  Future<List<CategoryModel>> fetchItems() async {
    return await _categoryRepository.getAllCategories();
  }

  @override
  bool containsSearchQuery(CategoryModel item, String query) {
    return item.name.toLowerCase().contains(query.toLowerCase());
  }

  /// Sorting related code
  void sortByName(int sortColumnIndex, bool ascending) {
    sortByProperty(sortColumnIndex, ascending, (CategoryModel category) => category.name.toLowerCase());
  }

  @override
  Future<void> deleteItem(CategoryModel item) {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }

}
