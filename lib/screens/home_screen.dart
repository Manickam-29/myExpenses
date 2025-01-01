import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myexpenses/common_components/common_color.dart';
import 'package:myexpenses/common_components/common_floating_button.dart';
import 'package:myexpenses/common_components/common_header.dart';
import 'package:myexpenses/common_components/common_loader_comp.dart';
import 'package:myexpenses/common_components/common_padding.dart';
import 'package:myexpenses/common_components/data_not_found.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DocumentSnapshot> expensesList = [];
  bool pageLoader = true, listLoader = true;

  @override
  void initState() {
    super.initState();

    getExpensesList();
  }

  getExpensesList() {
    setState(() {
      pageLoader = false;
      listLoader = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          CommonPadding.topPadding20,
          CommonHeader(
            headerText: 'Expenses List',
          ),
          if (pageLoader == true) commonLoaderComp(),
          if (pageLoader == false && expensesList.isEmpty) DataNotFound(),
          if (pageLoader == false && expensesList.isNotEmpty) Container()
        ],
      )),
      floatingActionButton: CommonFloatingButton(
        icon: FontAwesomeIcons.plus,
        iconColor: white,
        onpressed: () {
          Navigator.pushNamed(context, '/add');
        },
        bgColor: appColor,
      ),
    );
  }
}
