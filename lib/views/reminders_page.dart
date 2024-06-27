import 'package:flutter/material.dart';
import 'reminders_details_page.dart'; // Asegúrate de que la ruta sea correcta

class RemindersPage extends StatefulWidget {
  const RemindersPage({super.key, required this.title});

  final String title;

  @override
  State<RemindersPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {
  final List<Map<String, String>> reminders = [
    {
      'task': 'FIG-121',
      'title': 'Write blog post for demo day',
      'priority': 'Alto'
    },
    {'task': 'FIG-122', 'title': 'Publish blog page', 'priority': 'Bajo'},
    {
      'task': 'FIG-123',
      'title': 'Add gradients to design sys...',
      'priority': 'Medio'
    },
    {
      'task': 'FIG-124',
      'title': 'Responsive behavior doesn\'t...',
      'priority': 'Medio'
    },
    {
      'task': 'FIG-125',
      'title': 'Confirmation states not ren...',
      'priority': 'Medio'
    },
    {
      'task': 'FIG-126',
      'title': 'Revise copy on the About p...',
      'priority': 'Bajo'
    },
    {
      'task': 'FIG-127',
      'title': 'Text wrapping is awkward o...',
      'priority': 'Bajo'
    },
    {'task': 'FIG-128', 'title': 'Publish HackerNews post', 'priority': 'Bajo'},
    {
      'task': 'FIG-129',
      'title': 'Review image licensing for...',
      'priority': 'Alto'
    },
    {
      'task': 'FIG-130',
      'title': 'Accessibility focused state f...',
      'priority': 'Alto'
    },
    {
      'task': 'FIG-131',
      'title': 'Header IA revision to suppo...',
      'priority': 'Bajo'
    },
  ];

  Widget _buildReminderItem(Map<String, String> reminder) {
    Color priorityColor;
    switch (reminder['priority']) {
      case 'Alto':
        priorityColor = Colors.red;
        break;
      case 'Medio':
        priorityColor = Colors.orange;
        break;
      case 'Bajo':
      default:
        priorityColor = Colors.green;
        break;
    }

    return ListTile(
      leading: Text(reminder['task']!),
      title: Text(reminder['title']!),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: priorityColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          reminder['priority']!,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TaskDetailPage(
              task: reminder['task']!,
              title: reminder['title']!,
              priority: reminder['priority']!,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Colors.black),
                      labelText: 'Buscar',
                      labelStyle: const TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  height: 48, // Altura del TextField
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white70,
                      foregroundColor: Colors.black, // Color del icono
                      minimumSize:
                          const Size(55, 55), // Tamaño mínimo del botón
                      padding: EdgeInsets.zero, // Sin relleno interno
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            4), // Ajuste del radio de las esquinas
                      ),
                    ),
                    child: const Icon(Icons.filter_alt_outlined),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tarea', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Titulo', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Prioridad',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: reminders.length,
              itemBuilder: (context, index) {
                return _buildReminderItem(reminders[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}