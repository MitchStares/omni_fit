// import 'package:flutter/material.dart';
// import 'package:omni_fit/screens/workouts.dart';

// class ListTileSelectExample extends StatefulWidget {
//   const ListTileSelectExample({Key? key}) : super(key: key);

//   @override
//   ListTileSelectExampleState createState() => ListTileSelectExampleState();
// }

// class ListTileSelectExampleState extends State<ListTileSelectExample> {
//   bool isSelectionMode = false;
//   //final int listLength = 30;
//   late List<bool> _selected;
//   bool _selectAll = false;
//   bool _isGridMode = false;

//   @override
//   void initState() {
//     super.initState();
//     initializeSelection();
//   }

//   // void initializeSelection() {
//   //   _selected = List<bool>.generate(listLength, (_) => false);
//   // }

//   @override
//   void dispose() {
//     _selected.clear();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'ListTile selection',
//           ),
//           leading: isSelectionMode
//               ? IconButton(
//                   icon: const Icon(Icons.close),
//                   onPressed: () {
//                     setState(() {
//                       isSelectionMode = false;
//                     });
//                     initializeSelection();
//                   },
//                 )
//               : const SizedBox(),
//           actions: <Widget>[
//             if (_isGridMode)
//               IconButton(
//                 icon: const Icon(Icons.grid_on),
//                 onPressed: () {
//                   setState(() {
//                     _isGridMode = false;
//                   });
//                 },
//               )
//             else
//               IconButton(
//                 icon: const Icon(Icons.list),
//                 onPressed: () {
//                   setState(() {
//                     _isGridMode = true;
//                   });
//                 },
//               ),
//             if (isSelectionMode)
//               TextButton(
//                   child: !_selectAll
//                       ? const Text(
//                           'select all',
//                           style: TextStyle(color: Colors.white),
//                         )
//                       : const Text(
//                           'unselect all',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                   onPressed: () {
//                     _selectAll = !_selectAll;
//                     setState(() {
//                       _selected =
//                           List<bool>.generate(listLength, (_) => _selectAll);
//                     });
//                   }),
//           ],
//         ),
//         body: _isGridMode
//             ? GridBuilder(
//                 isSelectionMode: isSelectionMode,
//                 selectedList: _selected,
//                 onSelectionChange: (bool x) {
//                   setState(() {
//                     isSelectionMode = x;
//                   });
//                 },
//               )
//             : ListBuilder(
//                 isSelectionMode: isSelectionMode,
//                 selectedList: _selected,
//                 onSelectionChange: (bool x) {
//                   setState(() {
//                     isSelectionMode = x;
//                   });
//                 },
//               ));
//   }
// }
