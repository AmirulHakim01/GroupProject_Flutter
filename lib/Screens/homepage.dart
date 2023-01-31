import 'package:fleetproject/Screens/AddFleet.dart';
import 'package:fleetproject/Screens/ListViewPage.dart';
import 'package:fleetproject/Screens/UpdateFleet.dart';
import 'package:flutter/material.dart';
import 'package:fleetproject/Screens/ViewList.dart';
import 'package:fleetproject/Screens/UpdateFleet.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 40),
              //margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: Text(
                    "Add Fleet",
                    style: TextStyle(fontSize: 30),
                  ),
                  onPressed: (() {
                    setState(() {});
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddFleet(fleetKey: 'fleets'),
                        ));
                  }),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 40),
              //margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: (() {
                    setState(() {});
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UpdateFleet(fleetKey: 'fleets',),
                        ));
                  }),
                  child: const Text(
                    "Update",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 40),
              //margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: (() {
                    setState(() {});
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListViewPage(fleetKey: 'fleets',),
                        ));
                  }),
                  child: const Text(
                    "View Details",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 40),
              //margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: Text(
                    "View Fleet",
                    style: TextStyle(fontSize: 30),
                  ),
                  onPressed: (() {
                    setState(() {});
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListViewScreen(),
                        ));
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}