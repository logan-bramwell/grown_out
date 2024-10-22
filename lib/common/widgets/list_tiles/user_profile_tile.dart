import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whs_deals_app/common/widgets/shimmers/shimmer.dart';
import '../../../features/personalisation/controllers/user_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../common/widgets/images/t_circular_image.dart';

class TUserProfileTile extends StatelessWidget {
  final VoidCallback onPressed;

  const TUserProfileTile({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return ListTile(
      leading: const TCircularImage(image: TImages.user, width: 50, height: 50, padding: 0,),
      title: Obx(() {
        if (controller.profileLoading.value) {
          return const TShimmerEffect(width: 80, height: 15);
        } else {
          return Text(
            controller.user.value.fullName,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: TColors.white),
          );
        }
      }),
      subtitle: Obx(() {
        if (controller.profileLoading.value) {
          return const TShimmerEffect(width: 80, height: 10);
        } else {
          return Text(
            controller.user.value.email,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: TColors.white),
          );
        }
      }),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
          color: TColors.white,
        ),
      ),
    );
  }
}
