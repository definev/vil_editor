import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> bootstraps(Widget app) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: app));
}
