import 'package:fast_inspection/api/firestore_api.dart';
import 'package:fast_inspection/app/app.locator.dart';
import 'package:fast_inspection/app/app.logger.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart' as stk_auth;
import 'package:fast_inspection/models/app_models.dart';

class UserService {
  final log = getLogger('UserService');
  final _firestoreApi = locator<FirestoreApi>();
  final _authServie = locator<stk_auth.FirebaseAuthenticationService>();

  User? _currentUser;
  User? get currentUser => _currentUser;
  bool get hasUser => _authServie.hasUser;

  Future<void> syncUserAccount() async {
    final firebaseUserId = _authServie.firebaseAuth.currentUser!.uid;

    log.v('sync user $firebaseUserId}');
    final userAccount = await _firestoreApi.getUser(firebaseUserId);

    if (userAccount != null) {
      log.v('User account exists. saving as currentUser');
      _currentUser = userAccount;
    }
  }

  Future<void> syncOrCreateUserAccount(User user) async {
    log.v('user: $user');
    await syncUserAccount();
    if (_currentUser == null) {
      log.v('No user account exists. creating new user account');
      await _firestoreApi.createUser(user);
      _currentUser = user;
      log.v('current user has been saved');
    }
  }
}
