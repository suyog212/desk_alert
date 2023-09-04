import '../utils/routes.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin(context) async{
      try{
        final googleUser = await googleSignIn.signIn();
        if(googleUser!= null){
          _user = googleUser;
        }
        else{
          return Container(color: Colors.grey,child: const Text("Sign in canceled"),);
        }

        final googleAuth = await googleUser?.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
      } on PlatformException catch(e){
        return Center(child: Text(e.toString()),);
      }
      notifyListeners();
  }

  Future logOut() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}