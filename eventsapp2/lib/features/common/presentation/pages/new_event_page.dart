// ignore_for_file: use_build_context_synchronously

import 'package:events_app/core/resources/data_state.dart';
import 'package:events_app/core/utils/custom_snackbar.dart';
import 'package:events_app/core/utils/random_id.dart';
import 'package:events_app/features/common/data/models/event_model.dart';
import 'package:events_app/features/common/data/repositories_impl/event_repository_impl.dart';
import 'package:events_app/features/common/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class NewEventPage extends StatefulWidget {
  const NewEventPage({super.key});

  @override
  State<NewEventPage> createState() => _NewEventPageState();
}

class _NewEventPageState extends State<NewEventPage> {
  DateTime pickedDate = DateTime.now();
  // DateTime pickedTime = DateTime.now();
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController orgNameController = TextEditingController();
  TextEditingController donationMethodsController = TextEditingController();
  TextEditingController donationGoalController = TextEditingController();
  TextEditingController donationProgressController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Event"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 15),
                ElevatedButton.icon(
                  onPressed: () => _pickDate(context),
                  icon: const Icon(Icons.calendar_month),
                  label: Text(
                    "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}",
                  ),
                ),
                const SizedBox(width: 40),
                ElevatedButton.icon(
                  onPressed: () => _pickTime(context),
                  icon: const Icon(Icons.watch_later_outlined),
                  label: Text(
                    "${pickedDate.hour} : ${pickedDate.minute}",
                  ),
                ),
              ],
            ),
            CustomTextField(
              controller: nameController,
              hint: "Enter the event name",
              label: "Event Name",
              obscure: false,
            ),
            CustomTextField(
              controller: locationController,
              hint: "Enter the location",
              label: "Event Location",
              obscure: false,
            ),
            CustomTextField(
              controller: typeController,
              hint: "Enter the event type",
              label: "Event Type",
              obscure: false,
            ),
            CustomTextField(
              controller: orgNameController,
              hint: "Enter the organization name",
              label: "Organization Name",
              obscure: false,
            ),
            CustomTextField(
              controller: donationMethodsController,
              hint: "Enter the donation methods",
              label: "Donation Methods",
              obscure: false,
            ),
            CustomTextField(
              controller: donationGoalController,
              hint: "Enter the donation goal",
              label: "Donation Goal",
              obscure: false,
            ),
            CustomTextField(
              controller: donationProgressController,
              hint: "Enter the donation progress",
              label: "Donation Progress",
              obscure: false,
            ),
            CustomTextField(
              controller: descriptionController,
              hint: "Enter the event description",
              label: "Event Description",
              obscure: false,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveEvent();
        },
        child: const Icon(Icons.save),
      ),
    );
  }

  Future<void> _saveEvent() async {
    EventRepositoryImpl repo = EventRepositoryImpl();
    EventModel event = EventModel(
      id: randomId().toString(),
      name: nameController.text,
      date: pickedDate.toIso8601String(),
      time: pickedDate.toIso8601String(),
      location: locationController.text,
      type: typeController.text,
      organizationName: orgNameController.text,
      donationMethods: donationMethodsController.text,
      donationGoal: donationGoalController.text,
      donationProgress: donationProgressController.text,
      // donationGoal: double.parse(donationGoalController.text),
      // donationProgress: double.parse(donationProgressController.text),
      description: descriptionController.text,
    );
    DataState<EventModel> res = await repo.create(event);
    // print(">>>>>>>>>>8 ${res.data!.description}");
    if (res is DataFailure) {
      showCustomSnackBar(context, "Error while saving");
    } else {
      nameController.clear();
      locationController.clear();
      typeController.clear();
      orgNameController.clear();
      donationGoalController.clear();
      donationMethodsController.clear();
      donationProgressController.clear();
      descriptionController.clear();
      showCustomSnackBar(context, "Saved successfully!");
    }
  }

  Future<void> _pickDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  Future<void> _pickTime(BuildContext context) async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        // pickedTime = time;
        pickedDate = pickedDate.copyWith(hour: time.hour, minute: time.minute);
      });
    }
  }
}
