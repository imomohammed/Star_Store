import 'package:flutter/material.dart';
class SettingBody extends StatelessWidget {
  const SettingBody({super.key, required this.icon, required this.title, required this.subtitle, this.trailing, this.onTap});

  final IconData icon;
  final  String title,subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Icon(icon, size: 28,color: Colors.black87,),
      title: Text(title, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black87),),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 14,color: Colors.black87),),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
