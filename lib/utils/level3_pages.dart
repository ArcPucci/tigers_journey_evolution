import 'package:tigers_journey_evolution/models/models.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';

final List<CustomPage> level3Pages = [
  CustomPage(
    content:
        "With the dawn of humanity, the tapestry of the natural world is forever altered. Fires light up the night, and landscapes change under the influence of these new architects.",
    image: "$pictures/level3_page_1.png",
    answers: [],
  ),
  CustomPage(
    content:
        "Your tigers now face a challenge unlike any before: coexisting with humans, a species capable of both great creation and destruction.",
    image: "$pictures/level3_page_2.png",
    answers: [],
  ),
  CustomPage(
    content:
        "As villages sprout and expand, the tigers must navigate a world that grows smaller each day. This era is a pivotal chapter in your lineage's saga, where the decisions you make will shape the future of tigers living in the shadow of human civilization.",
    image: "$pictures/level3_page_3.png",
    answers: [],
  ),
  CustomPage(
    content:
        "The contrast between the natural world and the emerging human realm is stark, but how do you survive in such a fast-paced world? Choose the right action, good luck!",
    image: "$pictures/level3_page_4.png",
    answers: [
      Answer(
        answer: "Hide and avoid human contact",
        image: "$pictures/level3_correct_page.png",
        description: "Exhibits caution and adaptability, recognizing the potential threats posed by humans while preserving the species' safety and secrecy.",
        correct: Correctness.correct,
      ),
      Answer(
        answer: "Approach the humans cautiously",
        image: "$pictures/level3_wrong_page.png",
        description: "While potentially opening avenues for coexistence or benefiting from human waste, it significantly increases the risk of direct conflict and misunderstanding, challenging the tigers to weigh curiosity against caution.",
        correct: Correctness.wrong,
      ),
      Answer(
        answer: "Assert territory around the human settlement",
        image: "$pictures/level3_neutral_page.png",
        description: "Demonstrates a bold but risky attempt to coexist near human populations, balancing the benefits of proximity to new food sources against the dangers of human conflict.",
        correct: Correctness.neutral,
      ),
    ],
  ),
];
