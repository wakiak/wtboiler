import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EquipmentForm extends StatefulWidget {
  final void Function(
      String name,
      double rentalRate,
      String imageUrl,
      String description,
      BuildContext context // <-- add the new context parameter
      ) onFormSubmit;

  EquipmentForm({required this.onFormSubmit});

  @override
  _EquipmentFormState createState() => _EquipmentFormState();
}

class _EquipmentFormState extends State<EquipmentForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  double _rentalRate = 0;
  String _imageUrl = '';
  String _description = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onFormSubmit(
        _name,
        _rentalRate,
        _imageUrl,
        _description,
        context, // <-- pass the new context here
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Equipment'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  onSaved: (value) => _name = value!,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter a name' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Rental Rate'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,2}')),
                  ],
                  onSaved: (value) => _rentalRate = double.parse(value!),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter a rental rate' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Image URL'),
                  onSaved: (value) => _imageUrl = value!,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter an image URL' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                  onSaved: (value) => _description = value!,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter a description' : null,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
