
import 'package:flutter/material.dart';

import '../models/dashboard_menu.dart';
import '../pages/dashboard_page.dart';
import '../pages/analytics_page.dart';
import '../pages/customers_page.dart';
import '../pages/products_page.dart';
import '../pages/orders_page.dart';
import '../pages/settings_page.dart';

class DashboardLayout extends StatefulWidget {
  const DashboardLayout({super.key});

  @override
  State<DashboardLayout> createState() =>
      _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> {
  int selectedIndex = 0;

  late final List<DashboardMenu> menus = [
    DashboardMenu(
      title: 'Dashboard',
      icon: Icons.dashboard_rounded,
      page: DashboardPage(onNavigate: navigateTo),
    ),
    const DashboardMenu(
      title: 'Analytics',
      icon: Icons.analytics_rounded,
      page: AnalyticsPage(),
    ),
    const DashboardMenu(
      title: 'Customers',
      icon: Icons.people_rounded,
      page: CustomersPage(),
    ),
    const DashboardMenu(
      title: 'Products',
      icon: Icons.inventory_2_rounded,
      page: ProductsPage(),
    ),
    const DashboardMenu(
      title: 'Orders',
      icon: Icons.shopping_cart_rounded,
      page: OrdersPage(),
    ),
    const DashboardMenu(
      title: 'Settings',
      icon: Icons.settings_rounded,
      page: SettingsPage(),
    ),
  ];

  void navigateTo(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;

        return Scaffold(
          appBar: isDesktop
              ? null
              : AppBar(
                  title: Text(menus[selectedIndex].title),
                  backgroundColor: Colors.white,
                  actions: [
                    IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('You have no new notifications.'),
                          ),
                        );
                      },
                      icon: const Icon(Icons.notifications_outlined),
                    ),
                  ],
                ),

          drawer: isDesktop
              ? null
              : Drawer(
                  child: _buildSidebar(),
                ),

          body: Row(
            children: [
              if (isDesktop)
                SizedBox(
                  width: 250,
                  child: _buildSidebar(),
                ),

              Expanded(
                child: Column(
                  children: [
                    if (isDesktop) _buildTopBar(),

                    Expanded(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0.02, 0),
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            ),
                          );
                        },
                        child: KeyedSubtree(
                          key: ValueKey(selectedIndex),
                          child: menus[selectedIndex].page,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSidebar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(
                  Icons.dashboard_customize,
                  color: Color(0xFF6366F1),
                  size: 30,
                ),
                SizedBox(width: 12),
                Text(
                  'DashPro',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'MAIN MENU',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 16),

          ...List.generate(menus.length, (index) {
            final selected = selectedIndex == index;

            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: selected
                      ? const Color(0xFFEEF2FF)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(
                    menus[index].icon,
                    color: selected
                        ? const Color(0xFF6366F1)
                        : Colors.grey,
                  ),
                  title: Text(
                    menus[index].title,
                    style: TextStyle(
                      color: selected
                          ? const Color(0xFF6366F1)
                          : Colors.black87,
                      fontWeight: selected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    navigateTo(index);
                    Navigator.of(context).maybePop();
                  },
                ),
              ),
            );
          }),

          const Spacer(),

          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFFEEF2FF),
              child: Icon(
                Icons.person,
                color: Color(0xFF6366F1),
              ),
            ),
            title: Text(
              'Admin User',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('Administrator'),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Welcome back, Admin!',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('You have no new notifications.'),
                ),
              );
            },
            icon: const Icon(Icons.notifications_outlined),
          ),

          const SizedBox(width: 12),

          const CircleAvatar(
            backgroundColor: Color(0xFFEEF2FF),
            child: Icon(
              Icons.person,
              color: Color(0xFF6366F1),
            ),
          ),

          const SizedBox(width: 12),

          const Text(
            'Admin User',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
