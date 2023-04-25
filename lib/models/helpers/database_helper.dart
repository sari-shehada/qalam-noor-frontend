import 'dart:io';

import 'package:get/get.dart';
import 'package:kalam_noor/models/agendas/families.dart';
import 'package:kalam_noor/models/agendas/father.dart';
import 'package:kalam_noor/models/agendas/mother.dart';
import 'package:kalam_noor/models/educational/class.dart';
import 'package:kalam_noor/pages/addresses_management/main_page/views/widgets/cities_table.dart';
import 'package:kalam_noor/tools/logic_tools/network_service.dart';

import '../../pages/addresses_management/main_page/controllers/addresses_management_stats_controller.dart';
import '../address/address.dart';
import '../address/area.dart';
import '../address/city.dart';

import '../../to_be_disposed/data/dummy_data.dart';
import '../medical/illness.dart';
import '../medical/psychological_status.dart';
import '../medical/vaccine.dart';
import 'database_helpers/cities_db_helper.dart';

abstract class DatabaseHelper {
  //Addresses

  // //Cities
  static Future<List<CityToDescendentCount>> getCitiesToAreasCount() async {
    List<City> cities = await CitiesDBHelper.instance.getAll();
    List<CityToDescendentCount> citiesToAreasCount = [];
    for (City city in cities) {
      int areasCount = await getCityAreasCount(city.id);
      citiesToAreasCount.add(
        CityToDescendentCount(city: city, descendentCount: areasCount),
      );
    }
    final List<CityToDescendentCount> statsList = [];
    citiesToAreasCount.sort(
      (a, b) => b.descendentCount.compareTo(a.descendentCount),
    );

    int pieChartItemsToDisplay = 5;
    int othersCount = 0;
    for (int i = 0; i < citiesToAreasCount.length; i++) {
      if (i < pieChartItemsToDisplay) {
        statsList.add(citiesToAreasCount[i]);
      } else {
        othersCount += statsList[i].descendentCount;
      }
    }
    if (statsList.length > pieChartItemsToDisplay) {
      statsList.add(CityToDescendentCount(
          city: City(id: -1, name: 'مدن أخرى'), descendentCount: othersCount));
    }
    return statsList;
  }

  static Future<List<CityToDescendentCount>> getCitiesToAddressesCount() async {
    List<City> cities = await CitiesDBHelper.instance.getAll();
    List<CityToDescendentCount> citiesToAddressesCount = [];
    for (City city in cities) {
      int addressesCount = await getCityAddressesCount(cityId: city.id);
      citiesToAddressesCount.add(
        CityToDescendentCount(city: city, descendentCount: addressesCount),
      );
    }
    final List<CityToDescendentCount> statsList = [];
    citiesToAddressesCount.sort(
      (a, b) => b.descendentCount.compareTo(a.descendentCount),
    );

    int pieChartItemsToDisplay = 5;
    int othersCount = 0;
    for (int i = 0; i < citiesToAddressesCount.length; i++) {
      if (i < pieChartItemsToDisplay) {
        statsList.add(citiesToAddressesCount[i]);
      } else {
        othersCount += statsList[i].descendentCount;
      }
    }
    if (statsList.length > pieChartItemsToDisplay) {
      statsList.add(CityToDescendentCount(
          city: City(id: -1, name: 'مدن أخرى'), descendentCount: othersCount));
    }
    return statsList;
  }

  static Future<int> getCitiesCount() async {
    //TODO: Change to an api call
    await Future.delayed(
      const Duration(
        milliseconds: 400,
      ),
    );
    return dummyCities.length;
  }

  static Future<City> addCity(City city) async {
    //TODO: Change to an api call
    city = city.copyWith(id: dummyCities.length + 1);
    dummyCities.add(city);
    return city;
  }

  static Future<City> updateCityById({
    required City city,
  }) async {
    //TODO: Change to an api call
    dummyCities[dummyCities.indexOf(
        dummyCities.firstWhere((element) => element.id == city.id))] = city;
    return city;
  }

  //Areas
  static Future<Area> addNewArea(Area area) async {
    //TODO: Change to an api call
    area = area.copyWith(id: dummyAreas.length + 1);
    dummyAreas.add(area);
    return area;
  }

  static Future<Area> updateAreaById({
    required Area area,
  }) async {
    //TODO: Change to an api call
    dummyAreas[dummyAreas.indexOf(
        dummyAreas.firstWhere((element) => element.id == area.id))] = area;
    return area;
  }

  static Future<int> getCityAreasCount(int cityId) async {
    //TODO: Change to an api call
    int count = 0;
    for (Area element in dummyAreas) {
      if (element.cityId == cityId) {
        count++;
      }
    }
    return count;
  }

  static Future<int> getAreasCount() async {
    //TODO: Change to an api call
    await Future.delayed(
      const Duration(
        milliseconds: 400,
      ),
    );
    return dummyAreas.length;
  }

  static Future<List<Area>> getAreasInCity({required int cityId}) async {
    List<Area> tempAreas = [];
    for (Area area in dummyAreas) {
      if (area.cityId == cityId) {
        tempAreas.add(area);
      }
    }
    return tempAreas;
  }

  //Addresses
  static Future<Address> addNewAddress(Address address) async {
    //TODO: Change to an api call
    address = address.copyWith(id: dummyAddresses.length + 1);
    dummyAddresses.add(address);
    return address;
  }

  static Future<Address> updateAddressById({
    required Address address,
  }) async {
    //TODO: Change to an api call
    dummyAddresses[dummyAddresses.indexOf(
            dummyAddresses.firstWhere((element) => element.id == address.id))] =
        address;
    return address;
  }

  static Future<int> getCityAddressesCount({required int cityId}) async {
    //TODO: Change to an api call
    int count = 0;
    List<Area> areasInCity = [];
    for (Area element in dummyAreas) {
      if (element.cityId == cityId) {
        areasInCity.add(element);
      }
    }
    for (Area area in areasInCity) {
      count +=
          dummyAddresses.where((address) => address.areaId == area.id).length;
    }
    return count;
  }

  static Future<int> getAreaAddressesCount(int areaId) async {
    //TODO: Change to an api call
    int count = 0;
    for (Address address in dummyAddresses) {
      if (address.areaId == areaId) {
        count++;
      }
    }
    return count;
  }

  static Future<int> getAddressesCount() async {
    //TODO: Change to an api call
    await Future.delayed(
      const Duration(
        milliseconds: 400,
      ),
    );
    return dummyAddresses.length;
  }

  static Future<List<Address>> getAddressesInArea({required int areaId}) async {
    List<Address> tempAddresses = [];
    for (Address address in dummyAddresses) {
      if (address.areaId == areaId) {
        tempAddresses.add(address);
      }
    }
    return tempAddresses;
  }

  //School Classes
  static Future<List<Class>> getCurrentSchoolClasses() async {
    return dummyClasses;
  }

  //Psychological Matters
  static Future<List<PsychologicalStatus>> getPsychologicalStatuses() async {
    return dummyPsychologicalStatuses;
  }

  static Future<PsychologicalStatus> addPsychologicalStatus(
      PsychologicalStatus psychologicalStatus) async {
    //TODO: Change to an api call
    psychologicalStatus =
        psychologicalStatus.copyWith(id: dummyPsychologicalStatuses.length + 1);
    dummyPsychologicalStatuses.add(psychologicalStatus);
    return psychologicalStatus;
  }

  static Future<PsychologicalStatus> updatePsychologicalStatusById({
    required PsychologicalStatus psychologicalStatus,
  }) async {
    //TODO: Change to an api call
    dummyPsychologicalStatuses[dummyPsychologicalStatuses.indexOf(
            dummyPsychologicalStatuses.firstWhere(
                (element) => element.id == psychologicalStatus.id))] =
        psychologicalStatus;
    return psychologicalStatus;
  }

  //Vaccines
  static Future<List<Vaccine>> getVaccines() async {
    return dummyVaccines;
    // return [];
  }

  static Future<Vaccine> addVaccine(Vaccine vaccine) async {
    //TODO: Change to an api call
    vaccine = vaccine.copyWith(id: dummyVaccines.length + 1);
    dummyVaccines.add(vaccine);
    return vaccine;
  }

  static Future<Vaccine> updateVaccineById({
    required Vaccine vaccine,
  }) async {
    //TODO: Change to an api call
    dummyVaccines[dummyVaccines.indexOf(
            dummyVaccines.firstWhere((element) => element.id == vaccine.id))] =
        vaccine;
    return vaccine;
  }

  //Illnesses
  static Future<List<Illness>> getIllnesses() async {
    return dummyIllnesses;
  }

  static Future<Illness> addIllness(Illness illness) async {
    //TODO: Change to an api call
    illness = illness.copyWith(id: dummyIllnesses.length + 1);
    dummyIllnesses.add(illness);
    return illness;
  }

  static Future<Illness> updateIllnessById({
    required Illness illness,
  }) async {
    //TODO: Change to an api call
    dummyIllnesses[dummyIllnesses.indexOf(
            dummyIllnesses.firstWhere((element) => element.id == illness.id))] =
        illness;
    return illness;
  }

  //Families
  static Future<List<Family>> getFamiliesByTieNumber(
      {required int tieNumber}) async {
    //TODO: Remove this duration later
    await Future.delayed(1000.milliseconds);
    List<int> fathersWithMatchingTieNumber = [];
    fathersWithMatchingTieNumber = dummyFathers
        .where((father) => father.tieNumber == tieNumber)
        .map((e) => e.id)
        .toList();
    List<Family> familiesWithMatchingTieNumber = [];
    for (Family family in dummyFamilies) {
      if (fathersWithMatchingTieNumber.contains(family.fatherId)) {
        familiesWithMatchingTieNumber.add(family);
      }
    }
    return familiesWithMatchingTieNumber;
  }

  static Future<Father> getFatherByFamilyId({required int familyId}) async {
    return dummyFathers.firstWhere((element) => element.id == familyId);
  }

  static Future<Mother> getMotherByFamilyId({required int familyId}) async {
    return dummyMothers.firstWhere((element) => element.id == familyId);
  }
}
