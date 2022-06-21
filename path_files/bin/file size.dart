import 'dart:io';

import 'package:filesize/filesize.dart';

class FileSize {
  start() async {
    print("Assalomu alaykum dasturimizga xuhs kelibsiz!");
    print("Sizga kerakli file yo'lini korsating: ");
    String filePath = stdin.readLineSync()!;
    printFolders(filePath);
    // printFolders("D:/Saidmirzo/dart/Algoritms");
   
    // print(listMap);
  }

  void printFolders(String path) async{
    final dir = Directory(path);
    final List<FileSystemEntity> entities = dir.listSync().toList();
    print(path.replaceAll("\\", "/").split("/").last);
    int i = 1;
 
    entities.forEach((element) {
     
      if (element is File) {
        print("     |______");

        print(
            "${i++}📄  |      ${element.toString().exchange().split("/").last}  ${filesize(element.lengthSync())}  ");
      } else if (element is Directory) {
        print("     |______");
        print(
            "${i++}📂  |      ${element.toString().exchange().split("/").last}     ");
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
        } else if (entities[tanlov - 1] is File) {
          print(entities[tanlov - 1]);
          print("Bu tanlovda folder emas \nDavom etaylikmi(Ha-1)?");
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




