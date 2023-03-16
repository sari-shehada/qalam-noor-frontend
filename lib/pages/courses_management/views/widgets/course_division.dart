//this is a container for courses
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../configs/fonts.dart';
import '../../../../configs/project_themes.dart';
import 'course_card.dart';

class CoursesDivision extends StatelessWidget {
  const CoursesDivision({
    super.key,
    required this.subjectsType,
    required this.courses,
  });
  final String subjectsType;
  final List<CourseCard> courses;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: lightColorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(30)),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$subjectsType :",
              style: ProjectFonts.titleLarge,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.circlePlus)),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: courses.length,
          itemBuilder: (context, index) => courses[index],
        )
      ]),
    );
  }
}