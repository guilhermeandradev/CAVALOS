library my_prj.Global;

final List<Item> data = [
  Item(
      headerValue: ("Cambiaso Jmen"),
      imagePath: 'assets/images/Cambiaso.jpg',
      expandedValue: ("Data de Nascimento: 13/05/15 "),
      isExpanded: false),
  Item(
      headerValue: ("Lady Scarlett Jmen"),
      imagePath: 'assets/images/LadyScarlett.jpg',
      expandedValue: ("Data de Nascimento: 23/03/12"),
      isExpanded: false),
  Item(
      headerValue: ("Diva"),
      imagePath: 'assets/images/Diva.jpg',
      expandedValue: ("Data de Nascimento: ???"),
      isExpanded: false)
];

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
    required this.imagePath,
  });

  String imagePath;
  String expandedValue;
  String headerValue;
  bool isExpanded;
}
