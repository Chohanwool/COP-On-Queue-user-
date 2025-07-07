import 'package:flutter/material.dart';

class QueueConfirmRegisterScreen extends StatelessWidget {
  const QueueConfirmRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Confirm Queue'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You\'re on the list!',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 34,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'You\'re currently number 3 in line.',
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
                Text('Hanwool'),
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
                Text('010-2472-9511'),
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
                Text('3'),
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
                      Text(
                        'We\'ll send you a text message when your table is ready. Please respond within 5 minute',
                        style: TextStyle(
                          color: Color(0xFF459acc),
                          fontWeight: FontWeight.w500,
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
                      Text(
                        'If you miss your confirmation. we\'ll try to reach you by phone.',
                        style: TextStyle(
                          color: Color(0xFF459acc),
                          fontWeight: FontWeight.w500,
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
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  child: Text('Cancel'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {},
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
