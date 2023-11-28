import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

import 'add_contact.dart';

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  Iterable<Contact>? _contacts;

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  Future<void> _loadContacts() async {
    final contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: _contacts != null
          ? ListView.builder(
        itemCount: _contacts!.length,
        itemBuilder: (context, index) {
          Contact contact = _contacts!.elementAt(index);
          return ListTile(
            title: Text(contact.displayName ?? ''),
            subtitle: Text(contact.phones!.isNotEmpty
                ? contact.phones!.first.value ?? ''
                : ''),
          );
        },
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddContactScreen(),
            ),
          ).then((_) {
            _loadContacts();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
