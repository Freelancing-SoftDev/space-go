import 'package:canteen_app/services/add_menu.dart';
import 'package:canteen_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class AddMenuItemDialog extends StatefulWidget {
  const AddMenuItemDialog({Key? key}) : super(key: key);

  @override
  _AddMenuItemDialogState createState() => _AddMenuItemDialogState();
}

class _AddMenuItemDialogState extends State<AddMenuItemDialog> {
  final _formKey = GlobalKey<FormState>();

  late String _menuName;
  late String _menuDescription;
  late double _menuPrice;

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Menu Item'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onSaved: (value) => _menuName = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Name cannot be empty' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                onSaved: (value) => _menuDescription = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSaved: (value) => _menuPrice = double.tryParse(value!)!,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Price cannot be empty';
                  } else {
                    final price = double.tryParse(value);
                    return price == null ? 'Invalid price' : null;
                  }
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ElevatedButton(
          child: const Text('Save'),
          onPressed: () {
            final form = _formKey.currentState;
            if (form!.validate()) {
              form.save();

              Navigator.of(context).pop();

              addMenu(
                  box.read('name'), _menuName, _menuDescription, _menuPrice);

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: TextRegular(
                      text: 'Menu Added Succesfully!',
                      fontSize: 14,
                      color: Colors.white)));
            }
          },
        ),
      ],
    );
  }
}
