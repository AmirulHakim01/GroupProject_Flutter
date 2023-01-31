import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class AddFleet extends StatefulWidget {
  const AddFleet({Key? key, required String fleetKey}) : super(key: key);

  @override
  State<AddFleet> createState() => _AddFleetState();
}

class _AddFleetState extends State<AddFleet> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Fleet'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Add Fleet Into The System',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),

              //
              SizedBox(
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
              SizedBox(
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
              SizedBox(
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
              SizedBox(
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
              SizedBox(
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
                  dbRef.push().set(Fleets);
                },
                child: const Text('Add Fleet'),
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
