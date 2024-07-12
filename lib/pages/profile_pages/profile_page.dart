import 'package:flutter/material.dart';
import 'package:themovie/pages/profile_pages/profile_page_appbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: ProfilePageAppBar(),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    ProfileButton(
                        icon: Icons.hd_outlined, text: 'Качество видео'),
                    SizedBox(
                      height: 20,
                    ),
                    ProfileButton(
                        icon: Icons.info_outline, text: 'О приложении'),
                    SizedBox(
                      height: 20,
                    ),
                    ProfileButton(icon: Icons.email_outlined, text: 'Контакты'),
                    SizedBox(
                      height: 20,
                    ),
                    ProfileButton(
                        icon: Icons.speed, text: 'Скорость соединения'),
                    SizedBox(
                      height: 20,
                    ),
                    ProfileButton(
                        icon: Icons.person_2_outlined,
                        text: 'Написать разработчику')
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  final String text;
  final IconData icon;
  const ProfileButton({
    required this.icon,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey[10],
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.grey,
                size: 28,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
