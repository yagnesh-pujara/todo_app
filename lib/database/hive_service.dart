import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/models/todo_model.dart';

class HiveService {
  static final HiveService _instance = HiveService._internal();
  factory HiveService() => _instance;
  HiveService._internal();

  late Box<TodoModel> _box;

  //  Initialize Hive
  Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(TodoModelAdapter());

    _box = await Hive.openBox<TodoModel>('myDbBox');
  }

  //  Check if Key Exists
  bool containsKey(String key) {
    return _box.containsKey(key);
  }

  //  Clear All Data
  Future<void> clearData() async {
    await _box.clear();
  }

  //  Close Hive
  Future<void> close() async {
    await _box.close();
  }

  //  Add Data
  Future<void> addTodo(TodoModel todo) async {
    await _box.add(todo);
  }

  //  Update Data
  Future<void> updateTodo(int index, TodoModel updatedTodo) async {
    await _box.putAt(index, updatedTodo);
  }

  //  Delete Data
  Future<void> deleteTodo(int index) async {
    await _box.deleteAt(index);
  }

  //  Select Data
  List<TodoModel> getAll() {
    return _box.values.toList();
  }
}
