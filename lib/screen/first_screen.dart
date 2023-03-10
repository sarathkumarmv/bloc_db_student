import 'package:flutter/material.dart';
import 'package:student/screen/search_screen.dart';
import 'package:student/screen/second_screen.dart';
import '../functions/functions_db.dart';
import '../widget/list_view.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getStudents();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx1) => SearchScreen()));
            },
          ),
        ],
      ),
      body: const ListViewWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx1) => SecondScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}