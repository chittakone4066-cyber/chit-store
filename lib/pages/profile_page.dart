import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              "https://scontent-bkk1-2.xx.fbcdn.net/v/t39.30808-1/473594510_1332900597715140_3234408177667845323_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=104&ccb=1-7&_nc_sid=e99d92&_nc_eui2=AeH-hjD5Mt6P_xVq05G-5cQFebBnnZgfMxJ5sGedmB8zEqTkQHNcGOvcs646vqrASHQKAhrKqy5PgnZxAfZgOJqS&_nc_ohc=W8JQHCeFFw0Q7kNvwG8A3LE&_nc_oc=AdmuZNYPZsFku_YAZQHjXRqfK6wIuaUwEOuSN4l6V3xhNVjAN7tIqivQ-rXaMnd1LwQ&_nc_zt=24&_nc_ht=scontent-bkk1-2.xx&_nc_gid=JN2_MaBn_oxvmI8-R-VpRg&oh=00_AfY7CwUoLQHY7Dx0GUsHf5KESoT5I27JeENZqT-QCrYvwg&oe=68D14B71",
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Chittakone",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text("chittakone@gmail.com"),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("ກາຍັງວ່າຢ່າກົດຫ້ວຍ")),
              );
            },
            icon: const Icon(Icons.edit),
            label: const Text("Edit Profile"),
          ),
        ],
      ),
    );
  }
}
