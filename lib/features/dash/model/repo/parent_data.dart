abstract class MyParentData {
  Future<void> insert({required String name, String? address});
  Future<List> fetch();
  Future<void> delete({required int id});
}
