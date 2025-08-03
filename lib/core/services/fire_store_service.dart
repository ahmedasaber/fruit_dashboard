import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_dashboard/core/services/database_service.dart';


class FireStoreService implements DatabaseService{
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  @override
  Future<void> addData({required String path, required Map<String, dynamic> data, String? docId}) async{
    if (docId != null) {
      await firebaseFireStore.collection(path).doc(docId).set(data);
    }else{
      await firebaseFireStore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData({required String path, required String docId}) async{
    DocumentSnapshot user = await firebaseFireStore.collection(path).doc(docId).get();
    return user.data() as Map<String,dynamic>;
  }

  @override
  Future<bool> checkIfDataExists({required String path, required String docId}) async{
    var data = await firebaseFireStore.collection(path).doc(docId).get();
    return data.exists;
  }

}