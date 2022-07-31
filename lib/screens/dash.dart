import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:omni_fit/functionality/steps_chart.dart';

class DashPage extends StatefulWidget {
  DashPage({Key? key}) : super(key: key);

  @override
  State<DashPage> createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {
  final TextStyle optionStyle =
      const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  int steps = 7631;
  DateTime now = DateTime.now();
  //DateTime.now().toString().substring(0, 10) //This can be used directly in a Text() widget.

  //This date method works really well, but cant do Names of months. Also, it needs to be below in the Build
  //String convertedDate =
  //      "${now.day.toString().padLeft(2, '0')} ${now.month.toString().padLeft(2, '0')} ${now.year.toString()}";
//todo scroll isnt working totally well. Remove neverscroll from gridview.count to enable scroll on that but screws with top scroll.

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd MMMM yyyy').format(now);
    return SingleChildScrollView(
      primary: true,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView(
                physics:
                    const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                primary: false,
                shrinkWrap: true,
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          isThreeLine: true,
                          title: const Text("Things to do Today"),
                          subtitle: Text(formattedDate),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text("Log Food"),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(1.5),
                childAspectRatio: 1,
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  SizedBox(
                    height: 48,
                    width: 48,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        semanticContainer: true,
                        color: Colors.grey[200],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .start, //delete if not centering horizontally
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "$steps",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                const Text(" steps")
                              ],
                            ),
                            SizedBox(
                              height: 50.0,
                              child: Expanded(
                                child: StepChart(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
