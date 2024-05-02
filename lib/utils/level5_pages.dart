import 'package:tigers_journey_evolution/models/models.dart';
import 'package:tigers_journey_evolution/utils/levels.dart';

final List<CustomPage> level5Pages = [
  CustomPage(
    content:
        "In the modern era, the world pulsates with the rapid beat of change, as urban expanses encroach upon the natural realm. This epoch presents your tigers with their greatest challenge yet: finding their place in a world where the wild fades into memory.",
    image: "$pictures/level5_page_1.png",
    answers: [],
  ),
  CustomPage(
    content:
        "Amidst the cacophony of progress, protected reserves emerge as beacons of hope, sanctuaries where the roar of the tiger can still echo",
    image: "$pictures/level5_page_2.png",
    answers: [],
  ),
  CustomPage(
    content:
        "The decisions you make now carry the weight of extinction or survival, guiding your tigers through the labyrinth of the Anthropocene. Your wisdom will determine if the tiger's legacy will be a tale of resilience and adaptation or a whisper lost in the wind.",
    image: "$pictures/level5_page_3.png",
    answers: [],
  ),
  CustomPage(
    content:
        "Adaptation in the modern world is a lot of stress. You need to choose the right course of action to save the tiger population.",
    image: "$pictures/level5_page_4.png",
    answers: [
      Answer(
        answer: "Migrate to protected reserves",
        image: "$pictures/level5_correct_page.png",
        description:
            "Acknowledges the changing landscape and seeks sanctuary in areas designated for conservation, emphasizing strategic adaptation to ensure survival in the face of urban expansion.",
        correct: Correctness.correct,
      ),
      Answer(
        answer: "Adapt to the urban fringe",
        image: "$pictures/level5_neutral_page.png",
        description:
            "Reflects an innovative, albeit risky, strategy to navigate the interface between wilderness and urban development, showcasing the potential for cohabitation or conflict.",
        correct: Correctness.neutral,
      ),
      Answer(
        answer: "Continue exploring diminishing wild spaces",
        image: "$pictures/level5_wrong_page.png",
        description:
            "Illustrates a commitment to traditional habitats and lifestyles, despite the increasing challenges posed by human encroachment and habitat loss, embodying resilience in the face of adversity.",
        correct: Correctness.wrong,
      ),
    ],
  ),
];
