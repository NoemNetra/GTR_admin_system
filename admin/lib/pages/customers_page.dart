
import 'package:flutter/material.dart';

import '../widgets/animated_button.dart';
import '../widgets/section_title.dart';

class CustomersPage extends StatelessWidget {
  const CustomersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Customers',
            subtitle: 'Manage your customers.',
          ),
          const SizedBox(height: 24),
          AnimatedActionButton(
            label: 'Add Customer',
            icon: Icons.person_add,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Add customer action clicked!'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
