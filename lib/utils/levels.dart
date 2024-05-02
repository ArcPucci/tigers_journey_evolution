import 'package:tigers_journey_evolution/models/models.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';

const pictures = "assets/png/pictures";

final List<Level> levels = [
  Level(
    id: 0,
    name: "The Ancient Forest",
    loadingBG: '$pictures/level1_loading.png',
    map: '$pictures/map1.png',
    checkPoint: checkPoints[0],
    pages: level1Pages,
  ),
  Level(
    id: 1,
    name: "The ice age",
    loadingBG: '$pictures/level2_loading.png',
    map: '$pictures/map2.png',
    checkPoint: checkPoints[1],
    pages: level2Pages,
  ),
  Level(
    id: 2,
    name: "The Arrival of Humans",
    loadingBG: '$pictures/level3_loading.png',
    map: '$pictures/map3.png',
    checkPoint: checkPoints[2],
    pages: level3Pages,
  ),
  Level(
    id: 3,
    name: "The Age of Exploration",
    loadingBG: '$pictures/level4_loading.png',
    map: '$pictures/map4.png',
    checkPoint: checkPoints[3],
    pages: level4Pages,
  ),
  Level(
    id: 4,
    name: "The Modern Era",
    loadingBG: '$pictures/level5_loading.png',
    map: '$pictures/map5.png',
    checkPoint: checkPoints[4],
    pages: level5Pages,
  ),
];
