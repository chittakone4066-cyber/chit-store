import 'package:flutter/material.dart';
import 'package:flutter_defaulttabcontroller/user.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.fname} ${user.lname}'),
        backgroundColor: const Color.fromARGB(255, 148, 104, 156),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Account Details',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            const SizedBox(height: 20),

            _buildSectionHeader(
              title: 'Personal Information',
              icon: Icons.person_outline,
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  _buildDetailTile(
                    Icons.perm_identity,
                    'User ID',
                    user.id.toString(),
                  ),
                  _buildDetailTile(
                    Icons.badge_outlined,
                    'First Name',
                    user.fname,
                  ),
                  _buildDetailTile(
                    Icons.badge_outlined,
                    'Last Name',
                    user.lname,
                  ),
                  _buildDetailTile(
                    Icons.alternate_email,
                    'Username',
                    user.username,
                  ),
                  _buildDetailTile(Icons.email_outlined, 'Email', user.email),
                  _buildDetailTile(
                    Icons.lock_outline,
                    'Password',
                    user.password,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildSectionHeader(
              title: 'Address Details',
              icon: Icons.location_on_outlined,
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  _buildDetailTile(Icons.location_city, 'City', user.city),
                  _buildDetailTile(Icons.home_outlined, 'Street', user.street),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader({required String title, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 5.0, top: 10.0),
      child: Row(
        children: [
          Icon(icon, color: const Color.fromARGB(255, 148, 104, 156)),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailTile(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey.shade600),
      title: Text(label),
      trailing: Text(
        value,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      dense: true,
    );
  }
}
