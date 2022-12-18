import 'package:firebase_auth/firebase_auth.dart';
import 'package:universal_io/io.dart';

void register(String email, String password) async {
  try {
    final credentials = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    credentials.user!.getIdToken(false).then((value) => print(value));
    await FirebaseAuth.instance
        .setLanguageCode(Platform.localeName.substring(0, 2));
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
