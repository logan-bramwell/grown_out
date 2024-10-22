/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../common/widgets/shimmers/shimmer.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../common/widgets/custom shapes/containers/rounded_container.dart';
import '../../../../shop/controllers/category_controller.dart';

class ProductCategories extends StatelessWidget {
  const ProductCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get instance of the CategoryController
    final categoriesController = Get.put(CategoryController());

    // Fetch categories if the list is empty
    if (categoriesController.allItems.isEmpty) {
      categoriesController.fetchItems();
    }

    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Categories label
          Text('Categories', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: TSizes.spaceBtwItems),

          // MultiSelectDialogField for selecting categories
          Obx(
            () => categoriesController.isLoading.value
                ? const TShimmerEffect(width: double.infinity, height: 50)
                : MultiSelectDialogField(
                    buttonText: const Text("Select Categories"),
                    title: const Text("Categories"),
                    items: categoriesController.allItems.map((category) => MultiSelectItem(category, category.name)).toList(),
                    listType: MultiSelectListType.CHIP,
                    onConfirm: (values) {
                      CreateProductController.instance.selectedCategories.assignAll(values);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

 */
