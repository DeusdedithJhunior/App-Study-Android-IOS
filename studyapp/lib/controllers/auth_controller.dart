import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:studyapp/components/dialogs/dialogue_widget.dart';
import 'package:studyapp/firebase_ref/references.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;
  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  // metodo que vai iniciar "na tela de abertura" do app
  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });
    navigateToIntroduction();
  }

  // login com google
  singInWithGoogle() async {
    final GoogleSignIn _googleSingIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googleSingIn.signIn();
      if (account != null) {
        final _authAccount = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
            idToken: _authAccount.idToken,
            accessToken: _authAccount.accessToken);

        await _auth.signInWithCredential(_credential);
        await saveUser(account);
      }
    } on Exception catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  saveUser(GoogleSignInAccount account) {
    userRF.doc(account.email).set({
      'email': account.email,
      'name': account.displayName,
      'profilepic': account.photoUrl
    });
  }

  // metodo que vai nagevar para pagina de introdução do app
  void navigateToIntroduction() {
    Get.offAllNamed('/appintroduction');
  }

  void showLoginAlertDialogue() {
    Get.dialog(Dialogs.questionStartDialogue(onTap: () {
      Get.back();
      // NavigateToLoginPage
    }), barrierDismissible: false);
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }
}
