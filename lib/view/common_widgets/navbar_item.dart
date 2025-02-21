import 'package:flutter/material.dart';

class NavbarItem extends StatefulWidget {
  final IconData itemIcon;
  final String itemName;
  final bool isSelected;

  const NavbarItem({
    super.key,
    required this.itemIcon,
    required this.itemName,
    required this.isSelected,
  });

  @override
  State<NavbarItem> createState() => _NavbarItemState();
}

class _NavbarItemState extends State<NavbarItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          widget.itemIcon,
          color: widget.isSelected ? Colors.green : Colors.grey,
        ),
        Text(
          widget.itemName,
          style: TextStyle(
            color: widget.isSelected ? Colors.green : Colors.grey,
          ),
        ),
      ],
    );
  }
}
