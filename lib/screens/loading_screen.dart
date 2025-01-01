import 'package:flutter/material.dart';
import 'package:myexpenses/common_components/get_screen_size.dart';
import 'package:myexpenses/common_components/image_comp.dart';
import '../connectivity/firebase_connectivity.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5), () async {
      await firebaseRequest();
      Navigator.pushNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = GetScreenSize().getHeight(context);
    double width = GetScreenSize().getWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ImageComp()
              .assetsImageByPath('lib/images/loading.gif', height, width)),
    );
  }
}
