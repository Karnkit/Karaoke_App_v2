// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class TestPage extends StatefulWidget {
//   const TestPage({Key? key}) : super(key: key);

//   @override
//   _TestPageState createState() => _TestPageState();
// }

// class _TestPageState extends State<TestPage> {
//   final user = FirebaseAuth.instance.currentUser!;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text(
//           'TestPage',
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('users').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) return const Text('Loading...');
//           return ListView.builder(
//             itemExtent: 80.0,
//             itemCount: snapshot.data.documents.length,
//             itemBuilder:(context,index)=>
//             _buildListItem(context,snapshot.data.document[index]),
//           ),
//         },
//       ),
//     );
//   }
// }
