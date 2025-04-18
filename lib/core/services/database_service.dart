abstract class DatabaseService {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId});

  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId});

  Future<bool> isDataExist({required String path, required String documentId});
}
