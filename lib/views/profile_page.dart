import 'package:flutter/material.dart';
import 'home_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
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
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else if (index == 1) {
            // Handle settings navigation
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/profile');
          }
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
