import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/business_provider.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const AuraBizProApp());
}

class AuraBizProApp extends StatelessWidget {
  const AuraBizProApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => BusinessProvider()),
      ],
      child: MaterialApp(
        title: 'AuraBiz Pro',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF121212),
          primaryColor: const Color(0xFFD4AF37),
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFFD4AF37),
            secondary: Color(0xFFE5E4E2),
            surface: Color(0xFF1E1E1E),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF1A1A1A),
            elevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Color(0xFFD4AF37),
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
            iconTheme: IconThemeData(color: Color(0xFFD4AF37)),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
