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

  MenuItem(
    title: 'Snackbars y dialogs',
    subtitle: 'Indicadores en pantalla',
    link: '/snackbar',
    icon: Icons.info_outline,
  ),

  MenuItem(
    title: 'Animated Container',
    subtitle: 'Contenedor Animado',
    link: '/animated',
    icon: Icons.animation,
  ),

  MenuItem(
    title: 'UI Controls & Tiles',
    subtitle: 'Serie de controles de Flutter',
    link: '/ui-controls',
    icon: Icons.car_rental_rounded,
  ),

  MenuItem(
    title: 'Tutorial View',
    subtitle: 'Paso a paso de la aplicación',
    link: '/tutorial',
    icon: Icons.accessibility_new_outlined,
  ),

  MenuItem(
    title: 'Infinite Scroll & Pull to Refresh',
    subtitle: 'Página con Scroll Infinito y refresh',
    link: '/infinite',
    icon: Icons.more_time_outlined,
  ),
];
