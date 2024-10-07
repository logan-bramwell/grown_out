import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whs_deals_app/common/widgets/custom%20shapes/containers/primary_header_container.dart';
import 'package:whs_deals_app/features/personalisation/screens/select_school/select_school_appbar.dart';
import 'package:whs_deals_app/navigation_menu.dart';
import 'package:whs_deals_app/utils/constants/sizes.dart';
import '../../../shop/models/product_model.dart';
import '../../controllers/select_school_controller.dart';
import '../../controllers/user_controller.dart';

class SelectSchoolScreen extends StatelessWidget {
  const SelectSchoolScreen({
    super.key,
    required this.firstTime,
  });

  final bool firstTime;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectSchoolController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // -- Header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // -- AppBar
                  Padding(
                    padding: EdgeInsets.all(TSizes.spaceBtwItems),
                    child: SelectSchoolAppBar(),
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
                ],
              ),
            ),
            Form(
              key: controller.selectSchoolFormKey,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // -- Dropdown
                    DropdownButtonFormField<String>(
                      value: controller.selectedSchool.value.isNotEmpty
                          ? controller.selectedSchool.value
                          : null,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.building_2_fill),
                        hintText: "Select Your School",
                      ),
                      onChanged: (value) {
                        if (value != null) {
                          controller.setSelectedSchool(value);
                        }
                      },
                      items: ["Wakatipu High School", "School 2", "School 3", "School 4"]
                          .map((option) => DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      ))
                          .toList(),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Obx(() {
                      // Check if a school is selected and show the Save button
                      return controller.selectedSchool.value.isNotEmpty
                          ? SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (controller.selectSchoolFormKey.currentState!.validate()) {
                              // Save the selected school
                              await controller.selectSchool();

                              if (firstTime) {
                                Get.offAll(() => NavigationMenu(product: ProductModel.empty()));
                              } else {
                                Navigator.pop(context);
                              }
                            }
                          },
                          child: const Text('Save'),
                        ),
                      )
                          : const SizedBox.shrink();
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
