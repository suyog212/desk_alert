import 'package:desk_alert/main.dart';
import 'package:desk_alert/screens/chat.dart';
import 'package:desk_alert/utils/routes.dart';

class HamMenu extends StatefulWidget {
  const HamMenu({Key? key}) : super(key: key);

  @override
  State<HamMenu> createState() => _HamMenuState();
}

class _HamMenuState extends State<HamMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(Constants.firstName!),
            accountEmail: Text(Constants.email!),
            arrowColor: Colors.black,
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(Constants.photoUrl!),
            ),
          ),
          ListTile(
            title: Text("Discussions"),
            onTap: (){
              // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyHomePage(title: "Chat Page")));
            },
          ),
          ListTile(
            title: Text("Settings"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>  Settings()));
            },
          ),
          ListTile(
            title: Text("Edit User Info"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>  SetUserInfo()));
            },
          ),
          ListTile(
            title: Text("Log Out"),
            onTap: (){
              final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
              provider.logOut();
            },
          )
        ],
      ),

    );
  }
}
