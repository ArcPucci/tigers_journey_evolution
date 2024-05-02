import 'package:tigers_journey_evolution/models/models.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';

final List<CustomPage> level1Pages = [
  CustomPage(
    content:
        "In the heart of the ancient forest, where the echoes of nature's past whisper through the trees, your tiger ancestors embark on a journey of survival.",
    image: "$pictures/level1_page_1.png",
    answers: [],
  ),
  CustomPage(
    content:
        "Amid towering trees and thick undergrowth, they face the challenge of finding food while eluding predators lurking in the shadows.",
    image: "$pictures/level1_page_2.png",
    answers: [],
  ),
  CustomPage(
    content:
        "This forest, a cradle of life and peril, demands cunning and agility.",
    image: "$pictures/level1_page_3.png",
    answers: [],
  ),
  CustomPage(
    content: "As seasons change, so does the landscape, presenting new trials.",
    image: "$pictures/level1_page_4.png",
    answers: [],
  ),
  CustomPage(
    content:
        "Your decisions here will carve the path of your lineage through the tapestry of time, where every step and every choice weaves the future of your tigers amidst the ancient wilderness.",
    image: "$pictures/level1_page_5.png",
    answers: [],
  ),
  CustomPage(
    content:
        "In order for your tigers to go through the era of the \"Ancient Forest\" you need to choose the correct answer. Think like a tiger in the era of the ancient world and you will succeed!",
    image: "$pictures/level1_page_6.png",
    answers: [
      Answer(
        answer: "Explore the dense underbrush for food",
        image: "$pictures/level1_correct_page.png",
        description: "This choice taps into the tiger's instinctual behavior, utilizing its natural habitat for sustenance and survival. It demonstrates an understanding of leveraging immediate environmental resources to thrive.",
        correct: Correctness.correct,
      ),
      Answer(
        answer: "Scale the mountain to find a new territory",
        image: "$pictures/level1_neutral_page.png",
        description: "Venturing into unknown territories can lead to potential rewards but also poses significant risks due to unfamiliar challenges and competitors. This option reflects the adventurous spirit and the constant quest for better living conditions, despite the uncertainties.",
        correct: Correctness.neutral,
      ),
      Answer(
        answer: "Enter the dark cave to escape the cold",
        image: "$pictures/level1_wrong_page.png",
        description: "Seeking refuge might offer a temporary solution to environmental adversities but could also place the tiger in direct conflict with other predators. This choice highlights the balance between seeking immediate comfort and the potential long-term consequences of encroaching on others' territories.",
        correct: Correctness.wrong,
      ),
    ],
  ),
];
