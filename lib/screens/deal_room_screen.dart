import 'package:flutter/material.dart';

class DealRoomScreen extends StatelessWidget {
  const DealRoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const TabBar(
          indicatorColor: Color(0xFFD4AF37),
          labelColor: Color(0xFFD4AF37),
          unselectedLabelColor: Colors.white54,
          tabs: [Tab(text: "Meetings"), Tab(text: "Contracts")],
        ),
        body: TabBarView(
          children: [
            _buildMeetingsTab(),
            _buildContractsTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildMeetingsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          color: const Color(0xFF1E1E1E),
          child: ListTile(
            title: const Text('Project Kickoff'),
            subtitle: const Text('Today, 4:00 PM | Approved'),
            trailing: const Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
            onTap: () {},
          ),
        ),
        const SizedBox(height: 12),
        Card(
          color: const Color(0xFF1E1E1E),
          child: ListTile(
            title: const Text('Strategy Discussion'),
            subtitle: const Text('Tomorrow, 10:00 AM | Pending'),
            trailing: const Icon(
              Icons.schedule,
              color: Colors.orange,
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildContractsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          color: const Color(0xFF1E1E1E),
          child: ListTile(
            title: const Text('Smart Contract NDA'),
            subtitle: const Text('Verified by AI (99.8%)'),
            trailing: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD4AF37),
              ),
              child: const Text(
                'E-Sign',
                style: TextStyle(color: Colors.black),
              ),
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
