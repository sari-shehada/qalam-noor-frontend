import 'models/address/address.dart';
import 'models/address/area.dart';

import 'models/address/city.dart';
import 'models/educational/class.dart';

List<City> dummyCities = [
  City(
    id: 1,
    name: 'النبك',
  ),
  City(
    id: 2,
    name: 'دير عطية',
  )
];

List<Area> dummyAreas = [
  Area(
    id: 1,
    name: 'الحي الغربي',
    cityId: 1,
  ),
  Area(
    id: 2,
    name: 'الحي الشرقي',
    cityId: 1,
  ),
  Area(
    id: 3,
    name: 'السوق',
    cityId: 2,
  ),
  Area(
    id: 4,
    name: 'الجمعيات القديمة',
    cityId: 2,
  )
];

List<Address> dummyAddresses = [
  Address(
    id: 1,
    name: 'شارع ابو سيفو النفوري',
    details: 'مقابل مصبغة السلطان',
    areaId: 1,
  ),
  Address(
    id: 2,
    name: 'شارع امين',
    details: 'معمل ابو رجب',
    areaId: 1,
  ),
  Address(
    id: 3,
    name: 'شارع باسط',
    areaId: 1,
  ),
  Address(
    id: 4,
    name: 'الدريب',
    details: '',
    areaId: 2,
  ),
  Address(
    id: 5,
    name: 'شارع ٨ آذار',
    details: 'عيادة ميشيل بولص',
    areaId: 2,
  ),
  Address(
    id: 6,
    name: 'اسم العنوان',
    details: 'تفاصيل العنوان',
    areaId: 3,
  ),
  Address(
    id: 7,
    name: 'اسم العنوان',
    details: 'تفاصيل العنوان',
    areaId: 3,
  ),
  Address(
    id: 8,
    name: 'اسم العنوان',
    details: 'تفاصيل العنوان',
    areaId: 4,
  ),
  Address(
    id: 9,
    name: 'اسم العنوان',
    details: 'تفاصيل العنوان',
    areaId: 4,
  ),
];

List<Class> dummyClasses = [
  Class(id: 1, name: 'الصف الأول'),
  Class(id: 2, name: 'الصف الثاني'),
  Class(id: 3, name: 'الصف الثالث'),
  Class(id: 4, name: 'الصف الرابع'),
  Class(id: 5, name: 'الصف الخامس'),
  Class(id: 6, name: 'الصف السادس'),
  Class(id: 7, name: 'الصف السابع'),
  Class(id: 8, name: 'الصف الثامن'),
  Class(id: 9, name: 'الصف التاسع'),
];
