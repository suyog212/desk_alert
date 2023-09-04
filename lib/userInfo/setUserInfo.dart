import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desk_alert/utils/routes.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetUserInfo extends StatefulWidget {
  const SetUserInfo({Key? key}) : super(key: key);

  @override
  State<SetUserInfo> createState() => _SetUserInfoState();
}

class _SetUserInfoState extends State<SetUserInfo> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _middleName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _rollNo = TextEditingController();
  final TextEditingController _AddDate = TextEditingController();
  final storemessages = FirebaseFirestore.instance;
  DateTime AddmissonDate2 = DateTime.now();
  DateTime AddmissonDate = DateTime.now();
  datePicker (BuildContext context) async {
    final DateTime? timeOfDay = await showDatePicker(
      context: context,
      initialDate: AddmissonDate2,
      confirmText: "Ok", firstDate: DateTime(2000), lastDate: DateTime.now(),
      // initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null) {
      setState(() {
        AddmissonDate = AddmissonDate2;
        // DateFormat("jm").format();
      });
    }
  }

  String selectedValue = "Computer Technology";
  List<String> pragrammes = [
    "Computer Technology",
    "Information Technology",
    "Polymer Engineering",
    "Mechanical Engineering",
    "Mechanical Engineering 2",
    "Civil Engineering",
    "Civil Engineering 2",
    "Mechatronics Engineering",
    "Automobile Engineering",
    "Electronics and telecommunication",
    "Electronics and telecommunication 2",
    "Electrical Engineering",
    "Interior Design and Decoration",
    "Dress Design and Manufacturing",
  ];
  double safeSpace = 10;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: themeProvider.themeMode == ThemeMode.dark
              ? Colors.white
              : Colors.black,
        ),
        title: Text(
          "User Info",
          style: TextStyle(
            color: themeProvider.themeMode == ThemeMode.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        key: formKey,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    hintText: "ex.Pablo .....",
                    border: OutlineInputBorder(),
                    fillColor: Colors.grey,
                    labelText: "First Name",
                  ),
                  keyboardType: TextInputType.text,
                  controller: _firstName,
                  // autofocus: true,
                ),
                SizedBox(
                  height: safeSpace,
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: "ex......",
                    border: OutlineInputBorder(),
                    fillColor: Colors.grey,
                    // label: Text("Name"),
                    labelText: "Middle Name",
                  ),
                  keyboardType: TextInputType.text,
                  controller: _middleName,
                ),
                SizedBox(
                  height: safeSpace,
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: "ex.Escobar .....",
                    border: OutlineInputBorder(),
                    fillColor: Colors.grey,
                    // label: Text("Name"),
                    labelText: "Last Name",
                  ),
                  keyboardType: TextInputType.text,
                  controller: _lastName,
                ),
                SizedBox(
                  height: safeSpace,
                ),
                IntlPhoneField(
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  initialCountryCode: 'IN',
                  controller: _phoneNumber,
                  showCountryFlag: false,
                ),
                SizedBox(
                  height: safeSpace,
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: "ex. 176155",
                    border: OutlineInputBorder(),
                    fillColor: Colors.grey,
                    // label: Text("Name"),
                    labelText: "Enrollment No.",
                  ),
                  keyboardType: TextInputType.number,
                  controller: _rollNo,
                  maxLength: 6,
                ),
                SizedBox(
                  height: safeSpace,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: TextField(
                      decoration: InputDecoration(
                        enabled: true,
                        border: const OutlineInputBorder(),
                        disabledBorder: const OutlineInputBorder(),
                        fillColor: Colors.grey,
                        label: Text("$AddmissonDate2"),
                      ),
                      // keyboardType: TextInputType.number,
                      controller: _AddDate,
                      keyboardType: TextInputType.datetime,
                      enabled: true,
                      maxLength: 6,
                    ),),
                    IconButton(onPressed: () async{
                      datePicker(context);
                    }, icon: const Icon(Icons.calendar_today))
                  ],
                ),
                SizedBox(
                  height: safeSpace,
                ),
                DropdownButtonFormField(
                  items: pragrammes.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  value: selectedValue,
                  onChanged: (String? newvalue) {
                    setState(() {
                      selectedValue = newvalue!;
                    });
                  },
                  decoration: const InputDecoration(
                      hoverColor: Colors.transparent,
                      border: OutlineInputBorder(),
                      labelText: "Programme",
                      contentPadding: EdgeInsets.symmetric(horizontal: 15)),
                  focusColor: Colors.transparent,
                ),
                SizedBox(
                  height: safeSpace,
                ),
                ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    if(_phoneNumber.text != null &&_firstName.text != null &&_middleName.text != null &&_lastName.text != null &&_rollNo.text != null){
                      if (formKey.currentState != null) {
                        storemessages
                            .collection(selectedValue)
                            .doc(user!.uid)
                            .set({
                          "firstName ": _firstName.text.trim(),
                          "middleName ": _middleName.text.trim(),
                          "lastName ": _lastName.text.trim(),
                          "phoneNumber ": _phoneNumber.text.trim(),
                          "AddmissonDate ": AddmissonDate,
                          "branch ": selectedValue,
                          "Roll No": _rollNo.text,
                          "fullName ":
                              _firstName.text.trim() + _middleName.text.trim() + _lastName.text.trim(),
                        });
                        prefs.setString("AdmissionDate", AddmissonDate.toString());
                        prefs.setString("rollNo", AddmissonDate.toString());
                        prefs.setString("branch", AddmissonDate.toString());
                        _phoneNumber.clear();
                        _firstName.clear();
                        _middleName.clear();
                        _lastName.clear();
                        _rollNo.clear();
                        // Addyear = DateTime(DateTime.now().year)
                        // Timer(const Duration(seconds: 5), () {
                        //   Navigator.pushReplacement(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (BuildContext context) =>
                        //               const HomeScreen()));
                        // });
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 55),
                  ),
                  child: const Text("Submit"),
                ),
                SizedBox(height: safeSpace,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
