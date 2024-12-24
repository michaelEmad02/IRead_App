import 'package:flutter/material.dart';
import 'package:iread/constants.dart';
import 'package:iread/core/utils/assets_path.dart';
import 'package:iread/core/utils/styles.dart';
import 'package:iread/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        //backgroundColor: kThirdColor,
        width: 250,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                AssetsPath.mainImagePath,
                height: 150,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                minTileHeight: 30,
                minVerticalPadding: 0,
                contentPadding: const EdgeInsets.all(0),
                leading: Icon(
                  Icons.read_more_outlined,
                  color: kPrimaryColor,
                ),
                title: const Text(
                  "كتب سأقرأها",
                  style: Styles.textStyle16,
                ),
              ),
              ListTile(
                minTileHeight: 30,
                minVerticalPadding: 0,
                contentPadding: const EdgeInsets.all(0),
                leading: Icon(
                  Icons.read_more_outlined,
                  color: kPrimaryColor,
                ),
                title: const Text(
                  "ما قرأته",
                  style: Styles.textStyle16,
                ),
              ),
              ListTile(
                minTileHeight: 30,
                minVerticalPadding: 0,
                contentPadding: const EdgeInsets.all(0),
                leading: Icon(
                  Icons.read_more_outlined,
                  color: kPrimaryColor,
                ),
                title: const Text(
                  "ما أقرأه الآن",
                  style: Styles.textStyle16,
                ),
              ),
            ],
          ),
        ),
      ),
      body: const SafeArea(child: HomeViewBody()),
    );
  }
}
