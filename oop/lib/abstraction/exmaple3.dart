import 'abstract_exmaple2.dart';

void main(List<String> args) {
  PDFFileConvertor fileConvertor = PDFFileConvertor(1);

  //fileConvertor as PDFFileConvertor;

  fileConvertor.convert();

  fileConvertor.printFile();

  FileConvertor jsonFileConvertor = JsonFileConvertor(2);
  jsonFileConvertor.convert();
}
