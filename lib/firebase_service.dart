// firebase_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Adds an email to the 'emails' collection with a timestamp
  Future<void> addEmail(String email) async {
    try {
      await _firestore.collection('emails').add({
        'email': email,
        'created_at': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error adding email: $e');
      rethrow;
    }
  }
}
