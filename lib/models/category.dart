import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color bgColor;

  const Category({required this.id, required this.title, this.bgColor = Colors.teal});
}