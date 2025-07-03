import 'package:flutter/material.dart';
import 'package:on_queue/models/queue_entity.dart';

class QueueListItem extends StatelessWidget {
  final QueueEntity queueEntity;

  const QueueListItem({super.key, required this.queueEntity});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: Text(queueEntity.id),
        ),
        title: Text(queueEntity.maskedFullName),
        subtitle: Text(queueEntity.maskedPhone),
        trailing: Column(mainAxisAlignment: MainAxisAlignment.center),
      ),
    );
  }
}
