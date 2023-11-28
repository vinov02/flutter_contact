import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import '../contact/string.dart';


class AddContactScreen extends StatefulWidget {
  @override
  _AddContactScreenState createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.add_contacts),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: Strings.name),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: Strings.phone),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final newContact = Contact(
                  givenName :_nameController.text,
                  phones: [Item(label: Strings.mobile, value: _phoneController.text)],
                );

                await ContactsService.addContact(newContact);
                Navigator.pop(context);
              },
              child: Text(Strings.save_contact),
            ),
          ],
        ),
      ),
    );
  }
}
