import 'dart:convert';
import 'package:app/models/add_task_model.dart';
import 'package:app/models/edit_password_model.dart';
import 'package:app/services/secure_storage.dart';
import 'package:http_interceptor/http/intercepted_http.dart';
import '../models/edit_profile_model.dart';
import 'interseptor_services.dart';

class NetworkService {
  // baseUrl
  static const isTester = true;

  static const DEVELOPMENT_SERVER = '54.80.18.228:8080';
  static const DEPLOYMENT_SERVER = '54.80.18.228:8080';

  static String get BASEURL {
    if (isTester) {
      return DEVELOPMENT_SERVER;
    } else {
      return DEPLOYMENT_SERVER;
    }
  }

  // APIS

  static String apiSignUp = '/api/note/v1/auth/sign-up/';
  static String apiSignIn = '/api/note/v1/auth/sign-in/';
  static String apiAddTask = '/api/note/v1/schedule';
  static String profileGet = '/api/note/v1/user/me';
  static String userEditProfile = '/api/note/v1/user/';
  static String passwordEditProfile = '/api/note/v1/user/change-password';


  // headers


  // interceptor
  static final http = InterceptedHttp.build(interceptors: [
    InterceptorService(),
  ]);

  //methods
  static Future<String?> GET(String api, Map<String, String> params) async {
      String? token=await SecureStorage.getToken("token");
     Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
    Uri url = Uri.http(BASEURL, api, params);
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  // POST
  //,
  static Future<String?> POST(String api, Map<String, dynamic> body) async {

    String? token=await SecureStorage.getToken("token");
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
    Uri url = Uri.http(BASEURL, api);
    final response =
        await http.post(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      return response.reasonPhrase;
    }
    return null;
  }

  static Future<String?> PUT(
      String api,Map<String, dynamic> body) async {

    String? token=await SecureStorage.getToken("token");
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
    Uri url = Uri.http(BASEURL, api,);
    final response =
        await http.put(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PATCH(
      String api, Map<String, String> params, Map<String, dynamic> body) async {

    String? token=await SecureStorage.getToken("token");
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
    Uri url = Uri.https(BASEURL, api);
    final response =
        await http.patch(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, String> params) async {

    String? token=await SecureStorage.getToken("token");
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
    Uri url = Uri.https(BASEURL, api, params);
    final response = await http.delete(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  /// params

  static Map<String, String> paramsEmpty() {
    Map<String, String> map = {};
    return map;
  }

  // body

  static Map<String, dynamic> bodySignUp(
      String firstName, String lastName, String phoneNumber, String password) {
    Map<String, String> map = {
      "firsName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "password": password
    };
    return map;
  }

  static Map<String, dynamic> bodySignIn(String phoneNumber, String password) {
    Map<String, String> map = {
      "phoneNumber": phoneNumber,
      "password": password
    };
    return map;
  }

  static Map<String, String> bodyEmpty() {
    Map<String, String> map = {};
    return map;
  }

  static Map<String, String> bodyToken(String token) {
    Map<String, String> map = {'token': token};

    return map;
  }


  static Map<String, dynamic> editBody(UserEditProfileModel userEditProfileModel) {
    Map<String, dynamic> map = {
      "firstName":userEditProfileModel.firstName,
      "lastName":userEditProfileModel.lastName,
      "phoneNumber":userEditProfileModel.phoneNumber,
      "birthDate":userEditProfileModel.birthDate
    };
    return map;
  }

  static Map<String, dynamic> editPasswordBody(EditPasswordModel editPasswordModel) {
    Map<String, dynamic> map = {
      "oldPassword": editPasswordModel.oldPassword,
      "newPassword": editPasswordModel.newPassword,
      "prePassword": editPasswordModel.prePassword
    };
    return map;
  }


    static Map<String, dynamic> bodyAddTask(AddTaskModel addTaskModel) {
    Map<String, dynamic> map = {
      "science": addTaskModel.science.toString(),
      "noteTime": addTaskModel.noteTime,
      "classRoom": addTaskModel.classRoom.toString(),
      "startTime": addTaskModel.startTime,
      "endTime": addTaskModel.endTime,
      "name": addTaskModel.name.toString(),
      "role": addTaskModel.role.toString(),
      "week": addTaskModel.week.toString(),
      "note": addTaskModel.note.toString()
    };
    return map;
  }

  static Map<String, String> paramsScience({String? week, String? role}) {
    Map<String, String> map = {
      'week': week.toString(),
      'role': role.toString(),
    };
    return map;
  }
}
