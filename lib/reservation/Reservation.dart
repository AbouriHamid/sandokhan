import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sandokhan/User_info.dart';

import 'Res_info.dart';







class Resrvation extends StatefulWidget {
  const Resrvation({Key? key}) : super(key: key);

  @override
  State<Resrvation> createState() => _ResrvationState();
}

class _ResrvationState extends State<Resrvation> {


  FirebaseAuth userCredential =  FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;



  late var d = DateTime.now();
  late var weekDay = d.weekday;
  late var firstDayOfWeek = d.subtract(Duration(days: weekDay));

  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  late String monday = formatter.format(firstDayOfWeek.add(Duration(days: 1)));
  late String tuesday = formatter.format(firstDayOfWeek.add(Duration(days: 2)));
  late String wednesday = formatter.format(firstDayOfWeek.add(Duration(days: 3)));
  late String thursday = formatter.format(firstDayOfWeek.add(Duration(days: 4)));
  late String friday = formatter.format(firstDayOfWeek.add(Duration(days: 5)));
  late String saturday = formatter.format(firstDayOfWeek.add(Duration(days: 6)));

   String? _selectedDay;
  String? _selectedHour;



  late User_info user_info ;










  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text("Reservation"),
      ),

      body: Padding(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 60,),
              SizedBox(
                height: 300,
                  child: Image.network("https://cdn4.iconfinder.com/data/icons/web-stuff/100/office_orange-13-512.png")),
              DropdownButtonFormField<String>(
                items: ["Monday $monday", "Tuesday $tuesday", "Wednesday $wednesday", "Thursday $thursday", "Friday $friday", "Saturday $saturday"].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedDay = value;
                  });
                },
                value: _selectedDay,
                decoration: InputDecoration(labelText: 'Select a Day ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))
                    )
                ),
                validator: (value) {
                  if (value == null) {
                    return 'This field is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
              DropdownButtonFormField<String>(
                items: ["4", "5", "6", "7", "8", "9"].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedHour = value;
                  });
                },
                value: _selectedHour,
                decoration: InputDecoration(labelText: 'Select an Hour ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))
                    )
                ),
                validator: (value) {
                  if (value == null) {
                    return 'This field is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30,),
              Row(

                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(

                          child:  Text("Reserve"),
                  style: ButtonStyle(

                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(color: Colors.orange)))),

                  onPressed: () async {
                    String currentUser = userCredential.currentUser!.uid;



                    final docRef =  db.collection("users").doc(currentUser);
                    docRef.get().then(
                          (DocumentSnapshot doc)  {
                        final data = doc.data() as Map<String, dynamic>;

                        Res_info res_info = Res_info(_selectedDay!, _selectedHour!, currentUser,data["email"],data["name"],data["password"]);
                        db.collection("Reservation").doc().set(res_info.toFirestore());

                      },
                      onError: (e) => print("Error getting document: $e"),
                    );
                    setState(() {

                    });



                  }

            ),
                    ),
          ),
                ],
              ),
            ],
          ),
        ),
      )

    );
  }
}
