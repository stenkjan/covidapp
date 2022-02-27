import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter/services.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool lockInBackground = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        backgroundColor: const Color(0xFF313237),
        centerTitle: true,
        title: const Text(
          "Einstellungen",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Sans",
              fontSize: 17.0,
              fontWeight: FontWeight.w600),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0.0,
      ),
      body: buildSettingsList(),
    );
  }

  Widget buildSettingsList() {
    return SettingsList(
      sections: [
        SettingsSection(
          title: const Text('Common'),
          tiles: [
            SettingsTile(
              title: const Text('Environment'),
              leading: const Icon(Icons.cloud_queue),
            ),
          ],
        ),
        SettingsSection(
          title: const Text('Account'),
          tiles: [
            SettingsTile(
                title: const Text('Telefonnummer'),
                leading: const Icon(Icons.phone)),
            SettingsTile(
                title: const Text('Email'), leading: const Icon(Icons.email)),
            SettingsTile(
                title: const Text('Sign out'),
                leading: const Icon(Icons.exit_to_app)),
          ],
        ),
        SettingsSection(
          title: const Text('Security'),
          tiles: [
            SettingsTile.switchTile(
              title: const Text('Lock app in background'),
              leading: const Icon(Icons.phonelink_lock),
              initialValue: lockInBackground,
              onToggle: (bool value) {
                setState(() {
                  lockInBackground = value;
                  notificationsEnabled = value;
                });
              },
            ),
            SettingsTile.switchTile(
              title: const Text('Use fingerprint'),
              // subtitle: 'Allow application to access stored fingerprint IDs.',
              leading: const Icon(Icons.fingerprint),
              onToggle: (bool value) {},
              initialValue: false,
            ),
            SettingsTile.switchTile(
              title: const Text('Change password'),
              leading: const Icon(Icons.lock),
              initialValue: true,
              onToggle: (bool value) {},
            ),
            SettingsTile.switchTile(
              title: const Text('Enable Notifications'),
              //enabled: notificationsEnabled,
              leading: const Icon(Icons.notifications_active),
              initialValue: true,
              onToggle: (value) {},
            ),
          ],
        ),
        SettingsSection(
          title: const Text('Misc'),
          tiles: [
            SettingsTile(
                title: const Text('Terms of Service'),
                leading: const Icon(Icons.description)),
            SettingsTile(
                title: const Text('Open source licenses'),
                leading: const Icon(Icons.collections_bookmark)),
          ],
        ),
      ],
    );
  }
}
