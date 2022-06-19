

import 'file size.dart';

void main() async {
  FileSize file = FileSize();
  await file.getFileContents("D:/Saidmirzo/dart/Algoritms/search");
   await Future.delayed(Duration(seconds: 5));
  print(file.list);
}


