import 'dart:ui';

import 'package:hive/hive.dart';

class HiveController<T> {
  final String boxName;

  HiveController(this.boxName);

  Future<void> add(int id, T obj) async {
    late Box box;
    try {
      box = await Hive.openBox<T>(boxName);
      await box.put(id, obj);
    } catch (e) {
      print(e);
    } finally {
      await box.close();
    }
  }

  Future<List<T>> readList() async {
    late Box box;
    late List<T> items;
    try {
      box = await Hive.openBox<T>(boxName);
      items = box.values.toList() as List<T>;
    } catch (e) {
      print(e);
    } finally {
      await box.close();
    }
    return items;
  }

  Future<T> readOne() async {
    late Box box;
    late T item;
    try {
      box = await Hive.openBox<T>(boxName);
      item = box.values.toList()[0];
    } catch (e) {
      print(e);
    } finally {
      await box.close();
    }

    return item;
  }

  Future<void> delete({int? index, T? obj}) async {
    late Box box;
    try {
      box = await Hive.openBox<T>(boxName);
      if (index != null) {
        await box.deleteAt(index);
      } else {
        await box.delete(obj);
      }
    } catch (e) {
      print(e);
    } finally {
      await box.close();
    }
  }

  Future<void> update({
    required int key,
    required T obj,
    required VoidCallback save,
  }) async {
    late Box box;
    try {
      box = await Hive.openBox<T>(boxName);
      await box.put(key, obj);
    } catch (e) {
      print(e);
    } finally {
      save();
      await box.close();
    }
  }

  Future<void> clear() async {
    late Box box;
    try {
      box = await Hive.openBox<T>(boxName);

      await box.clear();
    } catch (e) {
      print(e);
    } finally {
      await box.close();
    }
  }
}
