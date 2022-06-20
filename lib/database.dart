import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fire_flutter/screens/addtask.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection =
    _firestore.collection('flutterfire');

class Database {
  static Future<void> addItems(
      {required String title,
      required String description,
      required String date}) async {
    DocumentReference documentReference = _mainCollection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      'title': title,
      'description': description,
      'date': date,
      'docId': documentReference.id,
    };

    await documentReference
        .set(data)
        .whenComplete(() => print('Tasks item added to database'))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    required String title,
    required String description,
    required String date,
    required String idVal
  }) async {
    DocumentReference documentReference = _mainCollection.doc(idVal);

    Map<String, dynamic> data = <String, dynamic>{
      'title': title,
      'description': description,
      'date': date
    };

    await documentReference
        .update(data)
        .whenComplete(() => print('Tasks item updated to database'))
        .catchError((e) => print(e));
  }

  static Future<void> deleteItem({required String docId}) async {
    DocumentReference documentReference = _mainCollection.doc(docId);

    await documentReference
        .delete()
        .whenComplete(() => print('Tasks item deleted to database'))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference taskmainCollection =
        _firestore.collection('flutterfire');

    return taskmainCollection.snapshots();
  }
}




