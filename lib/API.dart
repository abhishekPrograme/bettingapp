import 'package:http/http.dart' as http;
import 'dart:convert';


import 'package:flutter/material.dart';







class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  String _responseData = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse("http://127.0.0.1:5000/students"));

    final jsonResponse2 = jsonDecode(response.body);


    final jsonResponse3 = jsonResponse2['data'];


    //Employee emp = Employee.fromJson(jsonDecode(jsonResponse3));
    //print(emp);

    print(response.body);
    print(response.statusCode);


    print (jsonResponse3[0]);
    print (jsonResponse3[0]['employee_name']);


    if (response.statusCode == 200) {
      final jsonResponse2 = jsonDecode(response.body);

      print (jsonResponse2['data']);
      final jsonResponse3 = jsonResponse2['data'];
      print (jsonResponse3[0]);
      final jsonResponse4=jsonResponse3[5]['employee_name'];



      setState(() {
        _responseData=jsonResponse4;

      });
    } else {
      _responseData= "nai chla";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Integration'),
      ),
      body: Center(
        child: TextField(
          readOnly: true,
          controller: TextEditingController(text:_responseData ),
          decoration: InputDecoration(
            labelText: 'API Response',
          ),
        ),
      ),
    );
  }
}






void postData() async {
  var url = Uri.parse('https://dummyjson.com/products/add');

  // Create a Map with the request body data
  var requestBody = {

    "title": "His mother had always taught him",
    "body": "His mother had always taught him not to ever think of himself as better than others. He'd tried to live by this motto. He never looked down on those who were less fortunate or who had less money than him. But the stupidity of the group of people he was talking to made him change his mind.",
    "userId": 9.toString(),
  };

  // Encode the request body as JSON
  //var body = jsonEncode(requestBody);

  // Set the request headers
  var headers = {
    'Content-Type': 'application/json',
  };

  // Send the POST request
  var response = await http.post(url,  body: requestBody);
  print(url);

  // Check the response status code
  if (response.statusCode == 200) {
    // Request successful
    print('POST request successful!');
    print('Response body: ${response.body}');
  } else {
    // Request failed
    print('POST request failed with status: ${response.statusCode}');
  }
}
