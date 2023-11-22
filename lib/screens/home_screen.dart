import 'package:flutter/material.dart';
import 'package:storezup/utils/color_themes.dart';

import '../resources/cloudfirestore_methods.dart';
import '../widgets/products_showcase_list_view.dart';
import '../widgets/search_bar_widget.dart';

// import '../resources/cloudfirestore_methods.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  List<Widget>? popstores;
  List<Widget>? regstores;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void getData() async {
    List<Widget> pop =
        await CloudFirestoreClass().getPopularStoresFromDataBase();
    List<Widget> reg = await CloudFirestoreClass().getStoresFromDataBase();
    setState(() {
      popstores = pop;
      regstores = reg;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size screenSize = Utils().getScreenSize();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: SearchBarWidget(
          label: "Explore Stores",
          searchfor: "stores",
        ),
      ),
      body: popstores != null
          ? Column(
              children: [
                ProductsShowcaseListView(
                    title: "Popular Stores", children: popstores!),
                ProductsShowcaseVerticalListView(
                    title: "Stores", children: regstores!),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
    );
  }
}
