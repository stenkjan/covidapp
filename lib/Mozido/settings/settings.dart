import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool lockInBackground = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings UI')),
      body: buildSettingsList(),
    );
  }

  Widget buildSettingsList() {
    return SettingsList(
      sections: [
        SettingsSection(
          title: Text('Common'),
          tiles: [
            SettingsTile(
              title: Text('Environment'),
              leading: Icon(Icons.cloud_queue),
            ),
          ],
        ),
        SettingsSection(
          title: Text('Account'),
          tiles: [
            SettingsTile(
                title: Text('Phone number'), leading: Icon(Icons.phone)),
            SettingsTile(title: Text('Email'), leading: Icon(Icons.email)),
            SettingsTile(
                title: Text('Sign out'), leading: Icon(Icons.exit_to_app)),
          ],
        ),
        SettingsSection(
          title: Text('Security'),
          tiles: [
            SettingsTile.switchTile(
              title: Text('Lock app in background'),
              leading: Icon(Icons.phonelink_lock),
              initialValue: lockInBackground,
              onToggle: (bool value) {
                setState(() {
                  lockInBackground = value;
                  notificationsEnabled = value;
                });
              },
            ),
            SettingsTile.switchTile(
              title: Text('Use fingerprint'),
              // subtitle: 'Allow application to access stored fingerprint IDs.',
              leading: Icon(Icons.fingerprint),
              onToggle: (bool value) {},
              initialValue: false,
            ),
            SettingsTile.switchTile(
              title: Text('Change password'),
              leading: Icon(Icons.lock),
              initialValue: true,
              onToggle: (bool value) {},
            ),
            SettingsTile.switchTile(
              title: Text('Enable Notifications'),
              //enabled: notificationsEnabled,
              leading: Icon(Icons.notifications_active),
              initialValue: true,
              onToggle: (value) {},
            ),
          ],
        ),
        SettingsSection(
          title: Text('Misc'),
          tiles: [
            SettingsTile(
                title: Text('Terms of Service'),
                leading: Icon(Icons.description)),
            SettingsTile(
                title: Text('Open source licenses'),
                leading: Icon(Icons.collections_bookmark)),
          ],
        ),
      ],
    );
  }
}
