import 'package:flutter/material.dart';
import 'main.dart';
import 'database.dart';

class SignupForm extends StatefulWidget{

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final List<String> options = ['Maths', 'English', 'Science', 'Faculty'];
  String? selectedOption;


  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _courseController = TextEditingController();


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(title: Text('login with signup',),
          backgroundColor: Colors.green,
          leading: IconButton(icon: Icon(Icons.menu),
            onPressed: () {
              // Add functionality for the leading icon button
            },
          ),
        ),
      ),
      body: SingleChildScrollView(

        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50.0),
              Text('login',
                style: TextStyle(

                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 40.0),
              ),


              SizedBox(height: 10.0,),







              //1
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                margin: EdgeInsets.only(top: 10.0),
                child: TextFormField(
                  controller: _emailController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Name',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),

              //2
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                margin: EdgeInsets.only(top: 10.0),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Email',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),

              //3
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                margin: EdgeInsets.only(top: 10.0),
                child: TextFormField(
                  controller: _emailController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Date of Birth',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),




              //4
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                margin: EdgeInsets.only(top: 10.0),
                child: TextFormField(
                  controller: _emailController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Password',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),


              //5
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                margin: EdgeInsets.only(top: 10.0),
                child: TextFormField(
                  controller: _emailController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Confirm Email',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),

              //6
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                margin: EdgeInsets.only(top: 10.0),
                child: TextFormField(
                  controller: _emailController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Phone No.',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),

              //7
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                margin: EdgeInsets.only(top: 10.0),
                child: TextFormField(
                  controller: _emailController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Address (Line no 1)',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),

              //8
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                margin: EdgeInsets.only(top: 10.0),
                child: TextFormField(
                  controller: _emailController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Country',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),

              //9
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                margin: EdgeInsets.only(top: 10.0),
                child: TextFormField(
                  controller: _emailController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'State',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),

              //10
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                margin: EdgeInsets.only(top: 10.0),
                child: TextFormField(
                  controller: _emailController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'City',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),

              //11
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                margin: EdgeInsets.only(top: 10.0),
                child: TextFormField(
                  controller: _emailController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Zip Code',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),




////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              Container(
                margin: EdgeInsets.all(30.0),
                width: double.infinity,
                child: ElevatedButton(
                  child:const Text(
                    'create account',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async{
                    Navigator.push(context,
                        MaterialPageRoute(builder:(_)=> LoginScreen()));



                    if (_formKey.currentState!.validate()) {


                      final Map<String, dynamic> data = {
                        'email': _emailController.text,
                        'password': _passwordController.text,

                      };

                      await DatabaseHelper.instance.insertData(data);




                      // await _databaseHelper.insertUser(data);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('User saved to database')),
                      );
                      // this is to check wheather saved properly on terminal scree this code has nothing to do with application functionality
                      final List<Map<String, dynamic>> data1 = await DatabaseHelper.instance.getAllData();
                      data1.forEach((row) {
                        print('ID: ${row['id']}');
                        print('Email: ${row['email']}');
                        print('Password: ${row['password']}');
                        print('Course: ${row['course']}');
                        print('---------------------------');
                      });




                    }






                  },
                ),

              ),




            ],
          ),
        ),
      ),
    );
  }
}