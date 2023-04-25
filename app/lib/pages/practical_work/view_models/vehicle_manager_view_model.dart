import 'package:app/pages/practical_work/services/data_validator_service.dart';
import 'package:app/pages/practical_work/vehicle_manager_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final vehicleManagerViewModelProvider =
    Provider<VehicleManagerViewModel>((ref) {
  return VehicleManagerViewModel(
    ref: ref,
    dataValidatorService: ref.read(dataValidatorServiceProvider),
  );
});

class VehicleManagerViewModel {
  const VehicleManagerViewModel({
    required this.ref,
    required this.dataValidatorService,
  });
  final Ref ref;
  final DataValidatorService dataValidatorService;
  void addVehicle({
    required String name,
    required String year,
    required String description,
  }) {
    ref.read(vehiclesProvider.notifier).state = [
      ...ref.read(vehiclesProvider.notifier).state,
      Vehicle(
        id: const Uuid().v1(),
        name: name,
        year: year,
        description: description,
      )
    ];
  }

  void deleteVehicle(String id) {
    ref.read(vehiclesProvider.notifier).state = [
      ...ref.read(vehiclesProvider.notifier).state
    ]..removeWhere((e) => e.id == id);
  }
}
