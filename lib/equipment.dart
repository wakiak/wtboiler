import 'package:flutter/material.dart';

class Equipment {
  final String name;
  final String description;
  final double rentalRate;
  final List<String> images;

  Equipment({
    required this.name,
    required this.description,
    required this.rentalRate,
    required this.images,
  });
}
