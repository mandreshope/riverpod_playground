import 'package:app/pages/practical_work/widgets/add_section.dart';
import 'package:app/pages/practical_work/widgets/app_bar.dart';
import 'package:app/pages/practical_work/widgets/vehicle_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final showAddSectionProviderProvider = StateProvider<bool>((ref) {
  return false;
});

final vehiclesProvider = StateProvider<List<Vehicle>>((ref) {
  return [];
});

final nameProvider = StateProvider<String>((ref) {
  return '';
});
final yearProvider = StateProvider<String>((ref) {
  return '';
});
final descriptionProvider = StateProvider<String>((ref) {
  return '';
});

final vehiclesProviderProvider = StateProvider<List<Vehicle>>((ref) {
  return <Vehicle>[];
});

class Vehicle {
  const Vehicle({
    required this.id,
    required this.name,
    required this.year,
    required this.description,
  });

  final String id;
  final String name;
  final String year;
  final String description;
}

class VehicleManagerPage extends StatelessWidget {
  const VehicleManagerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'PracticalWork'),
      body: Consumer(
        builder: (context, ref, widget) {
          final showAddSection = ref.watch(showAddSectionProviderProvider);
          return Column(
            children: [
              if (showAddSection) const AddSection(),
              const Text('Vehicle list :'),
              const Expanded(
                child: VehicleList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
