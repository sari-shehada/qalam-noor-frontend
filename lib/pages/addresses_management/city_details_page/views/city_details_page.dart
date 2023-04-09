import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../models/address/area.dart';
import '../controllers/city_details_controller.dart';
import 'widgets/area_card.dart';
import '../../../../tools/ui_tools/buttons.dart';
import '../../../../tools/ui_tools/custom_appbar.dart';

class CityDetailsPage extends StatelessWidget {
  const CityDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CityDetailsController cityDetailsController = Get.find();
    return Scaffold(
      floatingActionButton: CallToActionButton(
        onTap: () => cityDetailsController.addNewArea(),
        height: 74.h,
        width: 300.w,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Row(
              children: [
                Text(
                  'إضافة منطقة جديدة',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                FaIcon(
                  FontAwesomeIcons.plus,
                  color: Colors.white,
                  size: 28.sp,
                )
              ],
            ),
          ),
        ),
      ),
      appBar: CustomAppBar(
        title: cityDetailsController.city.name,
        iconData: FontAwesomeIcons.locationDot,
        backButtonEnabled: true,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: 20.h,
          start: 60.w,
          end: 60.w,
        ),
        child: Obx(
          () => FutureBuilder(
            future: cityDetailsController.areas.value,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  //TODO: Change later
                  child: Text('Error Loading Cities'),
                );
              }
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  //TODO:
                  return const Center(
                    //TODO: Change later
                    child: Text('no addresses yet'),
                  );
                } else {
                  List<Area> areas = snapshot.data as List<Area>;
                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: areas.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      // childAspectRatio: 3.h,
                      crossAxisSpacing: 20.w,
                      mainAxisSpacing: 20.h,
                      mainAxisExtent: 200.h,
                    ),
                    itemBuilder: (context, index) => AreaCard(
                      area: areas[index],
                    ),
                  );
                }
              } else {
                return const Center(
                  //TODO:
                  child: Text('no addresses yet'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
