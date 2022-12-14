import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:studyapp/components/dialogs/dialogue_widget.dart';
import 'package:studyapp/firebase_ref/references.dart';
import 'package:studyapp/screens/home/home_screen.dart';
import 'package:studyapp/screens/login/login_screen.dart';

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
    // ignore: no_leading_underscores_for_local_identifiers
    final GoogleSignIn _googleSingIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googleSingIn.signIn();
      if (account != null) {
        // ignore: no_leading_underscores_for_local_identifiers
        final _authAccount = await account.authentication;
        // ignore: no_leading_underscores_for_local_identifiers
        final _credential = GoogleAuthProvider.credential(
            idToken: _authAccount.idToken,
            accessToken: _authAccount.accessToken);

        await _auth.signInWithCredential(_credential);
        await saveUser(account);
        navigateToHomePage();
      }
    } on Exception catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  User? getUser() {
    _user.value = _auth.currentUser;
    return _user.value;
  }

  // metodo que salva o usuario
  saveUser(GoogleSignInAccount account) {
    userRF.doc(account.email).set({
      'email': account.email,
      'name': account.displayName,
      'profilepic': account.photoUrl
    });
  }



//  metodo que sai da aplica????o
  Future<void> signOut() async {
    await _auth.signOut();
    navigateToHomePage();
  }

  // metodo que vai nagevar para pagina de introdu????o do app
  void navigateToIntroduction() {
    Get.offAllNamed('/appintroduction');
  }

  void navigateToHomePage() {
    Get.offAllNamed(HomeScreen.routeName);
  }

  void showLoginAlertDialogue() {
    Get.dialog(Dialogs.questionStartDialogue(onTap: () {
      Get.back();
      NavigateToLoginPage();
    }), barrierDismissible: false);
  }

  // ignore: non_constant_identifier_names
  void NavigateToLoginPage() {
    Get.toNamed(LoginScreen.routeName);
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }
}
