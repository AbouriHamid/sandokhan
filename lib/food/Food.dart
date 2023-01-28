import 'package:flutter/material.dart';
import 'package:sandokhan/food/Calories.dart';
import 'package:sandokhan/food/Fat.dart';
import 'package:sandokhan/food/Protein.dart';




class Food extends StatefulWidget {
  const Food({Key? key}) : super(key: key);

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Healty Food"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 60,),
              SizedBox(
                height: 200,
                child: Image.network("https://cdn-icons-png.flaticon.com/512/3123/3123321.png"),
              ),
              SizedBox(height: 60,),
              Row(

                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(

                          child:  Text("Calories"),
                          style: ButtonStyle(

                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.orange)))),

                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Calories()));
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

                          child:  Text("Protein"),
                          style: ButtonStyle(

                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.orange)))),

                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Protein()));
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

                          child:  Text("Fat"),
                          style: ButtonStyle(

                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.orange)))),

                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Fat()));
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
    );
  }
}
