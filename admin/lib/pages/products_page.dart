
import 'package:flutter/material.dart';

import '../widgets/animated_button.dart';
import '../widgets/section_title.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Products',
            subtitle: 'Manage your inventory.',
          ),
          const SizedBox(height: 24),
          AnimatedActionButton(
            label: 'Add Product',
            icon: Icons.add,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Add product action clicked!'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

