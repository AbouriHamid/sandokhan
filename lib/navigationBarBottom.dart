import 'package:flutter/material.dart';

import 'Account.dart';
import 'food/Food.dart';
import 'reservation/Reservation.dart';
import 'Exercices/WorkOut.dart';



class NavigationBarBottom extends StatefulWidget {
  const NavigationBarBottom({Key? key}) : super(key: key);

  @override
  State<NavigationBarBottom> createState() => _NavigationBarBottomState();
}

class _NavigationBarBottomState extends State<NavigationBarBottom> {


  int selectedItem = 0;

  void onIteamTap(int index){
    setState((){
      selectedItem = index;
    });
  }

  List<Widget> _pages = <Widget>[];
  @override
  void initState() {

    super.initState();
    _pages.add(WorkOut());
    _pages.add(Food());
    _pages.add(Resrvation());
    _pages.add(Account());

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[selectedItem],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.orange,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.red,
            textTheme: Theme
                .of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.yellow))),
        child: BottomAppBar(
          color: Colors.orange,
          shape: CircularNotchedRectangle(),
          notchMargin: 2.0,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: kBottomNavigationBarHeight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange,
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
              ),
              child: BottomNavigationBar(
                  currentIndex: selectedItem,

                  selectedItemColor: Colors.black,
                  onTap: onIteamTap,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.fitness_center), label: 'WorkOut'),
                    BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: 'Food'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.calendar_month), label: 'Reservation'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.account_circle), label: 'Account'),
                  ]),
            ),
          ),
        ),
      ),

      );
  }
}
