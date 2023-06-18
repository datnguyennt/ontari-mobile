import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../core/common/logger.dart';

@singleton
class FirebaseDataBase with LogMixin {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseDataBase();

  Future<CollectionReference> _getCollection(String collectionName) async {
    return _firestore.collection(collectionName);
  }

  Future<DocumentReference> _getDocumentRefrence({
    required String collectionName,
    required String docId,
  }) async {
    final CollectionReference collection = await _getCollection(collectionName);
    return collection.doc(docId);
  }

  Future<DocumentSnapshot> _getDocumentSnapshot({
    required String collectionName,
    required String docId,
  }) async {
    final CollectionReference collection = await _getCollection(collectionName);
    return await collection.doc(docId).get();
  }

  Future<void> addDocument({
    required String collectionName,
    required Map<String, dynamic> data,
  }) async {
    final CollectionReference collection = await _getCollection(collectionName);
    try {
      await collection.add(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> getAllDocument({
    required String collectionName,
  }) async {
    try {
      final CollectionReference collection =
          await _getCollection(collectionName);
      final QuerySnapshot query = await collection.get();
      for (DocumentSnapshot snapshot in query.docs) {
        debugPrint(snapshot.data().toString());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>> getDataDocument({
    required String collectionName,
    required String id,
  }) async {
    try {
      final DocumentSnapshot snapshot = await _getDocumentSnapshot(
        collectionName: collectionName,
        docId: id,
      );
      debugPrint(snapshot.data().toString());

      return snapshot.data() as Map<String, dynamic>;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateDocument({
    required String collectionName,
    required String id,
    required Map<String, dynamic> dataUpdate,
  }) async {
    try {
      final DocumentReference doc = await _getDocumentRefrence(
        collectionName: collectionName,
        docId: id,
      );
      await doc.update(dataUpdate);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> deleteDocument({
    required String collectionName,
    required String id,
  }) async {
    try {
      final DocumentReference doc = await _getDocumentRefrence(
        collectionName: collectionName,
        docId: id,
      );
      await doc.delete();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> setDocument({
    required String collectionName,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    try {
      final CollectionReference collection =
          await _getCollection(collectionName);
      await collection.doc(id).set(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
