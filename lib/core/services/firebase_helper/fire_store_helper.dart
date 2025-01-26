  import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  static final FireStoreService _instance = FireStoreService._internal();
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  factory FireStoreService() {
    return _instance;
  }

  FireStoreService._internal();

  FirebaseFirestore get fireStore => _fireStore;
}