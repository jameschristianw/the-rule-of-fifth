import 'package:flutter/material.dart';
import 'package:the_rule_of_fifth/enum/notes.dart';
import 'package:the_rule_of_fifth/pages/challenge/challenge_page.dart';

class ChallengeStartPage extends StatelessWidget {
  final String rootNote;
  final int rootNoteIndex;

  const ChallengeStartPage(
      {super.key, required this.rootNote, required this.rootNoteIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Challenge Page - $rootNote',
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.amber.shade100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Start Challenge"),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChallengePage(
                        notes: notes[rootNoteIndex],
                      ),
                    ),
                  );
                },
                child: const Text('Start'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
