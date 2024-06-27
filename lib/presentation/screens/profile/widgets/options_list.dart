import 'package:flutter/material.dart';


class OptionsList extends StatelessWidget {
  const OptionsList({super.key, required this.options});
  final List options;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => options[index],
      separatorBuilder: (context, index) => Divider(
        endIndent: 27,
        indent: 77,
        color: Colors.grey.shade400,
      ),
      itemCount: options.length,
    );
  }
}

class ProfileListElement extends StatelessWidget {
  const ProfileListElement({
    required this.onTap,
    required this.icon,
    required this.text,
    super.key,
  });

  final IconData icon;
  final String text;
  final void Function(BuildContext context) onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.transparent,
      leading: Icon(icon, size: 30),
      title: Padding(
        padding: const EdgeInsets.only(left:8),
        child: Text(text),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      titleTextStyle: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontSize: 15),
      onTap: () => onTap(context),
    );
  }
}