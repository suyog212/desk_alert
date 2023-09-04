import 'package:desk_alert/utils/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      // backgroundColor: Colors.grey,
      drawer: const HamMenu(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "DeskAlert",
          style: TextStyle(
              color: themeProvider.themeMode == ThemeMode.dark ? Colors.white : Colors.black,
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return iconButton(
                Iconify(Ri.menu_2_fill,
                    color: themeProvider.themeMode == ThemeMode.dark ? Colors.white : Colors.black), () {
              Scaffold.of(context).openDrawer();
            }, context);
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              userInfoWidget(Colors.transparent, 100, MediaQuery.of(context).size.width),
              ListTile(
                title: const Text("Events"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AppEvents()));
                },
              ),
              Text(Constants.addmYear),
              Text(Constants.rollNo),
              Text(Constants.programme),
            ],
          ),
        ),
      ),
    );
  }
}
