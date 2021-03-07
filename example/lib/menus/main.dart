import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:flutter/material.dart';

List<MenuItem> items = [
  new MenuItem<int>(
    id: 0,
    label: 'THE PADDOCK',
    icon: Icon(Icons.fastfood),
  ),
  new MenuItem<int>(
    id: 1,
    label: 'THE HERO',
    icon: Icon(Icons.person),
  ),
  new MenuItem<int>(
    id: 2,
    label: 'HELP US GROW',
    icon: Icon(Icons.terrain),
  ),
  new MenuItem<int>(
    id: 3,
    label: 'SETTINGS',
    icon: Icon(Icons.settings),
  ),
];
final menu = Menu(
  items: items.map((e) => e.copyWith(icon: null)).toList(),
);

final menuWithIcon = Menu(
  items: items,
);
