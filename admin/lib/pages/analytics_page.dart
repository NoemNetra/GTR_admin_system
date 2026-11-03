
import 'package:flutter/material.dart';

import '../widgets/section_title.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(
            title: 'Analytics',
            subtitle: 'View your business performance.',
          ),
          SizedBox(height: 30),
          Card(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                'Analytics charts and reports will appear here.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
