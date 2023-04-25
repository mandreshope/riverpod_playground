import 'package:app/pages/practical_work/services/data_validator_service.dart';
import 'package:app/pages/practical_work/vehicle_manager_page.dart';
import 'package:app/pages/practical_work/view_models/vehicle_manager_view_model.dart';
import 'package:app/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddButtonConsumer extends ConsumerWidget {
  const AddButtonConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canAdd = ref.watch(canAddProvider);
    return AppButton(
      text: 'Add',
      onPressed: canAdd
          ? () {
              ref.read(vehicleManagerViewModelProvider).addVehicle(
                    name: ref.read(nameProvider),
                    year: ref.read(yearProvider),
                    description: ref.read(descriptionProvider),
                  );
            }
          : null,
    );
  }
}
