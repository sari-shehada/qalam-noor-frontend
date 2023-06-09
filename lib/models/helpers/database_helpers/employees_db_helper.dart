import '../../agendas/employee.dart';
import '../../../tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';
import '../../agendas/job_title.dart';

class EmployeesDBHelper implements CRUDInterface<Employee> {
  String get _controllerName => 'EmployeeController/';
  static EmployeesDBHelper get instance => EmployeesDBHelper();

  @override
  Future<List<Employee>> getAll() async {
    String url = '${_controllerName}GetEmployees';
    List<Employee> allEmployees =
        await HttpService.getParsed<List<Employee>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return Employee.fromMap(e);
          },
        ).toList();
      },
    );
    return allEmployees;
  }

  Future<List<Employee>> getAllTeachers() async {
    String url = '${_controllerName}GetTeachers';
    List<Employee> allTeachers =
        await HttpService.getParsed<List<Employee>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return Employee.fromMap(e);
          },
        ).toList();
      },
    );
    return allTeachers;
  }

  Future<List<Employee>> getAllByJobTitleId(JobTitle jobTitle) async {
    String url =
        '${_controllerName}GetEmployeesByJobTitleId?jobTitleId=${jobTitle.id}';
    List<Employee> employees =
        await HttpService.getParsed<List<Employee>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return Employee.fromMap(e);
          },
        ).toList();
      },
    );
    return employees;
  }

  @override
  Future<Employee> getById(int id) async {
    String url = '${_controllerName}GetEmployeeById?id=$id';
    Employee? employee =
        await HttpService.getParsed<Employee?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return Employee.fromMap(responseData);
      },
    );
    if (employee == null) {
      throw Exception('No employee found with ID: $id');
    }
    return employee;
  }

  Future<int> getEmployeesCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<bool> insert(Employee object) async {
    String url = '${_controllerName}InsertEmployee';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  @override
  Future<bool> update(Employee object) async {
    String url = '${_controllerName}UpdateEmployee';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
