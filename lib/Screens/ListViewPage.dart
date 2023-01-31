import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:fleetproject/Screens/UpdateFleet.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key, required this.fleetKey}) : super(key: key);

  final String fleetKey;
  @override
  State<ListViewPage> createState() => _ListViewPage();
}

class _ListViewPage extends State<ListViewPage> {
  Query dbRef = FirebaseDatabase.instance.ref().child('Fleets');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Fleets');

  Widget listItem({required Map fleets}) {
    return Container(
      height: 70,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(2, 2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Stack(children: [
        Container(
          margin: const EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          child: Text(
            fleets['no'] + ".",
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          alignment: Alignment.center,
          child: Text(
            fleets['name'],
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 20),
            alignment: Alignment.center,
            child: ListTile(
              trailing: const Icon(Icons.arrow_forward_rounded),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpdateFleet(fleetKey:'fleets' )));
              },
            )),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Fleet'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map fleet = snapshot.value as Map;
            fleet['key'] = snapshot.key;

            return listItem(fleets: fleet);
          },
        ),
      ),
    );
  }
}
