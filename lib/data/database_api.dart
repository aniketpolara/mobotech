import 'package:firebase_database/firebase_database.dart';
import 'package:moboshop/data/database_class.dart';

class UserRegApi {
  static DatabaseReference db = FirebaseDatabase.instance.ref("user");

  static Future<void> addData({
    required Mobotech ur,
  }) async {
    //String? key1 = db.ref().child("user").push().key;
    String key = DateTime.now().millisecondsSinceEpoch.toString();
    //String key = ur.imeiNum.toString();
    await db.child(key).set({
      'name': ur.name,
      'colour': ur.colour,
      'condition': ur.condition,
      'customer': ur.customer,
      'date': ur.date,
      'email': ur.email,
      'imeiNum': ur.imeiNum,
      'issue': ur.issue,
      'mob': ur.mob,
      'productModel': ur.productModel,
      'productType': ur.productType,
      'price': ur.price,
      'estimate': ur.estimate,
      'paymentType': ur.paymentType,
      'serialNumber': ur.serialNumber,
      'shopname': ur.shopname,
      'warrenty': ur.warrenty
    });
  }

  static Future<List<Mobotech>> getData() async {
    userDataList.clear();
    final data = await db.once();
    Map userData = data.snapshot.value as Map;
    userData.forEach((key, value) {
      userDataList.add(Mobotech(
          key: key,
          name: value["name"],
          colour: value["colour"],
          condition: value["condition"],
          customer: value["customer"],
          date: value["date"],
          email: value["email"],
          imeiNum: value["imeiNum"],
          issue: value["issue"],
          mob: value["mob"],
          productModel: value["productModel"],
          productType: value["productType"],
          serialNumber: value["serialNumber"],
          shopname: value["shopname"],
          warrenty: value["warrenty"],
          estimate: value["estimate"],
          paymentType: value["paymentType"],
          price: value["price"]));
    });
    return userDataList;
  }

  static Future<void> updateData({
    required Mobotech ur,
  }) async {
    //String? key1 = db.ref().child("user").push().key;
    await db.child(ur.key!).update({
      'name': ur.name,
      'colour': ur.colour,
      'condition': ur.condition,
      'customer': ur.customer,
      'date': ur.date,
      'email': ur.email,
      'imeiNum': ur.imeiNum,
      'issue': ur.issue,
      'mob': ur.mob,
      'productModel': ur.productModel,
      'productType': ur.productType,
      'price': ur.price,
      'estimate': ur.estimate,
      'paymentType': ur.paymentType,
      'serialNumber': ur.serialNumber,
      'shopname': ur.shopname,
      'warrenty': ur.warrenty
    });
  }

  static Future<void> deleteData({
    required String key,
  }) async {
    //String? key1 = db.ref().child("user").push().key;
    await db.child(key).remove();
  }
}
