import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newproject/databaseservice.dart';

class DisplayData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder(
          stream:
              // DataBaseServices().displayData(documnetId);
              FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text("Loading Data Please Wait");
            if (!snapshot.hasData) return Text('No Data Fount');
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(snapshot.data.docs[index]['name']),
                  subtitle: Text(snapshot.data.docs[index]['phone']),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      DataBaseServices()
                          .deleteData(snapshot.data.docs[index].id);
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
