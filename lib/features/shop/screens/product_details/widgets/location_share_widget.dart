import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class TLocationAndShare extends StatelessWidget {
  const TLocationAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Iconsax.location, color: Colors.amber, size: 24),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Text.rich(
                TextSpan(
                    children: [
                      TextSpan(text: 'Frankton', style: Theme.of(context).textTheme.bodyLarge),
                      const TextSpan(text: ' - '),
                      const TextSpan(text: '2h'),


                    ]
                )
            )
          ],
        ),
        Text('Size 50', style: Theme.of(context).textTheme.headlineSmall),
        ///IconButton(onPressed: (){}, icon: const Icon(Icons.share, size: TSizes.iconMd,),)
      ],
    );
  }
}