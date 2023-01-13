import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class Dbase{
  static final String dbName = "todo.sqlite";

  static Future<Database> accessDatabase() async{
      String dbPath = join(await getDatabasesPath(),dbName);
      if(await databaseExists(dbPath)){
        print("Database has already been created.");
      }else{
        ByteData data = await rootBundle.load("db/$dbName");
        List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
        await File(dbPath).writeAsBytes(bytes,flush: true);
        print("Data base has been copied");
      }
      return openDatabase(dbPath);
  }
}