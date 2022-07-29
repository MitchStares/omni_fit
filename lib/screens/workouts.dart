import 'package:flutter/material.dart';

class WorkoutPage extends StatelessWidget {
  static const List<Exercise> entries = [
    Exercise(0, 'Machine Leg Press', 12),
    Exercise(1, 'Lying Leg Curl', 15),
    Exercise(2, 'Split Squats', 8)
  ];
  final List<String> exercises = entries.map((set) => set.name).toList();
  final List<int> reps = entries.map((number) => number.reps).toList();
  final List<int> colorCodes = <int>[600, 500, 100];

  WorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          // color: Colors.amber[colorCodes[index]],
          color: Colors.grey[colorCodes[index]],
          child: Row(
              children: [Text(exercises[index]), Text('Reps: ${reps[index]}')]),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  /// The base class for the different types of items the list can contain.
}

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}

class Exercise {
  const Exercise(this.id, this.name, this.reps);

  final int id;
  final String name;
  final int reps;
}
