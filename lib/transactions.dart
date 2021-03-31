import 'package:flutter/material.dart';
import 'package:newproject/databaseservice.dart';

class Transatoncs extends StatefulWidget {
  @override
  _TransatoncsState createState() => _TransatoncsState();
}

class _TransatoncsState extends State<Transatoncs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tranactions'),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                maxRadius: 50,
                child: StreamBuilder(
                  stream:
                      DataBaseServices().displayData('ZO1NH9ABGP5G5SY01pV2'),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data['count'].toString());
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      DataBaseServices()
                          .fireStoreTansactions('ZO1NH9ABGP5G5SY01pV2', 'plus');
                    },
                    child: Text('increment'),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      DataBaseServices().fireStoreTansactions(
                          'ZO1NH9ABGP5G5SY01pV2', 'minus');
                    },
                    child: Text('Follow -'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
