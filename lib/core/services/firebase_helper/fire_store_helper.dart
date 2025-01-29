  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:injectable/injectable.dart';
  @singleton
  @injectable
class FireStoreService {
  static final FireStoreService _instance = FireStoreService._internal();
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
  factory FireStoreService() {
    return _instance;
  }

  FireStoreService._internal();
initFirebaseDatabase() {
    // _firebaseDatabase.setPersistenceEnabled(true);
    // _firebaseDatabase.setPersistenceCacheSizeBytes(10000000);
    // _firebaseDatabase.databaseURL = "https://flowery-app-78949-default-rtdb.firebaseio.com/";
    // _firebaseDatabase.setLoggingEnabled(true);
    // _firebaseDatabase.goOnline();
  }
  FirebaseFirestore get fireStore => _fireStore;
  FirebaseDatabase get firebaseDatabase => _firebaseDatabase;
}