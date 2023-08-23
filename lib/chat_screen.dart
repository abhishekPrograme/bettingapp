import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'screen2.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> messages = [];
  TextEditingController _textEditingController = TextEditingController();
  late Database _database;

  @override
  void initState() {
    super.initState();
    _initDatabase();
  }

  void _initDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath!, 'chat.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) {
        return db.execute(
          'CREATE TABLE messages(id INTEGER PRIMARY KEY AUTOINCREMENT, message TEXT)',
        );
      },
    );

    List<Map<String, dynamic>> rows =
    await _database.rawQuery('SELECT * FROM messages');
    rows.forEach((row) {
      setState(() {
        messages.add(row['message']);
      });
    });
  }

  void _sendMessage(String message) async {
    await _database.transaction((txn) async {
      await txn.rawInsert(
        'INSERT INTO messages(message) VALUES(?)',
        [message],
      );
    });

    setState(() {
      messages.add(message);
    });
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryButton(
                title: 'Category 1',
                icon: Icons.edit_note,
              ),
              CategoryButton(
                title: 'Category 2',
                icon: Icons.account_box,
              ),
              CategoryButton(
                title: 'Category 3',
                icon: Icons.category,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                return MessageBubble(message: messages[index]);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Enter a message',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (_textEditingController.text.isNotEmpty) {
                      _sendMessage(_textEditingController.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String message;

  const MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

