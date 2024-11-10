import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../models/child.dart';
import '../../services/image_services.dart';

class ChildDetailsForm extends StatefulWidget {
  const ChildDetailsForm({super.key});

  @override
  State<ChildDetailsForm> createState() => _ChildDetailsFormState();
}

class _ChildDetailsFormState extends State<ChildDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _aadharController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  double? _gender;
  DateTime? _dob;
  File? _selectedImage;


  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _dob = pickedDate;
        _dobController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  Future<void> _pickImage() async {
    File? temp = await ImageServices.pickImage();
    setState(() {
      _selectedImage = temp;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Child child = Child(
        name: _nameController.text,
        adahar: _aadharController.text,
        gender: _gender!,
        dob: _dobController.text,
        img: _selectedImage?.path,
      );

      GoRouter.of(context).pop();
    }
  }



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image Section
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue[100],
                backgroundImage:
                _selectedImage != null ? FileImage(_selectedImage!) : null,
                child: _selectedImage == null
                    ? Icon(Icons.add_a_photo, size: 30, color: Colors.blue[700])
                    : null,
              ),
            ),
            const SizedBox(height: 10),
            const Text("Tap to select an image", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),

            // Input Fields Section
            _buildTextField(
              controller: _nameController,
              label: "Name",
              hint: "Enter child's name",
              validator: (value) => value!.isEmpty ? "Please enter a name" : null,
            ),
            const SizedBox(height: 15),
            _buildTextField(
              controller: _aadharController,
              label: "Aadhar",
              hint: "Enter Aadhar number",
              keyboardType: TextInputType.number,
              validator: (value) => value!.isEmpty ? "Please enter Aadhar number" : null,
            ),
            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<double>(
                    value: _gender,
                    decoration: InputDecoration(
                      labelText: "Gender",
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(value: 1.0, child: Text("Male")),
                      DropdownMenuItem(value: 2.0, child: Text("Female")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                    validator: (value) =>
                    value == null ? "Please select gender" : null,
                  ),
                ),
                const SizedBox(width: 15),

                // Date of Birth Field
                Expanded(
                  child: TextFormField(
                    controller: _dobController,
                    readOnly: true,
                    onTap: _pickDate,
                    decoration: InputDecoration(
                      labelText: "Date of Birth",
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      suffixIcon: const Icon(Icons.calendar_today),
                    ),
                    validator: (value) =>
                    value!.isEmpty ? "Please select Date of Birth" : null,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.blue,
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      validator: validator,
    );
  }
}
