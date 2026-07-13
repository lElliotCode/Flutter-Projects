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
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

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
            RadioListTile(
              title: Text('Car'),
              subtitle: Text('Travel in a car'),
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
              subtitle: Text('Travel in a boat'),
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
              subtitle: Text('Travel in a plane'),
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
              subtitle: Text('Travel in a submarine'),
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
          ],
        ),

        CheckboxListTile(
          title: Text('Breakfast'),
          subtitle: Text('¿Desea recibir desayuno?'),
          value: wantsBreakfast,
          onChanged: (value) {
            setState(() {
              wantsBreakfast = !wantsBreakfast;
            });
          },
        ),
        CheckboxListTile(
          title: Text('Lunch'),
          subtitle: Text('¿Desea recibir almuerzo?'),
          value: wantsLunch,
          onChanged: (value) {
            setState(() {
              wantsLunch = !wantsLunch;
            });
          },
        ),
        CheckboxListTile(
          title: Text('Dinner'),
          subtitle: Text('¿Desea recibir cena?'),
          value: wantsDinner,
          onChanged: (value) {
            setState(() {
              wantsDinner = !wantsDinner;
            });
          },
        ),
      ],
    );
  }
}
