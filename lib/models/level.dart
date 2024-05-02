import 'models.dart';

class Level {
  final int id;
  final String name;
  final String loadingBG;
  final String map;
  final CheckPoint checkPoint;
  final List<CustomPage> pages;

  Level({
    required this.id,
    required this.name,
    required this.loadingBG,
    required this.map,
    required this.checkPoint,
    required this.pages,
  });
}
