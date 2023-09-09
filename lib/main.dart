import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'database.dart';
import 'singuppage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'chat_screen.dart';
import 'API.dart';
import 'screen1.dart';
import 'screen2.dart';
import 'screen3.dart';
import 'betScreen.dart';

import '';

void main() {
  runApp(MyApp2());
  //postData();
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////



class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageCarousel(),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  List<String> images = [
    'assets/images/B.jpg',
    'assets/images/A.jpg',
  ];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    startImageCarousel();
  }

  void startImageCarousel() {
    Timer.periodic(Duration(seconds: 4), (timer) {
      setState(() {
        if (currentIndex < images.length - 1) {
          currentIndex++;
        } else {
          timer.cancel();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => (LoginScreen())),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Image.asset(
          images[currentIndex],

        ),
      ),
    );
  }
}




//////////////////////////////////////////////////////////////////////////////////////////////////////////////







class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
   ChatScreen(),

    HomePage2(),
    BettingTransactionScreen(),
    BidApp()

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.home),
            label: 'Home Screen',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.pages),
            label: 'Home Screen',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.account_box),
            label: 'Home Screen',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////











/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class FragmentOne extends StatelessWidget {

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(scheme: "https",host:url);
    if(!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    ));
    {
      throw "can not launch url";
    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Stateless Screen'),
      ),
      body:  Center(
        child: GestureDetector(

          onTap: (){
            _launchURL("www.google.com");
          },


        ),

      ),
    );
  }
}

class FragmentTwo extends StatefulWidget {
  @override
  _FragmentTwoState createState() => _FragmentTwoState();
}

class _FragmentTwoState extends State<FragmentTwo> {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  Map<String, dynamic> _userData = {};

  @override
  void initState() {
    super.initState();
    _fetchCurrentUser();
  }

  Future<void> _fetchCurrentUser() async {
    final userData = await _databaseHelper.getCurrentUser();
    setState(() {
      _userData = userData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
                decoration: InputDecoration(
                  labelText: 'Email: ${_userData['email'] ?? ''}',
                  enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)))
                  ,
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                )),
            TextField(
                decoration: InputDecoration(
                  labelText: 'Password: ${_userData['password'] ?? ''}',
                  enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)))
                  ,
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                )),
            TextField(
                decoration: InputDecoration(
                  labelText: 'Course: ${_userData['course'] ?? ''}',
                  enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)))
                  ,
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                )),


          ],
        ),
      ),
    );
  }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController2 = TextEditingController();
  final _passwordController2 = TextEditingController();



  bool _isStudent = false;









  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers:[ SliverAppBar(
    title: Text('Login Screen'),
    expandedHeight: 400, // Replace with your desired expanded height
    flexibleSpace: FlexibleSpaceBar(
    background: Image.asset('assets/images/B.jpg', fit: BoxFit.fill),
    ),
    ),
        SliverAppBar(

          expandedHeight: 400, // Replace with your desired expanded height
          flexibleSpace: FlexibleSpaceBar(
            background: Scaffold(
              backgroundColor: Colors.indigoAccent,
              body: SingleChildScrollView(

                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      SizedBox(height: 20.0),
                      TextFormField(cursorColor: Colors.white,
                        controller: _emailController2,
                        keyboardType: TextInputType.emailAddress,
                        decoration:  InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                         focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(),

                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        cursorColor: Colors.white,
                        controller: _passwordController2,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100))),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: _isStudent ? 20.0 : 0),


                      SizedBox(height: 20.0),
                      Container(

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [SizedBox(
                            height: 48, // Replace with your desired height
                            width: 200,
                            child: ElevatedButton(
                              onPressed: ()  {


                                void _login(String email, String password) async {
                                  // Replace this logic with your actual email and password checking code
                                  if (await DatabaseHelper.instance.login2(email, password) ) {
                                    // Login successful
                                    Navigator.push(context,
                                        MaterialPageRoute(builder:(_)=> MyHomePage()));
                                  } else {
                                    // Invalid credentials
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Invalid password or email')),
                                    );
                                  }
                                }

                                String email = _emailController2.text;
                                String password = _passwordController2.text;
                                _login(email, password);
                              },
                              child: Text('Login'),
                            ),
                          ),]
                        ),
                      ),

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Does not have acount?"),
                            ElevatedButton(
                              onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder:(_)=> SignupForm()));





                              } ,
                              child: Text('Signup'),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

              ),
            ) ,



          ),
        )
    ]);
  }
}
