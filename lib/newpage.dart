import 'package:flutter/material.dart';
import 'package:newproject/floatingaction.dart';

class Instructions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            alignment: Alignment.topRight,
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'asset/image/unnamed.png',
                ),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 10,
                  child: Container(
                    child: Floatactionbutton(),
                  ),
                ),
                // SizedBox(
                //   height: 100,
                // ),
                Positioned(
                  child: Container(
                    child: ListTile(
                      title: Text(
                        "Life Processes",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      subtitle: Text(
                        "Life Processes 01",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 500,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.help_outline),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "10",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Text(
                                "Questions",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.schedule_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "10",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Text(
                                "Minutes",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Instructions",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.article_outlined),
                  title: Text(
                      "1.0 mark is awarded for correct attempts and 0.0 marks for incorrect attempts."),
                ),
                ListTile(
                  leading: Icon(Icons.article_outlined),
                  title: Text("Tap on options to select the correct answer."),
                ),
                ListTile(
                  leading: Icon(Icons.bookmark_outline),
                  title: Text(
                      "Tap on the Bookmark icon to save interesting questions."),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50),
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Start',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .apply(color: Colors.white, fontSizeDelta: 2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
