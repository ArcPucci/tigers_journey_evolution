import 'package:tigers_journey_evolution/models/models.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';

final List<Level> facts = [
  Level(
    id: 0,
    name: "Origins and Ancestry",
    loadingBG: "$pictures/fact1_loading.png",
    pages: fact1Pages,
    map: '',
    checkPoint: CheckPoint(id: 0),
  ),
  Level(
    id: 1,
    name: "Adaptation",
    loadingBG: "$pictures/fact2_loading.png",
    pages: fact2Pages,
    map: '',
    checkPoint: CheckPoint(id: 0),
  ),
  Level(
    id: 2,
    name: "Ecological Role",
    loadingBG: "$pictures/fact3_loading.png",
    pages: fact3Pages,
    map: '',
    checkPoint: CheckPoint(id: 0),
  ),
  Level(
    id: 3,
    name: "Threats and Conservation",
    loadingBG: "$pictures/fact4_loading.png",
    pages: fact4Pages,
    map: '',
    checkPoint: CheckPoint(id: 0),
  ),
  Level(
    id: 4,
    name: "The Future of Tigers",
    loadingBG: "$pictures/fact5_loading.png",
    pages: fact5Pages,
    map: '',
    checkPoint: CheckPoint(id: 0),
  ),
];
