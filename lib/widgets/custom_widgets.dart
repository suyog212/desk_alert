import 'package:desk_alert/utils/routes.dart';
import 'package:intl/intl.dart';

Widget userInfoWidget(Color bgcolor, double height, double width) {
  String name = Constants.firstName == null ? " " : Constants.firstName!;
  DateTime lastSignIn = Constants.lastSignIn == null ? DateTime.now() : Constants.lastSignIn!;
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    decoration: BoxDecoration(
      color: bgcolor,
      borderRadius: BorderRadius.circular(20),
    ),
    height: height,
    width: width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          greetingMessage(),
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        ),
        Text("Last SignIn on : ${DateFormat('jm').format(lastSignIn)}"),
      ],
    ),
  );
}

Widget iconButton(icon, ontap, context) {
  return IconButton(
    onPressed: ontap,
    icon: icon,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    focusColor: Colors.transparent,
    highlightColor: Colors.transparent,
    // color: MediaQuery.of(context).platformBrightness == Brightness.light ? Colors.black : Colors.black,
  );
}

Widget inputField(String hinttext,
    TextEditingController controller, bool isPass, TextInputType kbType) {
  return TextField(
    decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
        hintText: hinttext,
        border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
        prefixIconColor: Colors.grey),
    style: const TextStyle(
      fontSize: 18,
    ),
    cursorColor: Colors.black,
    controller: controller,
    obscureText: isPass,
    keyboardType: kbType,

  );
}

Widget submitButton(onTap) {
  return ElevatedButton(
      onPressed: onTap,
      child: const Text("Submit"),
    // statesController: MaterialStatesController(),
  );
}

Widget notificationWidget(){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
    height: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.grey,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("8:45 PM"),
          ],
        ),
        Text("This is a notification pls read it carefully \n This part is not that important")
      ],
    ),
  );
}