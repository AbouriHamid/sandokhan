import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';




class Easy extends StatefulWidget {
  const Easy({Key? key}) : super(key: key);

  @override
  State<Easy> createState() => _EasyState();
}

class _EasyState extends State<Easy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("easy exercices"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('easy').snapshots(),
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
