import 'package:http/http.dart' as http;
import 'dart:convert';


import 'package:flutter/material.dart';
import 'utebi.dart';







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
    String jsonString =''' {
      "name": "John Smith",
      "email": "john@example.com"
    }''';

  pp() {
    // Map<String, dynamic> user = jsonDecode(jsonString);
    // print("helllo +${user}");
    Map<String, dynamic> userMap = jsonDecode(jsonString);
    var user = User.fromJson(userMap);

    print('yoyoy+ ${userMap}');
    print('yoyoy22+ ${user}');

    print('Howdy, ${user.name}!');
    print('We sent the verification link to ${user.email}.');

    String json = jsonEncode(user);
    print('encode + ${json}');

  }








  Future<void> fetchData() async {
    // final response = await (http.Request("GET",Uri.parse("https://api.publicapis.org/entries"))).send();
    //
    // final jsonResponse2 =  await response.stream.bytesToString();
    //
    // final  jsonResponse3 = jsonResponse2[10];
    //
    //
    // print(jsonResponse3);


  }



  Future<Album> fetchAlbum() async {
    final response = await http
        .post(Uri.parse('http://139.59.81.101:8080/Utebi/rest/service/getBetsList'));
    print('ye hai one +${response.body}');
    print('ye hai two +${response.request}');
    print('ye hai three+${response.headers}');
    print('ye hai four+${response.statusCode}');
    print('ye hai five+${response.reasonPhrase}');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Integration'),
      ),
      body: Center(


        child:Column(
          children: [ElevatedButton(onPressed: postData, child: Text('press to print'))],



        ),
      ),
    );
  }
}






void postData() async {
  var url = Uri.parse('http://139.59.81.101:8080/Utebi/rest/service/getBetsList');

  // Create a Map with the request body data
  var requestBody = {

    "startIndex":"0",
    "length":"10",
    "searchString":"",
    "sortBy":"CREATION_DATE",
    "order":"D",
    "status":"PENDING_INVITATION",
    "userId":"1",
    "notificationId":"XXXXXX",
    "deviceOS":"Android",
    "make":"Samsung",
    "model":"S3",
    "token":"QZPZobzbdYaiP8RfghQH",
    "tokenUserId":"1",
    "tokenUserType":"user",

  };

  // Encode the request body as JSON
  //var body = jsonEncode(requestBody);

  // Set the request headers
  // var headers = {
  //   'Content-Type': 'application/json',
  // };

  // Send the POST request
  var response = await http.post(url,  body: requestBody);
  print(url);
  print("hello"+response.body);

  print('POST request successful!');
  print('Response body: ${response.body}');
  Map<String, dynamic> responseObject = jsony?["responseObject"];
  List<Map<String, dynamic?>> responseObject2 = responseObject?['recordList'];
  Map<String, dynamic?> responseObject3 = responseObject2[0];
  String responseObject4=responseObject3["email"];
  //Map<String, dynamic> jsonDataMap = json.decode(jsony);
    //Map<String,dynamic> responseObject = jsonDataMap["responseObject"];
    //Map<String, dynamic> responseObject2 = responseObject[3];
  // var responseObject3 = responseObject2['betname'].toString();
  print("descriptionk"+responseObject4);
  // print("descriptionk"+responseObject.toString());

  // Check the response status code
  if (response.statusCode == 200) {
    // Request successful

  } else {
    // Request failed
    print('POST request failed with status: ${response.statusCode}');
  }
}




class User {
  final String name;
  final String email;


  User (this.name,this.email);

  User.fromJson(Map<String,dynamic> json)
  : name = json['name'],
  email = json['email'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
  };




}


class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

