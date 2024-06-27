import 'package:flutter/material.dart';

class TaskDetailPage extends StatelessWidget {
  final String task;
  final String title;
  final String priority;

  const TaskDetailPage({
    super.key,
    required this.task,
    required this.title,
    required this.priority,
  });

  @override
  Widget build(BuildContext context) {
    Color priorityColor;
    switch (priority) {
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle de la tarea $task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Título:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(title, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(
              'Prioridad:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: priorityColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                priority,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}