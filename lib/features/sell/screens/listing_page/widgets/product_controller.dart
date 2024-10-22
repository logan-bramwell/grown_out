import 'package:get/get.dart';

import '../../../../../data/abstract/base_data_table_controller.dart';
import '../../../../../data/repositories/product/product_repository.dart';
import '../../../../shop/models/product_model.dart';


class ProductController extends TBaseController<ProductModel> {
  static ProductController get instance => Get.find();

  final _productRepository = Get.put(ProductRepository());

  @override
  Future<List<ProductModel>> fetchItems() async {
    return await _productRepository.getAllProducts();
  }

  @override
  bool containsSearchQuery(ProductModel item, String query) {
    return item.title.toLowerCase().contains(query.toLowerCase()) ||
        item.stock.toString().contains(query) ||
        item.price.toString().contains(query);
  }

  /// Sorting related code
  void sortByName(int sortColumnIndex, bool ascending) {
    sortByProperty(sortColumnIndex, ascending, (ProductModel product) =>
        product.title.toLowerCase());
  }

  /// Sorting related code
  void sortByPrice(int sortColumnIndex, bool ascending) {
    sortByProperty(
        sortColumnIndex, ascending, (ProductModel product) => product.price);
  }

  /// Sorting related code
  void sortByStock(int sortColumnIndex, bool ascending) {
    sortByProperty(
        sortColumnIndex, ascending, (ProductModel product) => product.stock);
  }

  /// Sorting related code


  /// Get the product price or price range for variations.
  String getProductPrice(ProductModel product) {
    return product.price.toString();
  }

  /// -- Calculate Discount Percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  /// -- Calculate Product Stock
  /// -- Calculate Product Stock
  String getProductStockTotal(ProductModel product) {
    return product.stock.toString();
  }

  /// -- Check Product Stock Status
  String getProductStockStatus(ProductModel product) {
    return product.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  @override
  Future<void> deleteItem(ProductModel item) {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }
}
