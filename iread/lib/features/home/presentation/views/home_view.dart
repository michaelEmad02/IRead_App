import 'package:flutter/material.dart';
import 'package:iread/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,),
      drawer: const Drawer(
        //backgroundColor: kThirdColor,
        width: 250,
      ),
      body: const SafeArea(child: HomeViewBody()),
    );
  }
}
