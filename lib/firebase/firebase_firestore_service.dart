import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseFireStoreService {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  // add data
  static Future<void> addData({
    required String tableName,
    required Map<String, dynamic> data,
  }) async {
    final reference = firestore.collection(tableName);
    await reference.add(data).then((value) => print(value.id));
  }

  static Future<void> updateData({
    required String tableName,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    final reference = firestore.collection(tableName);
    await reference.doc(id).update(data);
  }

  static Future<void> deleteData({
    required String tableName,
    required String id,
  }) async {
    final reference = firestore.collection(tableName);
    await reference.doc(id).delete();
  }

  static Future<T> getDocData<T>({
    required String tableName,
    required String id,
  }) async {
    final reference = firestore.collection(tableName);
    print(reference.get());
    return reference.doc(id).get().then((value) => value.data() as T);
  }

  static Future<List<T>> getDocsData<T>({
    required String tableName,
    required String field,
    required String value,
  }) async {
    final reference = firestore.collection(tableName);
    final snapshot = await reference.where(field, isEqualTo: value).get();
    return snapshot.docs.map((e) => e.data() as T).toList();
  }
  // get one doc

  static Future<T?> getOneDocData<T>({
    required String tableName,
    required String field,
    required String value,
  }) async {
    final reference = firestore.collection(tableName);
    final snapshot = await reference.where(field, isEqualTo: value).get();
    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.first.data() as T;
    }
    return null;
  }
}
