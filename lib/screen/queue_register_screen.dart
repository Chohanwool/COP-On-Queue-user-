import 'package:flutter/material.dart';
import 'package:on_queue/models/queue_entity.dart';

class QueueRegisterScreen extends StatefulWidget {
  const QueueRegisterScreen({
    super.key,
    required this.appBarTitle,
    required this.onRegister,
  });

  final String appBarTitle;
  final Function(QueueEntity queue) onRegister;

  @override
  State<QueueRegisterScreen> createState() => _QueueRegisterScreenState();
}

class _QueueRegisterScreenState extends State<QueueRegisterScreen> {
  final lastNameController = TextEditingController();
  final sirNameController = TextEditingController();
  final phoneController = TextEditingController();
  final partySizeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int _selectedPartySize = 1;

  @override
  void dispose() {
    lastNameController.dispose();
    sirNameController.dispose();
    phoneController.dispose();
    partySizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.appBarTitle), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 56),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 24),
                TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    labelText: "Last Name",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE8F0F2)),
                    ),
                    // filled: true,
                    // fillColor: Color(0xFFE8F0F2),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Last name is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: sirNameController,
                  decoration: const InputDecoration(
                    labelText: "Sir Name",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE8F0F2)),
                    ),
                    // filled: true,
                    // fillColor: Color(0xFFE8F0F2),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Sir name is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    hintText: 'Phone',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE8F0F2)),
                    ),
                    // filled: true,
                    // fillColor: Color(0xFFE8F0F2),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<int>(
                  value: _selectedPartySize,
                  decoration: const InputDecoration(
                    labelText: 'Party Size',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE8F0F2)),
                    ),
                    // filled: true,
                    // fillColor: Color(0xFFE8F0F2),
                  ),
                  items: List.generate(10, (index) => index + 1)
                      .map(
                        (size) => DropdownMenuItem<int>(
                          value: size,
                          child: Text(size.toString()),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedPartySize = value!;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a party size.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final lastName = lastNameController.text;
                        final sirName = sirNameController.text;
                        final phone = phoneController.text;
                        final partySize = _selectedPartySize;

                        // 등록 로직 추가 예정
                        // 연락처는 메시지 발송 때문에 Validation 확인 필수

                        widget.onRegister(
                          QueueEntity(
                            id: "",
                            lastName: lastName,
                            sirName: sirName,
                            phoneNumber: phone,
                            partySize: partySize,
                          ),
                        );

                        // 화면 종료
                        Navigator.of(context).pop(true);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primaryContainer,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    child: const Text('Register'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
