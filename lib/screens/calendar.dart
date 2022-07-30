import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});
  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  // below list should have a state/function to increase its size to = number of list items
  final List<bool> _selectedList = [false, false, false];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  static const List<Date> dates = [
    Date(0, '2022-07-30'),
    Date(1, '2022-07-29'),
    Date(2, '2022-07-28')
  ];
  final List<String> days = dates.map((when) => when.date).toList();
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
// Implementation from
// https://stackoverflow.com/questions/62998649/every-checkboxes-are-being-checked-when-you-select-only-one-of-them
// Still requires work.

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: dates.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
            height: 50,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CheckboxListTile(
                    checkColor: Colors.white,
                    value: _selectedList[index],
                    onChanged: (bool? newValue) {
                      setState(() {
                        _selectedList[index] = !_selectedList[index];
                      });
                    },
                    enableFeedback: true,
                    checkboxShape: const CircleBorder(),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(days[index]),
                    // subtitle: Text('Reps: ${reps[index]}'),
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

class Date {
  const Date(this.id, this.date);

  final int id;
  //final DateTime date;
  final String date;
  //todo create function to datetime.parse() a string to a datetime.
}

//Todo: Copy workouts.dart into here, except use CheckboxListTile instead of ListTile
// Try round the selection box and put it on the left side of the page
