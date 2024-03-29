import 'package:covidapp/covidapp/uebungen/breathing/constants.dart';
import 'package:covidapp/covidapp/uebungen/breathing/themes.dart';
import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'settings_controller.dart';

/// Settingspage-- Widget build  */

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CalendarContent calContent = Provider.of<CalendarContent>(context);
    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            "Einstellungen",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Sans",
                fontSize: 17.0,
                fontWeight: FontWeight.w600),
          )),
      /**c as Variable for implemtation on other Classes */
      body: GetX<SettingsController>(
          init: SettingsController(),
          builder: (c) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Hintergrund Farbe',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 10),
                  ToggleButtons(
                    isSelected: c.isSelected,
                    borderWidth: 3,
                    selectedBorderColor: Colors.white,
                    borderColor: Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    onPressed: (index) {
                      c.selectBackground(index, context);
                    },
                    children: [
                      for (BackgroundColors theme in c.themes) ...[
                        Container(
                          color: backgrounds[theme],
                          width: 50,
                        )
                      ]
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Timers',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Gesamtzeit [min]',
                            style: Theme.of(context).textTheme.headline6),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  c.increaseTotalTime();
                                  calContent.getBreatheMin(c.totalTimeString);
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_up,
                                  size: 32,
                                )),
                            Text(
                              '${c.totalTimeString} min',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            IconButton(
                                onPressed: () {
                                  c.decreaseTotalTime();
                                  calContent.getBreatheMin(c.totalTimeString);
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  size: 32,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Einatmungszeit [sec]',
                            style: Theme.of(context).textTheme.headline6),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () => c.increaseBreathTime(),
                                icon: const Icon(
                                  Icons.arrow_drop_up,
                                  size: 32,
                                )),
                            Text(
                              '${c.breathTimeString} sec',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            IconButton(
                                onPressed: () => c.decreaseBreathTime(),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  size: 32,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                 
                  SwitchListTile(
                    value: c.soundOn.value,
                    onChanged: (value) => c.setSoundOn(value),
                    activeColor: Colors.white,
                    title: const Text('Sound'),
                    secondary: Icon(
                      c.soundOn.value ? Icons.volume_up : Icons.volume_mute,
                      color: Colors.white,
                    ),
                  ),
                
                ],
              ),
            );
          }),
    );
  }
}
