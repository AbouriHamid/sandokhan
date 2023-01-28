import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';




class Hard extends StatefulWidget {
  const Hard({Key? key}) : super(key: key);

  @override
  State<Hard> createState() => _HardState();
}

class _HardState extends State<Hard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hard exercices"),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('hard').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting: return Text('Loading...');
              default:
                return ListView(
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    return ListTile(
                      leading: Image.network(document['imageUrl']),
                      title: Text(document['title']),
                      subtitle: Text(document['description']),
                    );
                  }).toList(),
                );
            }
          },
        )

    );
  }
}
