import 'package:flutter/material.dart';
import 'package:on_queue/models/queue_entity.dart';
import 'package:on_queue/screen/queue_dashboard_screen.dart';

class QueueConfirmRegisterScreen extends StatelessWidget {
  const QueueConfirmRegisterScreen({
    super.key,
    required this.queueEntity,
    required this.queueSize,
    required this.onConfirmRegister,
  });

  final QueueEntity queueEntity;
  final int queueSize;
  final Function(QueueEntity queue) onConfirmRegister;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double? horizontalPadding;

    if (screenWidth < 600) {
      // 모바일
      horizontalPadding = 28;
    } else if (screenWidth < 1024) {
      // 태블릿
      horizontalPadding = 80;
    } else {
      horizontalPadding = 120;
    }

    return Scaffold(
      appBar: AppBar(title: Text('Confirm Queue'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 26,
          horizontal: horizontalPadding,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Check You\'re Queue!',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 34,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'You\'re currently number $queueSize in line.',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'We\'ll text you when your table is ready',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Name',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Text(queueEntity.fullName),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Phone',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Text(queueEntity.phoneNumber),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Party Size',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Text(queueEntity.partySize.toString()),
              ],
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'What to expect',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(color: Color(0xFFE8F0F2)),
                  width: 50,
                  height: 50,
                  child: Icon(Icons.message_rounded),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'SMS notification',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'We\'ll send you a text message when your table is ready.',
                          style: TextStyle(
                            color: Color(0xFF459acc),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Please respond within 5 minute',
                          style: TextStyle(
                            color: Color(0xFF459acc),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(color: Color(0xFFE8F0F2)),
                  width: 50,
                  height: 50,
                  child: Icon(Icons.call),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Phone call',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'If you miss your confirmation. we\'ll try to reach you by phone.',
                          style: TextStyle(
                            color: Color(0xFF459acc),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (_) => const QueueDashboardScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  child: Text('Cancel'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    onConfirmRegister(queueEntity);

                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (_) => const QueueDashboardScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  child: Text('Confirm'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
