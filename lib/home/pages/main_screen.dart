import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../core/generic_widgets/bottom_navigation_bar/cubit/bottom_navigation_cubit.dart';
import '../../favorite/pages/favorite_screen.dart';
import '../../orders/pages/order_screen.dart';
import '../../profile/pages/profile_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<BottomNavigationCubit>().changePageIndex(newPageIndex: 0);
  }

  List<Widget> pages = [
    HomeScreen(),
    FavoriteScreen(),
    OrderScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (BuildContext context, BottomNavigationState state) {
        return Scaffold(
          body: pages[state.pageIndex],
          bottomNavigationBar: Container(
            child: SizedBox(
              height: 80,
              child: BottomNavigationBar(
                backgroundColor: Colors.grey,
                currentIndex: state.pageIndex,
                onTap: (index) {
                  context
                      .read<BottomNavigationCubit>()
                      .changePageIndex(newPageIndex: index);
                },
                elevation: 10.0,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(state.pageIndex == 0
                        ? Icons.home
                        : Icons.home_outlined),
                    label: 'home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(state.pageIndex == 1
                        ? Icons.favorite
                        : Icons.favorite_border),
                    label: 'favorites',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(state.pageIndex == 2
                        ? Icons.local_grocery_store
                        : Icons.local_grocery_store_outlined),
                    label: 'orders',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(state.pageIndex == 3
                        ? Icons.person
                        : Icons.person_outline),
                    label: 'profile',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
