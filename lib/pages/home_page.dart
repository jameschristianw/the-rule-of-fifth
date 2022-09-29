import 'package:flutter/material.dart';
import 'package:the_rule_of_fifth/pages/challenge/challenge_start_page.dart';
import 'package:the_rule_of_fifth/enum/notes.dart';
import 'package:the_rule_of_fifth/item_selection.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  moveToChallenge(Enum note, BuildContext context) {
    var data = notes[note.index];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChallengeStartPage(
          rootNote: data[0],
          rootNoteIndex: note.index,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Home')),
      body: Container(
        color: Colors.amber.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Select root note",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ItemSelection(
                  note: "C",
                  onTap: () => moveToChallenge(Notes.C, context),
                ),
                ItemSelection(
                  note: "G",
                  onTap: () => moveToChallenge(Notes.G, context),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ItemSelection(
                  note: "D",
                  onTap: () => moveToChallenge(Notes.D, context),
                ),
                ItemSelection(
                  note: "A",
                  onTap: () => moveToChallenge(Notes.A, context),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ItemSelection(
                  note: "E",
                  onTap: () => moveToChallenge(Notes.E, context),
                ),
                ItemSelection(
                  note: "B",
                  onTap: () => moveToChallenge(Notes.B, context),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ItemSelection(
                  note: "F",
                  onTap: () => moveToChallenge(Notes.F, context),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
