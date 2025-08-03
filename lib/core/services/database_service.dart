abstract class DatabaseService{

  // path represents the collection name or endpoint of an ApiS
  Future<void> addData({required String path, required Map<String,dynamic> data, String? docId});
  Future<Map<String, dynamic>> getData({required String path, required String docId});
  Future<bool> checkIfDataExists({required String path, required String docId});
}