import 'package:flutter/material.dart';
import 'package:newproject/databaseservice.dart';

class BatchWrites extends StatefulWidget {
  @override
  _BatchWritesState createState() => _BatchWritesState();
}

class _BatchWritesState extends State<BatchWrites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Batches"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('Data Deleted');
                    DataBaseServices().batchWeites();
                  },
                  child: Text('Delete Batch'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
