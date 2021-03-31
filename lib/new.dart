import 'package:flutter/material.dart';
import 'package:newproject/floatingaction.dart';
import 'package:newproject/newpage.dart';

class New extends StatefulWidget {
  @override
  _NewState createState() => _NewState();
}

class _NewState extends State<New> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: Floatactionbutton(),
              centerTitle: true,
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              toolbarHeight: 72,
              pinned: true,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: ListTile(
                  subtitle: Text(
                    "The Living World",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  title: Text(
                    "Tests",
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                background: Container(
                  child: Stack(
                    alignment: const Alignment(1.8, 2),
                    children: <Widget>[
                      Image.asset("asset/image/gr.png", fit: BoxFit.fill),
                    ],
                  ),
                ),
                // centerTitle: true,
              ),
            ),
            SliverToBoxAdapter(
              child: Lists(),
            ),
          ],
        ),
      ),
    );
  }
}

class Lists extends StatefulWidget {
  @override
  _ListsState createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("Objective Test $index"),
            trailing: Text("Start"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Instructions()));
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }
}
