import 'package:flutter/material.dart';
import 'package:on_queue/models/queue_entity.dart';
import 'package:on_queue/widgets/queue_list_item.dart';

class QueueList extends StatelessWidget {
  const QueueList({super.key, required this.queueList});

  final List<QueueEntity> queueList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: queueList.length,
        itemBuilder: (context, index) =>
            QueueListItem(queueEntity: queueList[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 8),
      ),
    );
  }
}
