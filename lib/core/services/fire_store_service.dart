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
  Future<dynamic> getData({required String path,  String? docId, Map<String,dynamic>? query}) async{
    if (docId!=null) {
      DocumentSnapshot doc = await firebaseFireStore.collection(path).doc(docId).get();
      return doc.data() as Map<String,dynamic>;
    }else{
      Query<Map<String, dynamic>> data = firebaseFireStore.collection(path);
      if(query != null){
        if(query['orderBy'] != null){
          var orderByField = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderByField, descending: descending);
        }

        if(query['limit'] != null){
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
      QuerySnapshot<Map<String, dynamic>> result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Stream<List<Map<String, dynamic>>> getStreamData({required String path, Map<String, dynamic>? query}) async*{
    Query<Map<String, dynamic>> data = firebaseFireStore.collection(path);
    if(query != null){
      if(query['orderBy'] != null){
        var orderByField = query['orderBy'];
        var descending = query['descending'];
        data = data.orderBy(orderByField, descending: descending);
      }

      if(query['limit'] != null){
        var limit = query['limit'];
        data = data.limit(limit);
      }
    }
    await for(var result in data.snapshots()){
      yield result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> checkIfDataExists({required String path, required String docId}) async{
    var data = await firebaseFireStore.collection(path).doc(docId).get();
    return data.exists;
  }

}