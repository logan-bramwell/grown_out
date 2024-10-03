import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whs_deals_app/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:whs_deals_app/features/shop/controllers/all_products_controller.dart';
import 'package:whs_deals_app/utils/helpers/cloud_helper_functions.dart';

import '../../../../common/widgets/products/sortable_products/sortable_products.dart';
import '../../models/product_model.dart';



class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.product, this.query, this.futureMethod, required this.title});

  final ProductModel product;
  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: futureMethod ?? controller.fetchProductsByQuery(query),
          builder: (context, snapshot) {

            const loader = TVerticalProductShimmer();
            final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

            if (widget != null) return widget;


            final products = snapshot.data!;

            return TSortableProducts(products: products);
          }
        ),
      ),
    );
  }
}

