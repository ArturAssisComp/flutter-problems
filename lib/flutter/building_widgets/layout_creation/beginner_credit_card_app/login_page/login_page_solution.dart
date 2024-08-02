import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_problems/flutter/building_widgets/layout_creation/beginner_credit_card_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';
/******************************************************************************/

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              leadingWidth: 135,
              leading: const Padding(
                padding: EdgeInsets.only(left: 45.5, top: 16),
                child: Text(
                  '9:41',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                ),
              ),
              actions: [
                const Icon(Icons.signal_cellular_alt),
                const SizedBox(width: 4),
                const Icon(Icons.wifi),
                const SizedBox(width: 4),
                Transform.rotate(
                  angle: math.pi / 2,
                  child: const Icon(Icons.battery_full),
                ),
                const SizedBox(width: 24),
              ],
              backgroundColor: kColors.backGroundColor,
            ),
            backgroundColor: kColors.backGroundColor,
            body: const LogInPage(),
          ),
        ),
      );
}

class LogInPage extends StatelessWidget {
  const LogInPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) => const SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Body(),
            Bottom(),
          ],
        ),
      );
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: Text(
            'welcome',
            style: GoogleFonts.manrope(
              color: kColors.headerColor,
              fontSize: 34,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          top: 36,
          bottom: 44,
        ),
        child: Column(
          children: [
            const _TextField(hintText: 'Email ID'),
            const SizedBox(height: 24),
            const _TextField(hintText: 'Password'),
            const SizedBox(height: 24),
            _ElevatedButton(label: 'Password', onPressed: () {}),
          ],
        ),
      );
}

class _TextField extends StatelessWidget {
  const _TextField({
    this.hintText,
  });
  final String? hintText;

  @override
  Widget build(BuildContext context) => Container(
        width: 350,
        height: 67,
        padding: const EdgeInsets.only(left: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          decoration: InputDecoration.collapsed(
            hintText: hintText,
            hintStyle: GoogleFonts.manrope(
              fontSize: 16,
              color: Colors.black.withOpacity(0.4),
            ),
          ),
        ),
      );
}

class _ElevatedButton extends StatelessWidget {
  const _ElevatedButton({
    required this.label,
    required this.onPressed,
  });
  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 350,
        height: 67,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor:
                WidgetStatePropertyAll(kColors.elevatedButtonColor),
          ),
          child: Text(
            label,
            style: GoogleFonts.manrope(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      );
}

class Bottom extends StatelessWidget {
  const Bottom({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 390,
        height: 410,
        child: Image.asset(
          kMountainsImageAsset,
          fit: BoxFit.fitHeight,
        ),
      );
}
