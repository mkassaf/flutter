abstract class FileConvertor {
  int id;

  FileConvertor(this.id);

  void _open();

  void _close();

  void _convertFile();

  void convert() {
    _open();
    _convertFile();
    _close();
  }
}

class PDFFileConvertor extends FileConvertor {
  PDFFileConvertor(super.id);

  @override
  void _open() {
    print('PDF File is opened');
  }

  @override
  void _close() {
    print('PDF File is closed');
  }

  @override
  void _convertFile() {
    print('PDF File is converted');
  }

  void printFile() {
    print('PDF File is printed');
  }
}

class JsonFileConvertor extends FileConvertor {
  JsonFileConvertor(super.id);

  @override
  void _open() {
    print('Json File is opened');
  }

  @override
  void _close() {
    print('Json File is closed');
  }

  @override
  void _convertFile() {
    print('Json File is converted');
  }
}

void main(List<String> args) {
  //FileConvertor fileConvertor = PDFFileConvertor();

  var fileConvertor = PDFFileConvertor(1);
  fileConvertor.convert();

  var jsonFileConvertor = JsonFileConvertor(1);
  jsonFileConvertor.convert();
}
