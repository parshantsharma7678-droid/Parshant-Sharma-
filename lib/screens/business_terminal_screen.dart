import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/business_provider.dart';

class BusinessTerminalScreen extends StatefulWidget {
  const BusinessTerminalScreen({Key? key}) : super(key: key);

  @override
  State<BusinessTerminalScreen> createState() => _BusinessTerminalScreenState();
}

class _BusinessTerminalScreenState extends State<BusinessTerminalScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BusinessProvider>().fetchBusinessData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BusinessProvider>(
      builder: (context, businessProvider, _) {
        if (businessProvider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xFFD4AF37)),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            await businessProvider.fetchBusinessData();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'EXECUTIVE TERMINAL',
                  style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 12,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Welcome, ${businessProvider.businessName}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'AI Predictive Market Analysis',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _bar(40),
                      _bar(60),
                      _bar(45),
                      _bar(80),
                      _bar(95, isHigh: true),
                      _bar(70),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                _card(
                  'Live Business Status',
                  businessProvider.statusText,
                  Icons.radar,
                ),
                const SizedBox(height: 16),
                _card(
                  'Current Metrics',
                  'Revenue recorded: ₹${businessProvider.revenue}',
                  Icons.monetization_on_outlined,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _bar(double height, {bool isHigh = false}) {
    return Container(
      width: 35,
      height: height,
      decoration: BoxDecoration(
        color: isHigh ? const Color(0xFFD4AF37) : const Color(0xFF333333),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _card(String title, String desc, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFFD4AF37),
            size: 32,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  desc,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
