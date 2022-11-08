import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/Screen-Profile/profile_widget.dart';
import 'package:flutter_application_test/Screen-profile/setting_Profile_page.dart';
import 'edit_Profile_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Profile',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SettingProfilePage();
              }));
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 100),
              ProfileWidget(
                imagePath:
                    'https://upload.wikimedia.org/wikipedia/th/thumb/5/5d/Your_Name_poster.jpg/640px-Your_Name_poster.jpg',
                onClicked: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
              ),
              SizedBox(height: 30),
              Text(
                'Username',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              SizedBox(height: 5),
              Text(
                user.email!,
                style: TextStyle(color: Colors.green, fontSize: 16),
              ),
              SizedBox(height: 15),
              buildNumber(),
              SizedBox(height: 20),
              buildAbout(),
              // FutureBuilder(
              //   future: readUser(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       final user = snapshot.data;
              //       return user == null
              //           ? Center(child: Text('No User'))
              //           : buildUser(user);
              //     } else {
              //       return Text('Something went wrong!');
              //     }
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildUser(User user) => ListTile(
  //     leading: CircleAvatar(child: Text('${user.age}')),
  //     title: Text(user.name));

  Widget buildAbout() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Text(
            'KMUTNB',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget buildNumber() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildButton(context, '19', 'Singing'),
        buildDivider(),
        buildButton(context, '2.5', 'Rating'),
      ],
    );
  }

  Widget buildDivider() => Container(
        height: 26,
        child: VerticalDivider(),
      );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
          padding: EdgeInsets.symmetric(vertical: 4),
          onPressed: () {},
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                value,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
              SizedBox(height: 2),
              Text(
                text,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ));

  // Future<User?> readUser() async {
  //   // Get single document by ID
  //   final docUser = FirebaseFirestore.instance.collection('users').doc();
  //   final snapshot = await docUser.get();

  //   if (snapshot.exists) {
  //     return User.fromJson(snapshot.data()!);
  //   }
  // }
}

// class User {
//   String id;
//   final String name;
//   final String email;
//   final int age;
//   final DateTime birthday;

//   User({
//     this.id = '',
//     required this.email,
//     required this.name,
//     required this.age,
//     required this.birthday,
//   });

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'email': email,
//         'name': name,
//         'age': age,
//         'birthday': birthday,
//       };

//   static User fromJson(Map<String, dynamic> json) => User(
//         id: json['id'],
//         email: json['userEmail'],
//         name: json['userName'],
//         age: json['userAge'],
//         birthday: (json['birthday'] as Timestamp).toDate(),
//       );
// }
