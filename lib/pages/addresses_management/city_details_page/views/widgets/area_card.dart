import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../area_details_page/controllers/area_details_controller.dart';
import '../../../area_details_page/views/area_details_page.dart';

import '../../../../../models/address/area.dart';
import '../../../../../models/helpers/database_helper.dart';
import '../../../main_page/views/widgets/city_stats_card.dart';

class AreaCard extends StatelessWidget {
  const AreaCard({
    super.key,
    required this.area,
  });

  final Area area;
  @override
  Widget build(BuildContext context) {
    // AddressManagementController addressManagementController = Get.find();

    return Container(
      width: 815.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          14.r,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF393939).withOpacity(.06),
            blurRadius: 60,
            offset: Offset(0.w, 30.h),
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(14.r),
        child: InkWell(
          onTap: () =>
              Get.to(const AreaDetailsPage(), binding: BindingsBuilder(() {
            Get.put(
              AreaDetailsController(area: area),
            );
          })),
          borderRadius: BorderRadius.circular(14.r),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 25.h,
              horizontal: 30.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  area.name,
                  style: TextStyle(
                    fontSize: 40.sp,
                    color: Get.theme.colorScheme.primary,
                  ),
                ),
                const Spacer(),
                CityStatsCard(
                  title: 'عدد العناوين',
                  count: DatabaseHelper.getAreaAddressesCount(area.id),
                  color: const Color(0xFFFA9746),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
