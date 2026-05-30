import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AuthScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.diamond_outlined,
              size: 100,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 20),
            Text(
              'AURABIZ PRO',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 32,
                fontWeight: FontWeight.w900,
                letterSpacing: 3.0,
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Text(
                'Founder: Parshant Sharma\n100% Secure & End-to-End Encrypted',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFD4AF37),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _showTwoStepVerification = false;
  final TextEditingController _codeController = TextEditingController();
  String? _errorMessage;

  void _verifyAndEnter() {
    if (_codeController.text.isEmpty) {
      setState(() => _errorMessage = 'Please enter verification code');
      return;
    }
    if (_codeController.text.length != 6) {
      setState(() => _errorMessage = 'Code must be 6 digits');
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: _showTwoStepVerification ? _buildTwoStepUI() : _buildLoginUI(),
        ),
      ),
    );
  }

  Widget _buildLoginUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.shield, size: 80, color: Color(0xFFD4AF37)),
        const SizedBox(height: 20),
        const Text(
          'SECURE LOGIN',
          style: TextStyle(
            color: Color(0xFFD4AF37),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 40),
        _customButton(
          'Sign in with Google',
          Icons.g_mobiledata,
          () => setState(() => _showTwoStepVerification = true),
        ),
        const SizedBox(height: 16),
        _customButton(
          'Guest Mode (Encrypted)',
          Icons.person_outline,
          () => setState(() => _showTwoStepVerification = true),
          isOutlined: true,
        ),
      ],
    );
  }

  Widget _buildTwoStepUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.lock_clock, size: 80, color: Color(0xFFD4AF37)),
        const SizedBox(height: 20),
        const Text(
          '2-STEP VERIFICATION',
          style: TextStyle(
            color: Color(0xFFD4AF37),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        TextField(
          controller: _codeController,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            letterSpacing: 10,
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 6,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF1E1E1E),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            hintText: '••••••',
            hintStyle: const TextStyle(color: Colors.white24),
            counterText: '',
            errorText: _errorMessage,
          ),
        ),
        const SizedBox(height: 30),
        _customButton('Verify & Enter', Icons.check_circle, _verifyAndEnter),
      ],
    );
  }

  Widget _customButton(
    String text,
    IconData icon,
    VoidCallback onPressed, {
    bool isOutlined = false,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: isOutlined ? const Color(0xFFD4AF37) : Colors.black,
        ),
        label: Text(
          text,
          style: TextStyle(
            color: isOutlined ? const Color(0xFFD4AF37) : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined ? Colors.transparent : const Color(0xFFD4AF37),
          side: BorderSide(
            color: const Color(0xFFD4AF37),
            width: isOutlined ? 2 : 0,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AURABIZ PRO')),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: const Color(0xFF1A1A1A),
        selectedItemColor: const Color(0xFFD4AF37),
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Terminal'),
          BottomNavigationBarItem(icon: Icon(Icons.smart_toy), label: 'AI Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.business_center), label: 'Deals'),
          BottomNavigationBarItem(icon: Icon(Icons.headset), label: 'Relax'),
        ],
      ),
    );
  }
}
