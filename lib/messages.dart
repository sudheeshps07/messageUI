import 'package:flutter/material.dart';
class messages{
  final String text;
  final DateTime date;
  final bool isSentByme;

  const messages({
    required this.text,
    required this.date,
    required this.isSentByme
});
}
