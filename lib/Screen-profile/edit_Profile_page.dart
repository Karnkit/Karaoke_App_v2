import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/Screen-Profile/profile_widget.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();
  final _userNameController = TextEditingController();
  final _userAgeController = TextEditingController();
  final _userImageController = TextEditingController();
  final _userAboutController = TextEditingController();

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  Future upDate() async {
    addUserDetails(
      _userNameController.text.trim(),
      int.parse(_userAgeController.text.trim()),
      _userImageController.text.trim(),
      _userAboutController.text.trim(),
    );
  }

  Future addUserDetails(
      String userName, int userAge, String userImage, String userAbout) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': userName,
      'age': userAge,
      'about': userAbout,
      'image': userImage,
    });
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _userAgeController.dispose();
    _userImageController.dispose();
    _userAboutController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('EditProfile'),
          leading: BackButton(),
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
                const SizedBox(height: 100),
                ProfileWidget(
                  imagePath:
                      'https://upload.wikimedia.org/wikipedia/th/thumb/5/5d/Your_Name_poster.jpg/640px-Your_Name_poster.jpg',
                  isEdit: true,
                  onClicked: () async {},
                ),
                SizedBox(height: 40),
                buildUsername(),
                SizedBox(height: 10),
                buildAbout(),
                SizedBox(height: 40),
                bulidUpdateBtn(),
              ],
            ),
          ),
        ),
      );

  Widget buildUsername() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Username',
          style: TextStyle(
              color: Colors.white60, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6),
        Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ]),
            height: 50,
            child: TextField(
              controller: _userNameController,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(Icons.person, color: Color(0xff999999)),
                  hintText: 'Username',
                  hintStyle: TextStyle(color: Colors.black38)),
            )),
      ],
    );
  }

  Widget buildAbout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'About',
          style: TextStyle(
              color: Colors.white60, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6),
        Container(
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ]),
            height: 200,
            child: TextField(
              controller: _userAboutController,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon:
                      Icon(Icons.text_snippet, color: Color(0xff999999)),
                  hintText: 'About',
                  hintStyle: TextStyle(color: Colors.black38)),
            )),
      ],
    );
  }

  Widget bulidUpdateBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: RoundedLoadingButton(
        onPressed: upDate,
        color: Colors.amber,
        controller: _btnController,
        child: Text(
          'UPDATE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
