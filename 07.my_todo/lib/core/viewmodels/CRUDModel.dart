import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_todo/core/models/records.dart';
import 'package:my_todo/core/services/api.dart';
import 'package:my_todo/locator.dart';

class CRUDModel extends ChangeNotifier {
  Api _api = locator<Api>();

  List<Records> records;

  Future<List<Records>> fetchProducts() async {
    var result = await _api.getDataCollection();
    records = result.documents
        .map((doc) => Records.fromMap(doc.data, doc.documentID))
        .toList();
    return records;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Records> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return Records.fromMap(doc.data, doc.documentID);
  }

  Future removeProduct(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future updateProduct(Records data, String id) async {
    await _api.updateDocument(data.toJson(), id);
    return;
  }

  Future addProduct(Records data) async {
    await _api.addDocument(data.toJson());
    return;
  }

  CollectionReference getCollectionReference() {
    return _api.ref;
  }
}
