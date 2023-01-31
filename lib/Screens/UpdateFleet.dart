import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class UpdateFleet extends StatefulWidget {
  const UpdateFleet({Key? key, required this.fleetKey}) : super(key: key);

  final String fleetKey;
  @override

  State<UpdateFleet> createState() => _UpdateFleetState();
}

class _UpdateFleetState extends State<UpdateFleet> {
  final userNameController = TextEditingController();
  final userNoController = TextEditingController();
  final userDate_RegisteredController = TextEditingController();
  final userLocationController = TextEditingController();
  final userStatusController = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Fleets');
    getFleetData();
  }

  void getFleetData() async {
    DataSnapshot snapshot = await dbRef.child(widget.fleetKey).get();

    Map fleet = snapshot.value  as Map;

    userNameController.text = fleet['name'];
    userNoController.text = fleet['no'];
    userDate_RegisteredController.text = fleet['registered_Date'];
    userLocationController.text = fleet['location'];
    userStatusController.text = fleet['status'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Fleet'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(children: [
           const   SizedBox(
                height: 50,
              ),
           const   Text(
                'Update Fleet Data Into The System',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),

              //
             const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter Fleet Name',
                ),
              ),
              //
             const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userNoController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Fleet No.',
                  hintText: 'Enter Fleet Number',
                ),
              ),
              //
            const  SizedBox(
                height: 30,
              ),
              TextField(
                controller: userDate_RegisteredController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Registered Date',
                  hintText: 'Enter Registered Date',
                ),
              ),
              //
             const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userLocationController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Location',
                  hintText: 'Enter Fleet Location',
                ),
              ),
              //
           const  SizedBox(
                height: 30,
              ),
              TextField(
                controller: userStatusController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Status',
                  hintText: 'Enter Fleet Status',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  Map<String, String> Fleets = {
                    'name': userNameController.text,
                    'no': userNoController.text,
                    'registered_Date': userDate_RegisteredController.text,
                    'location': userLocationController.text,
                    'status': userStatusController.text,
                  };
                  dbRef
                      .child(widget.fleetKey)
                      .update(Fleets)
                      .then((value) => {Navigator.pop(context)});
                },
                child: const Text('Update Fleet'),
                color: Colors.blue,
                textColor: Colors.white,
                minWidth: 300,
                height: 40,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
