import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';


class SettingsUI extends StatefulWidget {
  final String title = "Einstellungen";
  SettingsUI({Key? key}) : super(key: key);

  @override
  _SettingsUIState createState() => _SettingsUIState();
}

class _SettingsUIState extends State<SettingsUI> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            titlePadding: EdgeInsets.all(20),
            title: 'Allgemeine Einstellungen',
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.switchTile(
                title: 'Use System Theme',
                leading: Icon(Icons.phone_android),
                switchValue: isSwitched,
                onToggle: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
            ],
          ),
          SettingsSection(
            titlePadding: EdgeInsets.all(20),
            title: 'Sicherheit und Datenschutz',
            tiles: [
              SettingsTile(
                title: 'Sicherheit',
                subtitle: 'Fingerabdruck',
                leading: Icon(Icons.lock),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.switchTile(
                title: 'Fingerabdruck verwenden',
                leading: Icon(Icons.fingerprint),
                switchValue: true,
                onToggle: (value) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}