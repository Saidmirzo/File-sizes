import 'dart:io';
import 'package:filesize/filesize.dart';

void main(List<String> args) {
  GetFolderSize get = GetFolderSize();
  // get.getFolderContents("D:/Saidmirzo/dart/Algoritms");
  // get.sortMap();
  get.start();
}

class GetFolderSize {
  int sizeFolder = 0;

  Map<String, int> listMap =
      {}; //Shu map ichida folder ichiudagi barcha file lar ro'yxati va o'lchami bor
  List<int> value = [];
  List<String> key = [];
//----------------------------------------------------------------------------------
  start() {
    print("File yo'lini kiriting: ");
    String yol = stdin.readLineSync()!;

    getFolderContents(yol);
    printMap();
    sortMap();
  }

  getFolderContents(String path) {
    final dir = Directory(path);
    final List<FileSystemEntity> entities = dir.listSync().toList();
    entities.forEach((element) {
      if (element is File) {
        listMap[element.toString()] =
            int.parse(element.lengthSync().toString());
        sizeFolder += element.lengthSync();
        // print(element.lengthSync());
      } else {
        if (element is Directory) {
          // print(element.toString().exchange());

          getFolderContents(
              element.toString().replaceAll("\\", "/").split("'")[1]);
        }
      }
    });
  }

  sortMap() {
    value = listMap.values.toList();
    key = listMap.keys.toList();
    for (int i = 0; i < value.length; i++) {
      for (int j = i + 1; j < value.length; j++) {
        if (value[i] < value[j]) {
          value = swap(value, i, j);
          key = swap(key, i, j);
        }
      }
    }
    for (int i = 0; i < key.length; i++) {
      listMap[key[i]] = value[i];
    }
    printMap();
  }

  void printMap() {
    value = listMap.values.toList();
    key = listMap.keys.toList();
    for (int i = 0; i < key.length; i++) {
      print(
          "📄${key[i].split("'")[1].replaceAll("\\", "/").split("/").last}   --> ${filesize(value[i])}");
    }
  }

  swap(List list, int a, int b) {
    var c = list[a];
    list[a] = list[b];
    list[b] = c;
    return list;
  }
}
