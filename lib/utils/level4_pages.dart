import 'package:tigers_journey_evolution/models/models.dart';
import 'package:tigers_journey_evolution/utils/levels.dart';

final List<CustomPage> level4Pages = [
  CustomPage(
    content:
        "The Age of Exploration beckons your tigers to venture beyond known boundaries, to lands unmarked by paw or claw.",
    image: "$pictures/level4_page_1.png",
    answers: [],
  ),
  CustomPage(
    content:
        "As humans chart the seas and map the unknown, your tigers, too, discover new realms. From lush islands to vast deserts, each landscape offers a promise of sanctuary or a test of survival.",
    image: "$pictures/level4_page_2.png",
    answers: [],
  ),
  CustomPage(
    content:
        "This age of discovery is a double-edged sword, where the thrill of the unknown meets the peril of the untamed. Your choices here will decide if your lineage will thrive in new dominions or cling to the fading echoes of their once vast territories.",
    image: "$pictures/level4_page_3.png",
    answers: [],
  ),
  CustomPage(
    content:
        "Your tiger has a difficult choice: 3 paths and only 1 will be correct. Think about where your tiger can find his happiness and continue his family, good luck!",
    image: "$pictures/level4_page_4.png",
    answers: [
      Answer(
        answer: "Delve deeper into the dense rainforest",
        image: "$pictures/level4_wrong_page.png",
        description:
            "Opting for the familiarity of the forest environment, this choice underlines the preference for known challenges over the uncertainty of new habitats, despite the competition and limited resources.",
        correct: Correctness.wrong,
      ),
      Answer(
        answer: "Cross into the vast desert",
        image: "$pictures/level4_neutral_page.png",
        description:
            "Represents the daring to face harsh conditions in search of new territories, highlighting endurance but also the peril of navigating resource-scarce environments.",
        correct: Correctness.neutral,
      ),
      Answer(
        answer: "Swim to the lush island",
        image: "$pictures/level4_correct_page.png",
        description:
            "Embodies the quest for an idyllic habitat with abundant resources but requires overcoming the physical barrier of water, testing the tiger's adaptability and courage.",
        correct: Correctness.correct,
      ),
    ],
  ),
];
