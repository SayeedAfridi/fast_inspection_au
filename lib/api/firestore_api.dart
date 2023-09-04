import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_inspection/app/app.logger.dart';
import 'package:fast_inspection/exceptions/firestore_api_exception.dart';
import 'package:fast_inspection/models/app_models.dart';

class FirestoreApi {
  final log = getLogger('FirestoreApi');
  late FirebaseFirestore _db;
  late CollectionReference _usersCollectionRef;

  Future<void> init() async {
    _db = FirebaseFirestore.instance;
    _usersCollectionRef = _db.collection('users');
  }

  Future<void> createUser(User user) async {
    log.i('creating user: $user');
    try {
      final userDocument = _usersCollectionRef.doc(user.id);
      await userDocument.set(user.toJson());
      log.v('user created at ${userDocument.path}');
    } catch (error) {
      throw FirestoreApiException(
        message: 'Error creating user',
        devDetails: '$error',
      );
    }
  }

  Future<User?> getUser(String userId) async {
    log.i('userId: $userId');

    if (userId.isNotEmpty) {
      final userDoc = await _usersCollectionRef.doc(userId).get();
      if (!userDoc.exists) {
        log.i('no user found with the id: $userId');
        return null;
      }
      final userData = userDoc.data() as Map<String, Object?>;
      return User.fromJson(userData);
    } else {
      throw FirestoreApiException(message: 'Userid is empty!');
    }
  }
}
