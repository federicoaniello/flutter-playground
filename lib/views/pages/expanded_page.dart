import 'package:flutter/material.dart';

class ExpandedPage extends StatelessWidget {
  const ExpandedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Expanded(child: Container(
              height: 20,
              color: Colors.amberAccent,
            )),
            Flexible(child: Container(
              padding: EdgeInsets.all(10),
              height: 100,
              color: Colors.blue,
              child: Text('RIODWKD'),
            ))

              ],
            ),
                        Divider(),

            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Flexible(child: Container(
              padding: EdgeInsets.all(10),
              height: 100,
              color: Colors.blue,
              child: Text('RIODWKD'),
            )),
            Expanded(child: Container(
              height: 20,
              color: Colors.amberAccent,
            )),

              ],
            )
          ],
        ),
      ),
    );
  }
}