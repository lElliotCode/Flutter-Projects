import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subtitle: 'Types of Buttons',
    link: '/buttons',
    icon: Icons.media_bluetooth_on,
  ),

  MenuItem(
    title: 'Tarjetas',
    subtitle: 'Contenedor Estilizado',
    link: '/cards',
    icon: Icons.credit_card_off,
  ),

  MenuItem(
    title: 'Progress Indicators',
    subtitle: 'Generales y Controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
];
