import 'package:app/pages/practical_work/vehicle_manager_page.dart';
import 'package:app/pages/practical_work/view_models/vehicle_manager_view_model.dart';
import 'package:app/router/go_router_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VehicleList extends ConsumerWidget {
  const VehicleList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicles = ref.watch(vehiclesProvider);
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: vehicles.length,
      itemBuilder: (BuildContext context, int index) {
        final vehicle = vehicles[index];
        final id = vehicle.id;
        return ListTile(
          title: Text(vehicle.name),
          subtitle: Text(id),
          trailing: IconButton(
            onPressed: () {
              ref.read(vehicleManagerViewModelProvider).deleteVehicle(id);
            },
            icon: const Icon(Icons.delete),
          ),
          onTap: () {
            // currentVehicles = vehicles;
            VehicleDetailsRoute(vehicleId: id).go(context);
          },
        );
      },
    );
  }
}
