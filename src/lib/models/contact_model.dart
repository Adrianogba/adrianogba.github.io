import 'package:flutter/material.dart';

class ContactModel {
  final String label;
  final String value;
  final String? url;
  final IconData icon;
  final Color? color;

  ContactModel({
    required this.label,
    required this.value,
    required this.icon,
    this.url,
    this.color,
  });
}