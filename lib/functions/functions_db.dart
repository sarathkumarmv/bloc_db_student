import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'modals/modals.dart';

ValueNotifier<List<StdModal>> notifierstdlist = ValueNotifier([]);

Future<void> addstd(StdModal value) async {
  final stddatabase = await Hive.openBox<StdModal>('std_database');
  await stddatabase.add(value);
  notifierstdlist.value.add(value);

  notifierstdlist.notifyListeners();
}

Future<void> getStudents() async {
  final stddatabase = await Hive.openBox<StdModal>('std_database');
  notifierstdlist.value.clear();
  notifierstdlist.value.addAll(stddatabase.values);

  notifierstdlist.notifyListeners();
}

Future<void> delete(int id) async {
  final stddatabase = await Hive.openBox<StdModal>('std_database');
  await stddatabase.delete(id);
  getStudents();
}

Future<void> editdata(int id, StdModal value) async {
  final stddatabase = await Hive.openBox<StdModal>('std_database');
  await stddatabase.put(id, value);
  getStudents();
}