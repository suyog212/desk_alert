import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desk_alert/utils/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Constants{
  // final user = FirebaseAuth.instance.currentUser;
  // String name = Constants.firstName == null ? " " : Constants.firstName!;

  static var firstName = user?.displayName;
  static var programme;
  static var rollNo;
  static var addmYear;
  static var lastName = "Bhoye";
  static var middleName = "Bhaskar";
  static var accCreationTime = user?.metadata.creationTime;
  static var phoneNumber = user?.phoneNumber;
  static var uid = user?.uid;
  static var photoUrl = user?.photoURL;
  static DateTime? lastSignIn = user?.metadata.lastSignInTime ?? DateTime(DateTime.now().hour);
  static var email = user?.email;
  // static List? fullName = [];
  // void getData() async {
  //   var collection = FirebaseFirestore.instance.collection(programme);
  //   var querySnapshot = await collection.get();
  //   for (var queryDocumentSnapshot in querySnapshot.docs) {
  //     Map<String, dynamic> data = queryDocumentSnapshot.data();
  //     var name = data['name'];
  //     var phone = data['phone'];
  //   }
  // }

}
void data() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  Constants.addmYear = pref.getString("AdmissionDate")!;
  Constants.rollNo = pref.getString("rollNo")!;
  Constants.programme = pref.getString("branch")!;
}