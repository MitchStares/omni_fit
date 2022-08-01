import 'package:flutter/material.dart';
import 'package:omni_fit/functionality/steps_chart.dart';

class StepCard extends StatefulWidget {
  StepCard({Key? key}) : super(key: key);

  @override
  State<StepCard> createState() => _StepCardState();
}

class _StepCardState extends State<StepCard> {
  int steps = 7631;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 48,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          semanticContainer: true,
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .start, //delete if not centering horizontally
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Text(
                      "Steps",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Row(
                children: const <Widget>[
                  Padding(padding: EdgeInsets.only(left: 20)),
                  Text("Today")
                ],
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .start, //delete if not centering horizontally
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Padding(padding: EdgeInsets.only(left: 20)),
                    Text(
                      "$steps",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const Text(" steps")
                  ],
                ),
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
    );
  }
}
