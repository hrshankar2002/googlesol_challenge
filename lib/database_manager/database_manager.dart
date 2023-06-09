import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  CollectionReference profileList =
      FirebaseFirestore.instance.collection('profileInfo');

  Future<void> createUserData(String name, String product, String amount,
      String uid, String imageUrl) async {
    await profileList.doc(uid).set({
      'name': name,
      'amount': amount,
      'product': product,
      'imageurl': imageUrl
    });
  }

  Future getUsersList() async {
    List itemsList = [];
    try {
      await profileList
          .get()
          .then((QuerySnapshot) => QuerySnapshot.docs.forEach((element) {
                itemsList.add(element.data());
              }));
      return itemsList;
    } catch (e) {
      //return null;
    }
  }

  Future updateUserList(String name, String product, String amount, String uid,
      String imageUrl) async {
    return await profileList.doc(uid).update({
      'name': name,
      'amount': amount,
      'product': product,
      'imageurl': imageUrl
    });
  }

  Future updateUrl(String uid, String imageUrl) async {
    return await profileList.doc(uid).update({'imageurl': imageUrl});
  }
}
