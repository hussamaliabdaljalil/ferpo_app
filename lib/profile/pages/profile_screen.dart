import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'profile_screen',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
              size: 30,
            ),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 80,
                    //backgroundImage: AssetImage('assets/images/jpg/img.jpg'),
                    backgroundColor: Colors.grey,
                  ),
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white.withOpacity(1),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        size: 33,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'First NameLast Name',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Email: N/A'),
                  ),
                ),
              ),
              //  const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Phone: N/A'),
                  ),
                ),
              ),
              // const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Address:  Damascus/Syria'),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (context.locale.languageCode == 'en') {
                    context.setLocale(const Locale('ar'));
                  } else {
                    context.setLocale(const Locale('en'));
                  }
                },
                child: Text('change_language'.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
