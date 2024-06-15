import 'package:cloud_firestore/cloud_firestore.dart';

class Advertisement {
  final List<String> images;

  Advertisement({required this.images});

  factory Advertisement.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Advertisement(
      images: List<String>.from(data['images'] ?? []),
    );
  }
}