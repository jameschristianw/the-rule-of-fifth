import "package:flutter/material.dart";

class RandomChallengePage extends StatefulWidget {
  const RandomChallengePage({super.key});

  @override
  State<RandomChallengePage> createState() => _RandomChallengePageState();
}

class _RandomChallengePageState extends State<RandomChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Challenge"),
      ),
      body: const Center(
        child: Text("Random Challenge"),
      ),
    );
  }
}
