import 'package:flutter/material.dart';

class UIControlsScreen extends StatelessWidget {
  static const name = 'ui-controls';

  const UIControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UI Controls')),
      body: _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: Text('Switch List Tile'),
          subtitle: Text('Información extra sobre dev mode'),
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
        ),

        ExpansionTile(
          title: Text('Expansion Tile'),
          subtitle: Text('Subtitulo'),
          children: [
            ListTile(title: Text('Item 1')),
            ListTile(title: Text('Item 2')),
            ListTile(title: Text('Item 3')),
          ],
        ),

        RadioListTile(
          title: Text('Car'),
          subtitle: Text('Subtitulo pues'),
          value: Transportation.car,
          // ignore: deprecated_member_use
          groupValue: selectedTransportation,
          // ignore: deprecated_member_use
          onChanged: (value) {
            setState(() {
              selectedTransportation = Transportation.car;
            });
          },
        ),

        RadioListTile(
          title: Text('Boat'),
          subtitle: Text('Subtitulo pues'),
          value: Transportation.boat,
          // ignore: deprecated_member_use
          groupValue: selectedTransportation,
          // ignore: deprecated_member_use
          onChanged: (value) {
            setState(() {
              selectedTransportation = Transportation.boat;
            });
          },
        ),

        RadioListTile(
          title: Text('Plane'),
          subtitle: Text('Subtitulo pues'),
          value: Transportation.plane,
          // ignore: deprecated_member_use
          groupValue: selectedTransportation,
          // ignore: deprecated_member_use
          onChanged: (value) {
            setState(() {
              selectedTransportation = Transportation.plane;
            });
          },
        ),

        RadioListTile(
          title: Text('Submarine'),
          subtitle: Text('Subtitulo pues'),
          value: Transportation.submarine,
          // ignore: deprecated_member_use
          groupValue: selectedTransportation,
          // ignore: deprecated_member_use
          onChanged: (value) {
            setState(() {
              selectedTransportation = Transportation.submarine;
            });
          },
        ),

        CheckboxListTile(
          title: Text('Checkbox List Tile'),
          subtitle: Text('Subtitulo'),
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
        ),
      ],
    );
  }
}
