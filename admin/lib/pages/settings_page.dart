
import 'package:flutter/material.dart';

import '../widgets/section_title.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Settings',
            subtitle: 'Customize your dashboard.',
          ),
          const SizedBox(height: 24),

          SwitchListTile(
            title: const Text('Notifications'),
            subtitle: const Text('Enable notifications'),
            value: notificationsEnabled,
            onChanged: (value) {
              setState(() {
                notificationsEnabled = value;
              });
            },
          ),

          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Enable dark mode preference'),
            value: darkModeEnabled,
            onChanged: (value) {
              setState(() {
                darkModeEnabled = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
