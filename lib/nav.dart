import 'package:flutter/material.dart';

class Nav extends StatelessWidget {
  const Nav({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Chittakone'),
            accountEmail: Text('PHOUANGMIXAY'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://scontent.fvte5-1.fna.fbcdn.net/v/t39.30808-1/473594510_1332900597715140_3234408177667845323_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=104&ccb=1-7&_nc_sid=e99d92&_nc_eui2=AeH-hjD5Mt6P_xVq05G-5cQFebBnnZgfMxJ5sGedmB8zEqTkQHNcGOvcs646vqrASHQKAhrKqy5PgnZxAfZgOJqS&_nc_ohc=11AWEc26VxgQ7kNvwEveCbi&_nc_oc=AdmhpIYCLECLRhKbpF4gEhkInW1v-Wog-EovYjhZh5_rTVnK_iEFN5aChvvNNUsAwsM&_nc_zt=24&_nc_ht=scontent.fvte5-1.fna&_nc_gid=1XwI_6FCOQG2_TmWJk9dxQ&oh=00_AfbW6BnThqG1anHc4F_1KaWQnOezElF-7TGM7-I-n8_98g&oe=68E18DF1',
              ),
            ),
          ),
          ListTile(leading: Icon(Icons.account_box), title: Text('Account')),
          ListTile(leading: Icon(Icons.settings), title: Text('Setting')),
        ],
      ),
    );
  }
}
