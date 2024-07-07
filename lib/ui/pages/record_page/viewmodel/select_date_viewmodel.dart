import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedDateProvider = StateProvider<DateTime?>((ref) => null);

final selectedTimeProvider = StateProvider<TimeOfDay?>((ref) => null);
