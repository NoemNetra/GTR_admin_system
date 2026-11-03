
import 'package:flutter/material.dart';

import '../widgets/section_title.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(
            title: 'Orders',
            subtitle: 'Manage and track customer orders.',
          ),
          SizedBox(height: 24),
          Card(
            child: ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text('ORD-001'),
              subtitle: Text('Order completed'),
              trailing: Icon(Icons.check_circle, color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
