import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Perfil'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile.avif'),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  // Acción para editar la imagen de perfil
                },
                child: const Text(
                  'Editar imagen de perfil',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const SizedBox(height: 16),
              _buildProfileItem('Nombre', 'Diego Carmona Bernal'),
              _buildProfileItem('Nombre de usuario', '@cbdiegox'),
              _buildProfileItem('Correo', 'cbdiegox@gmail.com'),
              _buildProfileLinks(['website.net', 'mylink.net', 'yourlink.net']),
              _buildProfileItem('Biografia', 'Descripción del usuario.'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configuración',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: 2, // Índice del elemento seleccionado
        onTap: (index) {
          // Acción al tocar un ítem del BottomNavigationBar
        },
      ),
    );
  }

  Widget _buildProfileItem(String title, String value) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          subtitle: Text(value),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Acción al tocar el ítem
          },
        ),
        const Divider(),
      ],
    );
  }

  Widget _buildProfileLinks(List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ListTile(
          title: Text('Links'),
        ),
        Column(
          children: links.map((link) {
            return Column(
              children: [
                ListTile(
                  title: Text(link),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Acción al tocar el link
                  },
                ),
                const Divider(),
              ],
            );
          }).toList(),
        ),
        ListTile(
          title: const Text(
            '+ Agregar link',
            style: TextStyle(color: Colors.blue),
          ),
          onTap: () {
            // Acción para añadir un link
          },
        ),
        const Divider(),
      ],
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Configuración del Perfil',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const ProfilePage(),
    );
  }
}
