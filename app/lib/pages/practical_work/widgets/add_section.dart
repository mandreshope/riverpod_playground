import 'package:app/pages/practical_work/vehicle_manager_page.dart';
import 'package:app/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class AddSection extends ConsumerWidget {
  const AddSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    final year = ref.watch(yearProvider);
    final description = ref.watch(descriptionProvider);
    final canAdd = name.isNotEmpty && yearIsValid(year);
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      color: Colors.tealAccent,
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Name',
            ),
            onChanged: (value) {
              ref.read(nameProvider.notifier).state = value;
            },
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Year',
            ),
            onChanged: (value) {
              ref.read(yearProvider.notifier).state = value;
            },
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Description',
            ),
            onChanged: (value) {
              ref.read(descriptionProvider.notifier).state = value;
            },
          ),
          AppButton(
            text: 'Add',
            onPressed: canAdd
                ? () {
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
                : null,
          ),
        ],
      ),
    );
  }
}
