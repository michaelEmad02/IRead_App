import 'package:flutter/material.dart';
import 'package:iread/constants.dart';
import 'package:iread/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: kThirdColor,
        width: 200,
      ),
      body: const SafeArea(child: HomeViewBody()),
    );
  }
}
