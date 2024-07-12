import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePageAppBar extends StatelessWidget {
  const ProfilePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: const Image(
        image: AssetImage('assets/cinema.jpg'),
        fit: BoxFit.cover,
      ),
      systemOverlayStyle:
          const SystemUiOverlayStyle(systemNavigationBarColor: Colors.black),
      toolbarHeight: 200,
      foregroundColor: Colors.white,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Авторизация',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 22,
          ),
          const Text(
            'Получите доступ к любимым сериалам на всех устройствах',
            softWrap: true,
            overflow: TextOverflow.clip,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 22,
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/auth_'),
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white),
                foregroundColor: WidgetStatePropertyAll(Colors.black),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))))),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Text(
                'ВОЙТИ/СОЗДАТЬ АККАУНТ',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
