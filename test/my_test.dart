

import 'dart:convert';

import 'package:app/services/network_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';


void main(){

  group('description', () {

    test('description', () async {
      var headers = {
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMiIsImlhdCI6MTY4MzcxMzMyMCwiZXhwIjoxNjg0MzE4MTIwfQ.ogjKWUL2pr_ra_dzbKgxL1fYfy6NrKt2Kb-dpO8wItQ',
        'Content-Type': 'application/json'
      };
      var request = Request('POST', Uri.parse('http://54.80.18.228:8080${NetworkService.apiAddTask}'));
      request.body = json.encode({
        "science": "aaaaaaaaaaaaaa",
        "classRoom": "bbbbbbbbbbbbb",
        "startTime": 1,
        "endTime": 5,
        "noteTime": 6546462642555,
        "name": "Joni",
        "role": "TEACHER",
        "week": "MONDAY",
        "note": false
      });
      request.headers.addAll(headers);

      StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      }
      else {
      print(response.reasonPhrase);
      }

    });
  });

}