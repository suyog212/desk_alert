import 'package:desk_alert/utils/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  if(user != null){
    data();
  }
  runApp(const MyApp());
}
final user = FirebaseAuth.instance.currentUser;
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
      ],
      builder: (context,child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Desk Alert 2.0',
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          themeMode: themeProvider.themeMode,
          // home: Constants.user != null ? HomeScreen() : SignUp(),
          home: AuthState(),
        );
      },
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          const ListTile(
            title: Text("Dark Theme"),
            leading: Icon(Icons.nights_stay),
            trailing: ToggleButton(),
          ),
          ListTile(
            title: Text("Edit Information"),
            leading: Icon(Icons.person),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const SetUserInfo()));
            },
            // trailing: Icon(Icons.edit),
          )
        ],
      ),
    );
  }
}


class ToggleButton extends StatelessWidget {
  const ToggleButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(value: themeProvider.isdarkMode, onChanged: (value){
      final provider = Provider.of<ThemeProvider>(context,listen: false);
      provider.toggleTheme(value);
    });
  }
}

