
import 'package:flutter/material.dart';

import '../widgets/animated_button.dart';
import '../widgets/section_title.dart';
import '../widgets/stat_card.dart';

class DashboardPage extends StatelessWidget {
  final Function(int) onNavigate;

  const DashboardPage({
    super.key,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Dashboard Overview',
            subtitle: 'Welcome back! Here is your business overview.',
          ),

          const SizedBox(height: 24),

          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              AnimatedActionButton(
                label: 'Add Product',
                icon: Icons.add,
                onPressed: () => onNavigate(3),
              ),
              AnimatedActionButton(
                label: 'View Orders',
                icon: Icons.shopping_cart,
                color: const Color(0xFF10B981),
                onPressed: () => onNavigate(4),
              ),
              AnimatedActionButton(
                label: 'View Analytics',
                icon: Icons.analytics,
                color: const Color(0xFFF59E0B),
                onPressed: () => onNavigate(1),
              ),
            ],
          ),

          const SizedBox(height: 28),

          LayoutBuilder(
            builder: (context, constraints) {
              final columns = constraints.maxWidth >= 1000
                  ? 4
                  : constraints.maxWidth >= 600
                      ? 2
                      : 1;

              final cardWidth =
                  (constraints.maxWidth - (columns - 1) * 16) /
                      columns;

              return Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  SizedBox(
                    width: cardWidth,
                    child: StatCard(
                      title: 'Total Revenue',
                      value: '\$24,580',
                      change: '+12.5% from last month',
                      icon: Icons.attach_money,
                      color: const Color(0xFF6366F1),
                      onTap: () => onNavigate(1),
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: StatCard(
                      title: 'Total Orders',
                      value: '1,245',
                      change: '+8.2% from last month',
                      icon: Icons.shopping_bag,
                      color: const Color(0xFF10B981),
                      onTap: () => onNavigate(4),
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: StatCard(
                      title: 'Customers',
                      value: '8,549',
                      change: '+15.3% from last month',
                      icon: Icons.people,
                      color: const Color(0xFFF59E0B),
                      onTap: () => onNavigate(2),
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: StatCard(
                      title: 'Products',
                      value: '452',
                      change: '+4.6% from last month',
                      icon: Icons.inventory_2,
                      color: const Color(0xFFEC4899),
                      onTap: () => onNavigate(3),
                    ),
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 32),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Revenue Analytics',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Your monthly revenue overview.',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 180,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(7, (index) {
                      final heights = [
                        60.0,
                        90.0,
                        70.0,
                        120.0,
                        100.0,
                        150.0,
                        170.0,
                      ];

                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          child: TweenAnimationBuilder<double>(
                            tween: Tween(
                              begin: 0,
                              end: heights[index],
                            ),
                            duration: Duration(
                              milliseconds: 500 + index * 100,
                            ),
                            curve: Curves.easeOutCubic,
                            builder: (context, height, child) {
                              return Container(
                                height: height,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF6366F1),
                                  borderRadius:
                                      BorderRadius.circular(8),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Recent Orders',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                ...[
                  ['ORD-001', 'John Smith', '\$250', 'Completed'],
                  ['ORD-002', 'Sarah Johnson', '\$180', 'Pending'],
                  ['ORD-003', 'Michael Brown', '\$420', 'Completed'],
                ].map((order) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFFEEF2FF),
                      child: Icon(
                        Icons.shopping_bag,
                        color: Color(0xFF6366F1),
                      ),
                    ),
                    title: Text(order[0]),
                    subtitle: Text(order[1]),
                    trailing: Text(
                      order[2],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () => onNavigate(4),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
