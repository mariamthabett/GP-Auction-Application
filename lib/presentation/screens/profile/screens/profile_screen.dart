import 'package:flutter/material.dart';

import '../../../../core/navigator/named_routes.dart';
import '../../../../core/navigator/navigator.dart';
import '../../Favorites/presentation/widgets/new_app_bar.dart';
import '../widgets/options_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewAppBar(title: 'Profile'),
      body: OptionsList(
        options: [
          ProfileListElement(
              icon: Icons.person_2_outlined,
              text: 'Contact us',
              onTap: (context) => showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        content: Text(
                            'If you have any questions, please contact us',
                            softWrap: true),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('Okay')),
                        ],
                      ))),
          ProfileListElement(
              icon: Icons.shopping_bag_outlined,
              text: 'Log out',
              onTap: (_) => Go.offAllNamed(NamedRoutes.login)),
        ],
      ),
    );
  }
}
