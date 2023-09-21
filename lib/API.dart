import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'chat_screen.dart';
String    jsonobject8= "hello ";



class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  HomePage2State createState() => HomePage2State();
}

class HomePage2State extends State<HomePage2> {
  int _currentIndex = 0;

  int lastClickedButton = -1;


  void handleButtonClick(int buttonIndex) {
    setState(() {
      lastClickedButton = buttonIndex;
    });
  }

  Color getButtonColor(int buttonIndex) {
    return buttonIndex == lastClickedButton ? Colors.blue : Colors.grey;
  }



  @override
  void initState() {
    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Integration'),
      ),
      body: Center(


        child:Column(
          children: [ElevatedButton(
          onPressed: () {
            postData(); // Call the function inside the anonymous function
          },
          child: const Text('press to print'),
          ),

            Text(  jsonobject8,
              style: const TextStyle(

                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 40.0),


            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                ElevatedButton(
                  onPressed: () {
                    handleButtonClick(0);
                    setState(() {
                      _currentIndex = 0; // Switch to Screen1
                    });// Call the function inside the anonymous function
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: getButtonColor(0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))
                  ),
                  child: const Text('press to print'),
                ),ElevatedButton(

                  onPressed: () {
                    handleButtonClick(1);
                    setState(() {
                      _currentIndex = 1; // Switch to Screen1
                    });// Call the function inside the anonymous function
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: getButtonColor(1),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                  child: const Text('press to print'),
                ),
                ElevatedButton(
                  onPressed: () {
                    handleButtonClick(2);
                    setState(() {
                      _currentIndex = 2; // Switch to Screen1
                    });// Call the function inside the anonymous function
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: getButtonColor(2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                  child: const Text('press to print'),
                ),

            ],),
            IndexedStack(
              index: _currentIndex,
              children: [
                Screen1(), // Screen1 widget
                Screen2(),
                Screen3(),// Screen2 widget
              ],
            ),


          ],



        ),
      ),
    );
  }
}






 postData() async {
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


  var response = await http.post(url,  body: requestBody);
  print(url);
  print("hello${response.body}");

  String ress= response.body ;
  var jsonobject = jsonDecode(ress);
  Map<String, dynamic> jsonobject2 = jsonobject;
  Map<String,dynamic> jsonobject3 = jsonobject2['responseObject'];
  List jsonobject4 = jsonobject3['recordList'];
  Map<String,dynamic> jsonobject5 = jsonobject4[0];
  Map<String,dynamic> jsonobject6 = jsonobject5['invitedUser'];
   String   jsonobject7 = jsonobject6['email'];

  if (kDebugMode) {
    print('POST request successful!');
  }
  if (kDebugMode) {
    print( jsonobject7 );
  }
  jsonobject8=jsonobject7;

  if (response.statusCode == 200) {
    // Request successful

  } else {
    // Request failed
    print('POST request failed with status: ${response.statusCode}');
  }
  return jsonobject7;
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
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////



class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen 1 Content'),
    );
  }
}


class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen 2 Content'),
    );
  }
}

final List<String> bids = [
  'Lorem .',
  'Sed do',
  'Ut eni',
  'Duis aute ir.',
  'Excum.',
  "sdjvfcjhsdg",
  "jnzcbsdh",
  'kcbv hjsn',
  "shjcdvbsdhufj",
  "shbdkvfcb"
];




// class Screen3 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200.0, // Set the width to 200 pixels
//       height: 500.0, // Set the height to 150 pixels
//        // Background color of the container
//       child:   ListView.builder(
//         itemCount: bids.length,
//         itemBuilder: (context, index) {
//           final bid = bids[index];
//           return Container(
//             width: 70,
//             height: 70,
//             child: ListTile(
//               tileColor: Colors.indigoAccent,
//               title: Text(bid),
//               subtitle: Text(bid),
//             ),
//           );
//           SizedBox();
//
//         },
//       ),
//     );
//   }
// }
////////////////////////////////////////////////////////////////////////////////
class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500.0,
      child: ListView.builder(
        itemCount: bids.length,
        itemBuilder: (context, index) {
          final bid = bids[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0), // Adjust the vertical padding as needed
            child: ListTile(
              tileColor: Colors.indigoAccent,
              title: Text(bid),
              subtitle: Text(bid),
            ),
          );
        },
      ),
    );
  }
}
////////////////////////////////////////////////////////////////////////////////
// class Screen3 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView( // Use SingleChildScrollView as the parent
//       child: Container(
//         width: 200.0,
//         height: 500.0,
//         child: Column( // Use Column to stack widgets vertically
//           children: <Widget>[
//             // Other widgets above the ListView
//             Text('Above ListView'),
//             Container(
//               height: 8.0, // Add space between widgets if needed
//             ),
//             ListView.builder(
//               shrinkWrap: true, // Important: Use shrinkWrap to prevent ListView from taking infinite height
//               itemCount: bids.length,
//               itemBuilder: (context, index) {
//                 final bid = bids[index];
//                 return ListTile(
//                   tileColor: Colors.indigoAccent,
//                   title: Text(bid),
//                   subtitle: Text(bid),
//                 );
//               },
//             ),
//             // Other widgets below the ListView
//             Text('Below ListView'),
//           ],
//         ),
//       ),
//     );
//   }
// }
//









////////////////////////////////////////////////////////////////////////////////
class Screen4 extends StatefulWidget {
  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          ListTile(title: Text('Item 1')),
          ListTile(title: Text('Item 2')),
          ListTile(title: Text('Item 3')),
          // Add more items as needed
        ],
      )

    );
  }
}