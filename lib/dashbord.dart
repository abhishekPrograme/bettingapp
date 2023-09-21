import 'package:flutter/material.dart';



class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Highlight Last Clicked Button'),
        ),
        body: MyButtonRow(),
      ),
    );
  }
}

class MyButtonRow extends StatefulWidget {
  @override
  _MyButtonRowState createState() => _MyButtonRowState();
}

class _MyButtonRowState extends State<MyButtonRow> {
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
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            handleButtonClick(0);
          },
          style: ElevatedButton.styleFrom(primary: getButtonColor(0)),
          child: Text('Button 1'),
        ),
        ElevatedButton(
          onPressed: () {
            handleButtonClick(1);
          },
          style: ElevatedButton.styleFrom(primary: getButtonColor(1)),
          child: Text('Button 2'),
        ),
        ElevatedButton(
          onPressed: () {
            handleButtonClick(2);
          },
          style: ElevatedButton.styleFrom(primary: getButtonColor(2)),
          child: Text('Button 3'),
        ),
      ],
    );
  }
}





