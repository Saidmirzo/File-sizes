import 'dart:io';
import 'dart:math';
import 'package:filesize/filesize.dart';
import 'package:test/test.dart';

class FileSize {
  start() async {
    print("Assalomu alaykum dasturimizga xuhs kelibsiz!");
    print("Sizga kerakli file yo'lini korsating: ");
    String filePath = stdin.readLineSync()!;
    printFolders(filePath);
    // printFolders("D:/Saidmirzo/dart/Algoritms");
    // await Future.delayed(Duration(seconds: 5));
    // print(listMap);
  }

  Future<int> getFolderSize() async {
    int sizeFolder = 0;
    Map<String, String> listMap =
        {}; //Shu map ichida folder ichiudagi barcha file lar ro'yxati va o'lchami bor
//----------------------------------------------------------------------------------
    getFolderContents(String path) async {
      final dir = Directory(path);
      final List<FileSystemEntity> entities = await dir.list().toList();
      entities.forEach((element) {
        if (element is File) {
          listMap[element.toString()] = element.lengthSync().toString();
          sizeFolder += element.lengthSync();
          // print(element.lengthSync());
        } else {
          if (element is Directory) {
            // print(element.toString().exchange());

            getFolderContents(element.toString().exchange());
          }
        }
      });
    }

    return sizeFolder;
  }

  void printFolders(String path) {
    final dir = Directory(path);
    final List<FileSystemEntity> entities = dir.listSync().toList();
    print(path.replaceAll("\\", "/").split("/").last);
    List<FileSystemEntity> file = [];
    int i = 1;

    entities.forEach((element) {
      file.add(element);
      
      if (element is File) {
        print("     |______");
        
        print(
            "${i++}📄  |      ${element.toString().exchange().split("/").last}");
      } else if (element is Directory) {
        print("     |______");
        print(
            "${i++}📂  |      ${element.toString().exchange().split("/").last}");
      }
    });
    print("Tartib raqamini kiriting(qaytish uchun '0'): ");
    String tanlovS = stdin.readLineSync()!;

    if (tanlovS.toLowerCase() == "exit") {
      exit(0);
    } else {
      int tanlov = int.parse(tanlovS);
      if (tanlov == 0) {
        printFolders(path.cutLastFolder());
      } else {
        if (entities[tanlov - 1] is Directory) {
          printFolders(entities[tanlov - 1].toString().exchange());
        } else if(entities[tanlov - 1] is File){
          print(entities[tanlov - 1]);
          print(
              "Bu tanlovda folder emas \nDavom etaylikmi(Ha-1)?");
          if (int.parse(stdin.readLineSync()!) == 1) {
            printFolders(path);
          } else {
            exit(0);
          }
        }
      }
    }
  }
}

extension Exchange on String {
  String exchange() {
    return this.replaceAll("\\", "/").split("'")[1];
  }

  String exchangeNoSplit() {
    return this.replaceAll("\\", "/");
  }

  String cutLastFolder() {
    List<String> w = this.split("/").toList();
    String natija = '';
    for (int i = 0; i < w.length - 1; i++) {
      natija += "${i == 0 ? w[i] : '/${w[i]}'}";
    }
    return natija;
  }
}
// List sortList(List<FileSystemEntity> list){
//     Map<FileSystemEntity, int> entities = {};
//     list.forEach((element) {
//       entities[element]=element.l
//     });
//   return [];
// }

