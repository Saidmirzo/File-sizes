
import 'dart:io';

class FileSize {
  Map<String, String> list = {};   //Shu map ichida folder ichiudagi barcha file lar ro'yxati va o'lchami bor
  getFileContents(String path) async {
    final dir = Directory(path);
    final List<FileSystemEntity> entities = await dir.list().toList();
    entities.forEach((element) {
      if (element is File) {
        list[element.toString()] = element.lengthSync().toString();
        print(element.lengthSync());
      } else {
        if (element is Directory) {
          print(element.toString().exchange());

          getFileContents(element.toString().exchange());
        }
      }
    });
  }
}

extension Exchange on String {
  String exchange() {
    return this.replaceAll("\\", "/").split("'")[1];
  }
}