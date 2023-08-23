import 'package:flutter/material.dart';



class Bid {
  final String name;
  final double amount;
  final DateTime date;

  Bid({required this.name, required this.amount, required this.date});
}

class BidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bid App',
      home: BidScreen(),
    );
  }
}

class BidScreen extends StatefulWidget {
  @override
  _BidScreenState createState() => _BidScreenState();
}

class _BidScreenState extends State<BidScreen> {
  final List<Bid> bids = [];

  void _addBid(String name, double amount) {
    final newBid = Bid(name: name, amount: amount, date: DateTime.now());
    setState(() {
      bids.add(newBid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Place a Bid'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BidForm(_addBid),
          SizedBox(height: 16.0),
          Text(
            'Previous Bids',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: bids.length,
              itemBuilder: (context, index) {
                final bid = bids[index];
                return ListTile(
                  title: Text(bid.name),
                  subtitle: Text('Amount: \$${bid.amount.toStringAsFixed(2)}\nDate: ${bid.date.toString()}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BidForm extends StatefulWidget {
  final Function(String, double) addBidCallback;

  BidForm(this.addBidCallback);

  @override
  _BidFormState createState() => _BidFormState();
}

class _BidFormState extends State<BidForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  void _submitBid() {
    final String name = nameController.text;
    final double amount = double.parse(amountController.text);

    widget.addBidCallback(name, amount);

    nameController.clear();
    amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Bid Name'),
          ),
          SizedBox(height: 12.0),
          TextField(
            controller: amountController,
            decoration: InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          SizedBox(height: 12.0),
          ElevatedButton(
            onPressed: _submitBid,
            child: Text('Place Bid'),
          ),
        ],
      ),
    );
  }
}
