import 'package:app/pages/practical_work/vehicle_manager_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dataValidatorServiceProvider = Provider<DataValidatorService>((ref) {
  return const DataValidatorService();
});

final canAddProvider = Provider<bool>(
  (ref) {
    final validator = ref.read(dataValidatorServiceProvider);
    return validator.nameIsValid(ref.watch(nameProvider)) &&
        validator.yearIsValid(ref.watch(yearProvider));
  },
);

class DataValidatorService {
  const DataValidatorService();
  bool yearIsValid(String year) {
    return int.tryParse(year) != null;
  }

  bool nameIsValid(String name) {
    return name.isNotEmpty;
  }
}
