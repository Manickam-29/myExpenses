import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myexpenses/common_components/circular_elevated_button.dart';
import 'package:myexpenses/common_components/common_bottom_sheet.dart';
import 'package:myexpenses/common_components/common_color.dart';
import 'package:myexpenses/common_components/common_header.dart';
import 'package:myexpenses/common_components/common_padding.dart';
import 'package:myexpenses/common_components/common_variables.dart';
import 'package:myexpenses/common_components/custom_functions.dart';
import 'package:myexpenses/common_components/expense_display_card.dart';
import 'package:myexpenses/common_components/textfield_comp.dart';

class AddNewExpense extends StatefulWidget {
  const AddNewExpense({super.key});

  @override
  State<AddNewExpense> createState() => _AddNewExpenseState();
}

class _AddNewExpenseState extends State<AddNewExpense> {
  TextEditingController dateController = TextEditingController();
  TextEditingController paymentController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  IconData? paymentPrefixIcon;
  int paymentIndex = 0, typeIndex = 0;

  @override
  void initState() {
    super.initState();
    setInitialValues();
  }

  void setInitialValues() {
    DateTime currentDate = DateTime.now();
    setState(() {
      dateController.text =
          "${currentDate.day}-${currentDate.month}-${currentDate.year}";
      paymentController.text = paymentStrings[paymentIndex];
      typeController.text = expenseTypeString[typeIndex];
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
            needBackIcon: true,
            backIcon: FontAwesomeIcons.arrowLeft,
            backAction: () {
              Navigator.pushNamed(context, '/home');
            },
            headerText: 'Add New Expense',
          ),
          CommonPadding.topPadding20,
          CustomTextField(
            labelText: 'Expense Date',
            controller: dateController,
            keyboardType: TextInputType.datetime,
            readOnly: true,
            prefixIcon: const Icon(Icons.date_range),
            onTap: () async {
              String selectedDate =
                  await CustomFunctions().selectedDate(context);
              setState(() {
                dateController.text = selectedDate;
              });
            },
          ),
          CommonPadding.topPadding20,
          CustomTextField(
            labelText: 'Payment mode',
            controller: paymentController,
            keyboardType: TextInputType.text,
            readOnly: true,
            prefixIcon: Icon(paymentIcons[paymentIndex]),
            onTap: () async {
              int? index = await commonBottomSheets(
                  context, paymentStrings, paymentIcons);
              setState(() {
                paymentController.text = paymentStrings[index!];
                paymentIndex = index;
              });
            },
          ),
          CommonPadding.topPadding20,
          CustomTextField(
            labelText: 'Expense Type',
            controller: typeController,
            keyboardType: TextInputType.text,
            readOnly: true,
            prefixIcon: Icon(expenseTypeIcons[typeIndex]),
            onTap: () async {
              int? index = await commonBottomSheets(
                  context, expenseTypeString, expenseTypeIcons);
              setState(() {
                typeController.text = expenseTypeString[index!];
                typeIndex = index;
              });
            },
          ),
          CommonPadding.topPadding20,
          CustomTextField(
            labelText: 'Amount',
            controller: amountController,
            keyboardType: TextInputType.number,
            readOnly: false,
            prefixIcon: Icon(
              FontAwesomeIcons.moneyBill1,
              color: black,
            ),
          ),
          CommonPadding.topPadding20,
          if (amountController.text.isNotEmpty)
            ExpenseDisplayCard(
              iconData: expenseTypeIcons[typeIndex],
              mode: paymentStrings[paymentIndex],
              type: expenseTypeString[typeIndex],
              amount: amountController.text,
              onDeleteAction: () {},
            ),
          const Spacer(),
          CircularElevatedButton(
            label: 'ADD EXPENSE',
            onPressed: dateController.text.isNotEmpty &&
                    paymentController.text.isNotEmpty &&
                    typeController.text.isNotEmpty &&
                    amountController.text.isNotEmpty
                ? () {}
                : null,
          ),
          CommonPadding.bottomPadding40
        ],
      )),
    );
  }
}