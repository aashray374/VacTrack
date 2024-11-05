import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/app_routes_constants.dart';
import '../../services/auth_services.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _FormState();
}

class _FormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _contactNumberController.dispose();
    _emailController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  void _submitForm() async{
    if (_formKey.currentState!.validate()) {
      AuthServices authServices = AuthServices();
      String? result = await authServices.setHospitalDetails(
          name: _nameController.text,
          address: _addressController.text,
          contactNumber: _contactNumberController.text,
          email: _emailController.text,
          website: _websiteController.text
      );

      if(result == null){
        GoRouter.of(context).pushReplacementNamed(MyRoutesConstants.home);
      }else{
        // sho
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(
            controller: _nameController,
            label: "Hospital Name",
            hint: "Enter hospital name",
            validator: (value) =>
            value!.isEmpty ? "Please enter hospital name" : null,
          ),
          const SizedBox(height: 15),
          _buildTextField(
            controller: _addressController,
            label: "Address",
            hint: "Enter hospital address",
            validator: (value) =>
            value!.isEmpty ? "Please enter address" : null,
          ),
          const SizedBox(height: 15),
          _buildTextField(
            controller: _contactNumberController,
            label: "Contact Number",
            hint: "Enter contact number",
            keyboardType: TextInputType.phone,
            validator: (value) =>
            value!.isEmpty ? "Please enter contact number" : null,
          ),
          const SizedBox(height: 15),
          _buildTextField(
            controller: _emailController,
            label: "Email",
            hint: "Enter email",
            keyboardType: TextInputType.emailAddress,
            validator: (value) => value!.isEmpty || !value.contains('@')
                ? "Please enter a valid email"
                : null,
          ),
          const SizedBox(height: 15),
          _buildTextField(
            controller: _websiteController,
            label: "Website",
            hint: "Enter website",
            keyboardType: TextInputType.url,
            validator: (value) =>
            value!.isEmpty ? "Please enter website URL" : null,
          ),
          const SizedBox(height: 25),
          Center(
            child: ElevatedButton(
              onPressed: _submitForm,
              child: const Text("Submit"),
            ),
          ),
        ],
      ),
    );
  }




  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      ),
      validator: validator,
    );
  }
}
