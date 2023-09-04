import 'package:desk_alert/screens/splash.dart';
import 'package:desk_alert/utils/routes.dart';

class AuthState extends StatelessWidget {
  const AuthState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          try{
            if(snapshot.connectionState ==ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            }
            else if(snapshot.hasData){
              return const Splash();
            }
            else if(snapshot.hasError){
              return const Center(child: Text("Something went wrong"),);
            }
            else{
              return const SignUp();
            }
          }
          catch(e){
            return Center(child: Text(e.toString()),);
          }
        },
      ),
    );
  }
}
