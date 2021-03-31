import 'package:flutter/material.dart';
import 'package:newproject/batchwrite.dart';
import 'package:newproject/display.dart';
import 'package:newproject/transactions.dart';

class Dashborad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Data"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Display Data'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DisplayData(),
                    ),
                  );
                },
                child: Text('Delete Data'),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Transatoncs(),
                ),
              );
            },
            child: Text('Followers'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BatchWrites(),
                ),
              );
            },
            child: Text('Delete Batch'),
          ),
        ],
      ),
    );
  }
}
