
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';

  class AddNewAddressScreen extends StatelessWidget {
    const AddNewAddressScreen({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: const TAppBar(
          showBackArrow: true,
          title: Text('Add new Address'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Form(
              child: Column(
                children: [
                  // Name Input
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: 'Name',
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),

                  // Phone Number Input
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),
                      labelText: 'Phone Number',
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),

                  // Address and Postal Code Row
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building_3),
                            labelText: 'Address',
                          ),
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwInputFields),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.code),
                            labelText: 'Postal Code',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),

                  // City and State Row
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building),
                            labelText: 'City',
                          ),
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwInputFields),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.activity),
                            labelText: 'State',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.defaultSpace),
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text('Save')),)
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
