import 'package:desk_alert/utils/routes.dart';

class AppEvents extends StatefulWidget {
  const AppEvents({Key? key}) : super(key: key);

  @override
  State<AppEvents> createState() => _AppEventsState();
}

class _AppEventsState extends State<AppEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.purple
        ),
        child: Column(
          children: [
            notificationWidget(),
          ],
        ),
      ),
    );
  }
}
