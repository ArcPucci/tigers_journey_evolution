import 'package:tigers_journey_evolution/models/models.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';

final List<CustomPage> level2Pages = [
  CustomPage(
    content:
        "As the world succumbs to a blanket of ice, your tigers stand at the brink of an era that will test their resilience like never before.",
    image: "$pictures/level2_page_1.png",
    answers: [],
  ),
  CustomPage(
    content:
        "The Ice Age transforms the earth into a desolate expanse of snow and ice, challenging every creature's will to survive.",
    image: "$pictures/level2_page_2.png",
    answers: [],
  ),
  CustomPage(
    content:
        "In this frozen world, food is a treasure more precious than gold, hidden beneath layers of snow. The survival of your tigers hinges on their ability to adapt to this icy realm, where the cold is relentless, and the night is unforgiving.",
    image: "$pictures/level2_page_3.png",
    answers: [],
  ),
  CustomPage(
    content:
        "Your choices in this glacial landscape will determine whether your lineage emerges stronger or fades into the annals of history.",
    image: "$pictures/level2_page_4.png",
    answers: [],
  ),
  CustomPage(
    content:
        "In order for your tigers to go through the Ice Age, you need to choose the correct answer. Think like a tiger when the cold comes and the world changes and you will succeed!",
    image: "$pictures/level2_page_5.png",
    answers: [
      Answer(
        answer: "Take shelter in the cave",
        image: "$pictures/level2_neutral_page.png",
        description: "While providing immediate protection from the harsh climate, it may limit the tiger's opportunities for hunting and exploration, posing a dilemma between safety and sustenance.",
        correct: Correctness.neutral,
      ),
      Answer(
        answer: "Hunt in the snowy forest",
        image: "$pictures/level2_correct_page.png",
        description: " Capitalizing on the tiger's adaptability to colder climates and its prowess as a predator. This demonstrates the ability to overcome environmental challenges through resilience and skill.",
        correct: Correctness.correct,
      ),
      Answer(
        answer: "Migrate to unknown territories",
        image: "$pictures/level2_wrong_page.png",
        description: "Embarking on a migration journey embodies the spirit of exploration and the search for more hospitable environments, despite the inherent risks of the unknown and the energy expenditure involved.",
        correct: Correctness.wrong,
      ),
    ],
  ),
];
