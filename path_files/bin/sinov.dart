import 'dart:io';
import 'package:filesize/filesize.dart';

class FileSize {
  Map<String, String> list =
      {}; //Shu map ichida folder ichiudagi barcha file lar ro'yxati va o'lchami bor
  getFileContents(String path) async {
    print("|--${path.split("/").last}");
    final dir = Directory(path);
    final List<FileSystemEntity> entities = await dir.list().toList();
    entities.forEach((element) async {
      if (element is File) {
        list[element.toString()] = element.lengthSync().toString();
        print('|   |___');
        print('|   |   ${element.toString().split("/").last}');
      } else {
        if (element is Directory) {
          print(element.toString().exchange());

          await getFileContents(element.toString().exchange());
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





























// void main() {
//   final tree = BinaryTreeNode('D',
//       leftChild: BinaryTreeNode('A'),
//       rightChild: BinaryTreeNode(
//         'R',
//         leftChild: BinaryTreeNode('T'),
//         rightChild: BinaryTreeNode('Fun'),
//       ));
//   print(tree);
// }

// class BinaryTreeNode<T> {
//   BinaryTreeNode(this.value, {this.leftChild, this.rightChild});
//   T value;
//   BinaryTreeNode<T>? leftChild;
//   BinaryTreeNode<T>? rightChild;

//   @override
//   String toString() {
//     final out = StringBuffer();

//     rightChild?._buildTree(out, true, '');
//     out.writeln(value);
//     leftChild?._buildTree(out, false, '');

//     return out.toString();
//   }

//   void _buildTree(StringBuffer out, bool isRight, String indent) {
//     rightChild?._buildTree(out, true, indent + (isRight ? '     ' : '│    '));

//     out
//       ..write(indent)
//       ..write(isRight ? '┌─── ' : '└─── ')
//       ..writeln(value);

//     leftChild?._buildTree(out, false, indent + (isRight ? '│    ' : '     '));
//   }
// }