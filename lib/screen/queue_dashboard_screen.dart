import 'package:flutter/material.dart';
import 'package:on_queue/data/dummy_data.dart';
import 'package:on_queue/models/queue_entity.dart';
import 'package:on_queue/screen/queue_register_screen.dart';
import 'package:on_queue/widgets/queue_list_item.dart';

class QueueDashboardScreen extends StatefulWidget {
  const QueueDashboardScreen({super.key});

  @override
  State<QueueDashboardScreen> createState() => _QueueDashboardScreenState();
}

class _QueueDashboardScreenState extends State<QueueDashboardScreen> {
  final List<QueueEntity> _queueList = queueEntities;

  // 등록 화면으로 이동
  void _pushRegisterScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => QueueRegisterScreen(
          appBarTitle: 'Register Queue',
          onRegister: _addQueueData,
        ),
      ),
    );
  }

  // 대기 데이터 등록
  void _addQueueData(QueueEntity queue) {
    setState(() {
      final lastId = _queueList.isNotEmpty ? int.parse(_queueList.last.id) : 0;
      final nextId = (lastId + 1).toString();

      final newQueue = QueueEntity(
        id: nextId,
        lastName: queue.lastName,
        sirName: queue.sirName,
        phoneNumber: queue.phoneNumber,
        partySize: queue.partySize,
      );

      _queueList.add(newQueue);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('On Queue'),
        leading: const Icon(Icons.access_time),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            Text(
              'Welcome',
              style: theme.textTheme.titleLarge!.copyWith(
                fontSize: 44,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Tap below to register your queue!',
              style: theme.textTheme.titleMedium!.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 24),

            // Feature Card
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 850),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 150,
                      width: 200,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: theme.colorScheme.primaryContainer,
                      ),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Queue', style: theme.textTheme.titleMedium),
                          const SizedBox(height: 8),
                          Expanded(
                            child: Center(
                              child: Text(
                                '9',
                                style: theme.textTheme.titleMedium!.copyWith(
                                  fontSize: 38,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _pushRegisterScreen();
                      },
                      child: Container(
                        height: 150,
                        width: 200,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: theme.colorScheme.primaryContainer,
                        ),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Register',
                              style: theme.textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            Expanded(
                              child: Center(child: Icon(Icons.add, size: 30)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Feature Card
            const SizedBox(height: 28),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 46),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Queue List',
                          style: theme.textTheme.titleLarge!.copyWith(
                            fontSize: 30,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_today),
                            const SizedBox(width: 4),
                            Text(
                              '2025-06-10',
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: ListView.separated(
                        itemCount: _queueList.length,
                        itemBuilder: (context, index) =>
                            QueueListItem(queueEntity: _queueList[index]),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
