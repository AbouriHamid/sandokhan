import 'package:flutter/material.dart';
import 'package:sandokhan/Exercices/Easy.dart';
import 'package:sandokhan/Exercices/Hard.dart';
import 'package:sandokhan/Exercices/Medium.dart';



class WorkOut extends StatefulWidget {
  const WorkOut({Key? key}) : super(key: key);

  @override
  State<WorkOut> createState() => _WorkOutState();
}

class _WorkOutState extends State<WorkOut> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Exercices"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50,),
                SizedBox(
                  height: 250,
                  child: Center(child: Image.network("https://cdn-icons-png.flaticon.com/512/3043/3043196.png")),
                ),
                SizedBox(height: 60,),
                Row(

                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(

                            child:  Text("easy"),
                            style: ButtonStyle(

                                shape: MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                        side: BorderSide(color: Colors.orange)))),

                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Easy()));
                            }

                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60,),
                Row(

                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(

                            child:  Text("Medium"),
                            style: ButtonStyle(

                                shape: MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                        side: BorderSide(color: Colors.orange)))),

                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Medium()));
                            }

                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60,),
                Row(

                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(

                            child:  Text("Hard"),
                            style: ButtonStyle(

                                shape: MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                        side: BorderSide(color: Colors.orange)))),

                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Hard()));
                            }

                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
