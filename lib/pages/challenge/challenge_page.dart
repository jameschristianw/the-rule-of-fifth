import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_rule_of_fifth/enum/notes.dart';

class ChallengePage extends StatefulWidget {
  final List<String> notes;

  const ChallengePage({super.key, required this.notes});

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  int currentQuestionIndex = 0;
  int correctAnsCount = 0;
  int wrongAnsCount = 0;
  int questionCount = 10;
  int randomizedIndex = 0;
  Random randomizer = Random();
  List<int> options = [];

  @override
  void initState() {
    super.initState();

    currentQuestionIndex = correctAnsCount = wrongAnsCount = 0;
    createOptions();
  }

  createOptions() {
    randomizedIndex = randomizer.nextInt(7);
    options = [];

    randomizedOptions(options, randomizedIndex);

    options.shuffle();
  }

  List<int> randomizedOptions(List<int> options, int randInt) {
    if (options.length == 4) return options;

    if (!options.contains(randInt)) {
      options.add(randInt);
    }
    randomizedOptions(options, randomizer.nextInt(7));
    return options;
  }

  checkAnswer(index) {
    if (index == randomizedIndex) {
      setState(() {
        createOptions();
        currentQuestionIndex++;
        correctAnsCount++;
      });
    } else {
      setState(() {
        createOptions();
        currentQuestionIndex++;
        wrongAnsCount++;
      });
    }
  }

  String getRandomizedIndexToString(index) {
    var result = "${index + 1}";

    if (index == 1) {
      return "${result}st";
    } else if (index % 2 == 0) {
      return "${result}nd";
    } else if (index % 3 == 0) {
      return "${result}rd";
    }

    return "${result}th";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question $currentQuestionIndex"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        color: Colors.amber.shade100,
        padding: const EdgeInsets.all(32),
        child: currentQuestionIndex == 10
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Correct answer $correctAnsCount/10",
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Finish",
                    ),
                  )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Correct answer $correctAnsCount/10"),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "What is the ${getRandomizedIndexToString(randomizedIndex)} from root note of ${widget.notes[0]}?",
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => checkAnswer(options[0]),
                    child: Text(
                      widget.notes.elementAt(options[0]),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => checkAnswer(options[1]),
                    child: Text(
                      widget.notes.elementAt(options[1]),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => checkAnswer(options[2]),
                    child: Text(
                      widget.notes.elementAt(options[2]),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => checkAnswer(options[3]),
                    child: Text(
                      widget.notes.elementAt(options[3]),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
