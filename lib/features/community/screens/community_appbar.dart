import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whs_deals_app/features/personalisation/screens/select_school/select_school.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../personalisation/controllers/select_school_controller.dart';

class CommunityAppBar extends StatelessWidget {
  final SelectSchoolController _schoolController = Get.find<SelectSchoolController>();

  CommunityAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Connect with other parents',
            style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey),
          ),
          Obx(() => Text(
            _schoolController.selectedSchool.value.isNotEmpty
                ? _schoolController.selectedSchool.value
                : 'Select Your School',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600, // Semi Bold
              color: TColors.white,
              fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize! * 0.8,
            ),
          )),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.to(() => const SelectSchoolScreen(firstTime: false,));
          },
          icon: const Icon(
            CupertinoIcons.building_2_fill,
            color: TColors.white,
            size: 28,
          ),
        ),
      ],
    );
  }
}
