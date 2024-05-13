import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class IGetController<T extends Object> extends StatelessWidget {
  const IGetController({super.key});

  final String? tag = null;

  T get controller => GetIt.I.get<T>();

  @override
  Widget build(BuildContext context);
}