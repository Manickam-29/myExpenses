
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myexpenses/common_components/common_calculation.dart';
import 'package:myexpenses/common_components/common_date_comp.dart';
import 'package:myexpenses/common_components/common_header.dart';
import 'package:myexpenses/common_components/common_loader_comp.dart';
import 'package:myexpenses/common_components/common_padding.dart';
import 'package:myexpenses/common_components/custom_functions.dart';
import 'package:myexpenses/common_components/data_not_found.dart';
import 'package:myexpenses/common_components/expense_display_card.dart';
import 'package:myexpenses/common_components/get_screen_size.dart';
import 'package:myexpenses/common_components/total_display_card.dart';
import 'package:myexpenses/firebase_operation/insert_data.dart';
import 'package:myexpenses/firebase_operation/read_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool pageLoader = true, listLoader = true;
  String currentDate = '';
  String totalExpense = '';
  List<dynamic> expenseList = [];

  @override
  void initState() {
    super.initState();
    getCurrentDate();
  }

  getCurrentDate() {
    setState(() {
      currentDate = CustomFunctions().getCurrentDate();
    });
    getExpensesList();
  }

  getExpensesList() async {
    DocumentSnapshot documentSnapshot =
        await ReadData().readExpenseByDate(currentDate);

    if (documentSnapshot.data() == null) {
      setState(() {
        expenseList = [];
        totalExpense = '';
        pageLoader = false;
      });
    } else {
      setState(() {
        expenseList = documentSnapshot['expenseList'];
        totalExpense = CommonCalculations()
            .calcTotalExpense(documentSnapshot['expenseList']);
        pageLoader = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = GetScreenSize().getHeight(context);
    GetScreenSize().getWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          CommonPadding.topPadding20,
          CommonHeader(
            headerText: 'Expenses List',
            nextAction: () {
              Navigator.pushNamed(context, '/add');
            },
            nextIcon: FontAwesomeIcons.plus,
          ),
          CommonPadding.topPadding20,
          CommonDateComp(
              leftAction: () {
                setState(() {
                  pageLoader = true;
                  currentDate = CustomFunctions().subDate(currentDate);
                });
                getExpensesList();
              },
              leftIcon: FontAwesomeIcons.chevronLeft,
              date: currentDate,
              dateAction: () async {
                String selectedDate =
                    await CustomFunctions().selectedDate(context);
                setState(() {
                  currentDate = selectedDate;
                });
              },
              rightAction: () {
                setState(() {
                  pageLoader = true;
                  currentDate = CustomFunctions().addDate(currentDate);
                });
                getExpensesList();
              },
              rightIcon: FontAwesomeIcons.chevronRight),
          CommonPadding.topPadding20,
          if (pageLoader == true) commonLoaderComp(),
          if (pageLoader == false && expenseList.isEmpty) DataNotFound(),
          if (pageLoader == false && expenseList.isNotEmpty)
            SizedBox(
              height: height * 0.6,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: expenseList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ExpenseDisplayCard(
                    iconData: CustomFunctions()
                        .getExpenseIcon(expenseList[index]['type']),
                    mode: expenseList[index]['mode'],
                    type: expenseList[index]['type'],
                    amount: expenseList[index]['amount'],
                    onDeleteAction: () async {
                      expenseList.removeAt(index);
                      await InsertData()
                          .updateExpenseList(currentDate, expenseList);
                      setState(() {
                        totalExpense =
                            CommonCalculations().calcTotalExpense(expenseList);
                      });
                    },
                  );
                },
              ),
            ),
          Spacer(),
          if (pageLoader == false && expenseList.isNotEmpty)
            totalExpenseTile(totalExpense),
          CommonPadding.bottomPadding60
        ],
      )),
    );
  }
}
