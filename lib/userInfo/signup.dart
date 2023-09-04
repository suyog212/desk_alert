import 'package:desk_alert/userInfo/signIn_provider.dart';
import 'package:desk_alert/utils/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Sign Up",style: TextStyle(
          fontSize: 25,
          color: MediaQuery.of(context).platformBrightness ==
              Brightness.dark
              ? Colors.white
              : Colors.black
        ),),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        // padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              // height: 500,
                child: Image.asset("assets/Images/bgIMG.png",
                  fit: BoxFit.cover,
                  scale: 1.5,
                ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 200,
              decoration: const BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text("Sign Up with google"),
                  ElevatedButton.icon(
                    onPressed: (){
                      final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                        provider.googleLogin(context);
                        if(user != null){
                         // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const HomeScreen()));
                        }
                    }, icon: const FaIcon(FontAwesomeIcons.google),
                    label: const Text("Sign in with Google"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        minimumSize: const Size(double.infinity,50),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
