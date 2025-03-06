final class Book {
  final String title;
  final String author;

  Book(this.title, this.author);

  @override
  String toString() => "$title by $author";
}

//it is ok to inherit from a final class becasue both classes in the same library
base class SoftwareBook extends Book {
  final String language;

  SoftwareBook(super.title, super.author, this.language);

  @override
  String toString() => "$title by $author in $language";
}
