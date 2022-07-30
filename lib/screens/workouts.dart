import 'package:flutter/material.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});
  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  bool _selected = false;
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  static const List<Exercise> entries = [
    Exercise(0, 'Machine Leg Press', 12),
    Exercise(1, 'Lying Leg Curl', 15),
    Exercise(2, 'Split Squats', 8)
  ];
  final List<String> exercises = entries.map((set) => set.name).toList();
  final List<int> reps = entries.map((number) => number.reps).toList();
  final List<int> colorCodes = <int>[600, 500, 100];
  // todo: this needs to be changed, has a hard coded value of 200
  // final List<bool> _selected =
  //     List.generate(200, (i) => false); // Pre filled list
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 50,
            // color: Colors.amber[colorCodes[index]],
            // color: _selected == true
            //     ? selectedIndex == index
            //         ? Colors.amber
            //         : Colors.transparent
            //     : Colors.transparent,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    leading: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        setState(() {
                          _selected = !_selected;
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        width: 48,
                        height: 48,
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          backgroundColor: _selected == true
                              ? selectedIndex == index
                                  ? Colors.amber
                                  : Colors.lightBlue
                              : Colors.lightBlue,
                        ),
                      ),
                    ),
                    title: Text(exercises[index]),
                    trailing: Text('Reps: ${reps[index]}'),
                    dense: true,
                  ),
                ),
              ],
            ));
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
