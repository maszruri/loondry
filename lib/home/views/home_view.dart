import 'package:flutter/material.dart';
import 'package:loondry/categories/views/list_categories_view.dart';
import 'package:loondry/customers/views/list_customer_view.dart';
import 'package:loondry/home/view_models/home_viewmodel.dart';
import 'package:loondry/orders/views/order_view.dart';
import 'package:loondry/shared/functions/show_form.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;
  final List<Color> colors = [
    Colors.yellow,
    Colors.red,
    Colors.green,
  ];

  final List<Widget> views = const [
    OrderView(),
    ListCategoriesView(),
    ListCustomerView(),
  ];

  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.watch<HomeViewmodel>();
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) {
              Provider.of<HomeViewmodel>(context, listen: false)
                  .setPages(value);
            },
            // physics: const NeverScrollableScrollPhysics(),
            children: views,
          ),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black87, width: 3),
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: (value) {
      //     pageController.animateToPage(value,
      //         duration: const Duration(milliseconds: 500),
      //         curve: Curves.decelerate);
      //     Provider.of<HomeViewmodel>(context, listen: false).setPages(value);
      //   },
      //   currentIndex: viewmodel.pages,
      //   items: const [
      //     BottomNavigationBarItem(
      //       label: "Orders",
      //       icon: Icon(Icons.home),
      //     ),
      //     BottomNavigationBarItem(
      //       label: "Categories",
      //       icon: Icon(Icons.menu),
      //     ),
      //     BottomNavigationBarItem(
      //       label: "Customer",
      //       icon: Icon(Icons.person),
      //     ),
      //   ],
      // ),
      // body: BottomBar(
      //   fit: StackFit.expand,
      //   borderRadius: BorderRadius.circular(15),
      //   duration: Duration(seconds: 1),
      //   curve: Curves.decelerate,
      //   showIcon: true,
      //   width: MediaQuery.of(context).size.width * 0.75,
      //   barColor: Colors.white,
      //   start: 2,
      //   end: 0,
      //   offset: 10,
      //   barAlignment: Alignment.bottomCenter,
      //   iconHeight: 35,
      //   iconWidth: 35,
      //   reverse: false,
      //   hideOnScroll: true,
      //   scrollOpposite: false,
      //   onBottomBarHidden: () {},
      //   onBottomBarShown: () {},
      //   body: (context, controller) => TabBarView(
      //     controller: tabController,
      //     dragStartBehavior: DragStartBehavior.down,
      //     physics: const BouncingScrollPhysics(),
      //     children: views,
      //   ),
      //   child: TabBar(
      //     controller: tabController,
      //     tabs: const [
      //       SizedBox(
      //         height: 55,
      //         width: 40,
      //         child: Center(
      //           child: Icon(
      //             Icons.home,
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 55,
      //         width: 40,
      //         child: Center(
      //           child: Icon(
      //             Icons.search,
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 55,
      //         width: 40,
      //         child: Center(
      //           child: Icon(
      //             Icons.add,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      floatingActionButton: Visibility(
        visible: viewmodel.pages == 0 ? false : true,
        child: FloatingActionButton(
          onPressed: () {
            switch (context.read<HomeViewmodel>().pages) {
              case 1:
                ShowForm.categories(context);
                break;
              case 2:
                ShowForm.customer(context);
                break;
            }
          },
        ),
      ),
    );
  }
}
