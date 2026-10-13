import 'package:flutter/material.dart';

void main() => runApp(const NestApp());

const Color nestBg = Color(0xFFF8F5EF);
const Color nestTeal = Color(0xFF4F8177);
const Color nestDark = Color(0xFF243A37);
const Color nestCoral = Color(0xFFF28A67);
const Color nestCard = Colors.white;
const Color nestMuted = Color(0xFF6D7975);
const Color nestPaleGreen = Color(0xFFE7F0EB);
const Color nestPaleCoral = Color(0xFFFFE9E0);

class NestApp extends StatelessWidget {
  const NestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEST',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: nestBg,
        colorScheme: ColorScheme.fromSeed(
          seedColor: nestTeal,
          primary: nestTeal,
          secondary: nestCoral,
          surface: nestCard,
        ),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: nestBg,
          foregroundColor: nestDark,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: nestDark,
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}

class NestButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool secondary;
  final bool danger;
  const NestButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.secondary = false,
    this.danger = false,
  });

  @override
  Widget build(BuildContext context) {
    final bg = danger
        ? const Color(0xFFB93B3B)
        : (secondary ? Colors.white : nestTeal);
    final fg = secondary ? nestTeal : Colors.white;
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon == null ? const SizedBox.shrink() : Icon(icon, size: 22),
        label: Text(
          label,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          elevation: secondary ? 0 : 1,
          side: secondary
              ? const BorderSide(color: nestTeal, width: 1.4)
              : BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}

class NestCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsets padding;
  final VoidCallback? onTap;
  const NestCard({
    super.key,
    required this.child,
    this.color,
    this.padding = const EdgeInsets.all(18),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: color ?? nestCard,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: const BorderSide(color: Color(0xFFEAE8E1), width: 0.7),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(26, 20, 26, 24),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const BrandMark(),
              const Spacer(),
              Container(
                width: 230,
                height: 230,
                decoration: const BoxDecoration(
                  color: nestPaleGreen,
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(
                      Icons.home_rounded,
                      size: 145,
                      color: Color(0xFFB6D0C3),
                    ),
                    Positioned(
                      top: 35,
                      left: 44,
                      child: _person(Colors.white, Icons.face_3_rounded, 54),
                    ),
                    Positioned(
                      top: 53,
                      right: 35,
                      child: _person(nestCoral, Icons.face_6_rounded, 58),
                    ),
                    Positioned(
                      bottom: 28,
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.favorite_rounded,
                          color: nestCoral,
                          size: 34,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Your family.\nYour independence.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  height: 1.13,
                  fontWeight: FontWeight.w900,
                  color: nestDark,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Stay connected, stay independent, and get help when you need it.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, height: 1.5, color: nestMuted),
              ),
              const Spacer(),
              NestButton(
                label: 'Get Started',
                icon: Icons.arrow_forward_rounded,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RoleScreen()),
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Independence for them. Peace of mind for you.',
                textAlign: TextAlign.center,
                style: TextStyle(color: nestMuted, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _person(Color color, IconData icon, double size) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
      boxShadow: const [
        BoxShadow(
          color: Color(0x16000000),
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Icon(icon, color: nestDark, size: size * .65),
  );
}

class BrandMark extends StatelessWidget {
  const BrandMark({super.key});
  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 43,
        height: 43,
        decoration: const BoxDecoration(
          color: nestTeal,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.favorite_rounded,
          color: Colors.white,
          size: 24,
        ),
      ),
      const SizedBox(width: 10),
      const Text(
        'NEST',
        style: TextStyle(
          letterSpacing: 4,
          fontSize: 25,
          fontWeight: FontWeight.w900,
          color: nestDark,
        ),
      ),
    ],
  );
}

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: BackButton(onPressed: () => Navigator.pop(context)),
    ),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'How will you use NEST?',
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.w900,
                color: nestDark,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Choose the experience that feels right for you.',
              style: TextStyle(fontSize: 17, color: nestMuted, height: 1.4),
            ),
            const SizedBox(height: 28),
            _roleCard(
              context,
              icon: Icons.elderly_rounded,
              title: "I'm a Senior",
              subtitle: 'Simple tools for everyday life',
              tint: nestPaleGreen,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SeniorHomeScreen()),
              ),
            ),
            const SizedBox(height: 16),
            _roleCard(
              context,
              icon: Icons.family_restroom_rounded,
              title: "I'm Family",
              subtitle: 'Stay connected and support your loved one',
              tint: nestPaleCoral,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FamilyHomeScreen()),
              ),
            ),
            const Spacer(),
            const Center(
              child: Text(
                'Your information stays in your control.',
                style: TextStyle(color: nestMuted, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _roleCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color tint,
    required VoidCallback onTap,
  }) => NestCard(
    onTap: onTap,
    padding: const EdgeInsets.all(22),
    child: Row(
      children: [
        Container(
          width: 68,
          height: 68,
          decoration: BoxDecoration(
            color: tint,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(icon, color: nestTeal, size: 36),
        ),
        const SizedBox(width: 17),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: nestDark,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 15,
                  color: nestMuted,
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
        const Icon(Icons.arrow_forward_ios_rounded, size: 18, color: nestTeal),
      ],
    ),
  );
}

class SeniorHomeScreen extends StatefulWidget {
  const SeniorHomeScreen({super.key});
  @override
  State<SeniorHomeScreen> createState() => _SeniorHomeScreenState();
}

class _SeniorHomeScreenState extends State<SeniorHomeScreen> {
  int _tab = 0;
  bool _checkedIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BrandMark(),
        actions: [
          IconButton(
            tooltip: 'Ask NEST',
            onPressed: () => _open(context, const VoiceScreen()),
            icon: const Icon(Icons.mic_none_rounded, size: 28),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: IndexedStack(
        index: _tab,
        children: [
          _homeContent(context),
          const FamilyScreen(),
          const TodayScreen(),
          const HelpScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (i) => setState(() => _tab = i),
        backgroundColor: Colors.white,
        indicatorColor: nestPaleGreen,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border_rounded),
            selectedIcon: Icon(Icons.favorite_rounded),
            label: 'Family',
          ),
          NavigationDestination(
            icon: Icon(Icons.today_outlined),
            selectedIcon: Icon(Icons.today_rounded),
            label: 'Today',
          ),
          NavigationDestination(
            icon: Icon(Icons.help_outline_rounded),
            selectedIcon: Icon(Icons.help_rounded),
            label: 'Help',
          ),
        ],
      ),
    );
  }

  Widget _homeContent(BuildContext context) => ListView(
    padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
    children: [
      const Text(
        'Good morning ❤️',
        style: TextStyle(
          fontSize: 18,
          color: nestTeal,
          fontWeight: FontWeight.w800,
        ),
      ),
      const SizedBox(height: 5),
      const Text(
        'Hello, Grandma!',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w900,
          color: nestDark,
        ),
      ),
      const SizedBox(height: 6),
      Text(
        _dateLabel(),
        style: const TextStyle(fontSize: 15, color: nestMuted),
      ),
      const SizedBox(height: 22),
      NestCard(
        color: _checkedIn ? nestPaleGreen : nestTeal,
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.18),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _checkedIn
                        ? Icons.check_circle_rounded
                        : Icons.favorite_rounded,
                    color: Colors.white,
                    size: 29,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _checkedIn
                        ? "You're all good ❤️"
                        : "Let your family know you're okay",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: _checkedIn ? nestDark : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              _checkedIn
                  ? 'Your family has been notified.'
                  : 'One simple tap can give them peace of mind.',
              style: TextStyle(
                fontSize: 15,
                color: _checkedIn ? nestDark : Colors.white.withOpacity(.92),
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              height: 62,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: nestTeal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
                onPressed: () {
                  setState(() => _checkedIn = true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          CheckInScreen(time: TimeOfDay.now().format(context)),
                    ),
                  );
                },
                child: Text(
                  _checkedIn ? 'Check in again' : "❤️  I'M OKAY",
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 23),
      const Text(
        'Your everyday essentials',
        style: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.w900,
          color: nestDark,
        ),
      ),
      const SizedBox(height: 13),
      GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.16,
        children: [
          _feature(
            context,
            Icons.medication_rounded,
            'Medicines',
            '2 reminders today',
            nestPaleGreen,
            const MedicinesScreen(),
          ),
          _feature(
            context,
            Icons.account_balance_wallet_rounded,
            'Pension',
            'Next: 1 Nov',
            const Color(0xFFFFF0D8),
            const PensionScreen(),
          ),
          _feature(
            context,
            Icons.payments_rounded,
            'Pay',
            'Safe UPI guide',
            nestPaleCoral,
            const PayScreen(),
          ),
          _feature(
            context,
            Icons.family_restroom_rounded,
            'Family',
            '3 family members',
            const Color(0xFFECEBFA),
            const FamilyScreen(),
          ),
          _feature(
            context,
            Icons.shield_rounded,
            'Is This Safe?',
            'Check a message',
            const Color(0xFFE4EFF6),
            const SafetyScreen(),
          ),
          _feature(
            context,
            Icons.support_agent_rounded,
            'Get Help',
            'Support when needed',
            const Color(0xFFF9E6E3),
            const HelpScreen(),
          ),
        ],
      ),
      const SizedBox(height: 20),
      NestCard(
        child: Row(
          children: [
            const Icon(Icons.mic_rounded, color: nestTeal, size: 36),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ask NEST',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: nestDark,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Use your voice to find what you need.',
                    style: TextStyle(fontSize: 14, color: nestMuted),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => _open(context, const VoiceScreen()),
              icon: const Icon(Icons.arrow_forward_rounded, color: nestTeal),
            ),
          ],
        ),
      ),
    ],
  );

  Widget _feature(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    Color tint,
    Widget screen,
  ) => NestCard(
    onTap: () => _open(context, screen),
    padding: const EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 43,
          height: 43,
          decoration: BoxDecoration(
            color: tint,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: nestTeal, size: 25),
        ),
        const Spacer(),
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w900,
            color: nestDark,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          maxLines: 2,
          style: const TextStyle(fontSize: 13, color: nestMuted),
        ),
      ],
    ),
  );

  String _dateLabel() {
    final now = DateTime.now();
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${now.day} ${months[now.month - 1]} ${now.year}';
  }
}

void _open(BuildContext context, Widget page) =>
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));

class PageShell extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget child;
  const PageShell({
    super.key,
    required this.title,
    this.subtitle,
    required this.child,
  });
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(title),
      leading: BackButton(onPressed: () => Navigator.maybePop(context)),
    ),
    body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 26),
        children: [
          if (subtitle != null) ...[
            Text(
              subtitle!,
              style: const TextStyle(
                fontSize: 16,
                height: 1.45,
                color: nestMuted,
              ),
            ),
            const SizedBox(height: 20),
          ],
          child,
        ],
      ),
    ),
  );
}

class CheckInScreen extends StatelessWidget {
  final String time;
  const CheckInScreen({super.key, required this.time});
  @override
  Widget build(BuildContext context) => PageShell(
    title: 'Check-in',
    child: Column(
      children: [
        const SizedBox(height: 35),
        Container(
          width: 124,
          height: 124,
          decoration: const BoxDecoration(
            color: nestPaleGreen,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.favorite_rounded, color: nestTeal, size: 70),
        ),
        const SizedBox(height: 25),
        const Text(
          "You're all good ❤️",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.w900,
            color: nestDark,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Your family has been notified. Thank you for checking in!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 17, color: nestMuted, height: 1.5),
        ),
        const SizedBox(height: 22),
        NestCard(
          child: Row(
            children: [
              const Icon(Icons.access_time_rounded, color: nestTeal, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Checked in today at $time',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: nestDark,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 26),
        NestButton(label: 'Done', onPressed: () => Navigator.pop(context)),
      ],
    ),
  );
}

class MedicinesScreen extends StatefulWidget {
  const MedicinesScreen({super.key});
  @override
  State<MedicinesScreen> createState() => _MedicinesScreenState();
}

class _MedicinesScreenState extends State<MedicinesScreen> {
  bool morningTaken = true;
  bool nightTaken = false;
  @override
  Widget build(BuildContext context) => PageShell(
    title: 'My Medicines',
    subtitle: 'Here is your medicine schedule for today.',
    child: Column(
      children: [
        _medicineCard(
          'Morning',
          '8:00 AM',
          'Blood pressure medicine',
          morningTaken,
          () => setState(() => morningTaken = !morningTaken),
        ),
        const SizedBox(height: 14),
        _medicineCard(
          'Night',
          '8:00 PM',
          'Evening medicine',
          nightTaken,
          () => setState(() => nightTaken = !nightTaken),
        ),
        const SizedBox(height: 20),
        NestCard(
          color: nestPaleGreen,
          child: const Row(
            children: [
              Icon(Icons.lightbulb_outline_rounded, color: nestTeal, size: 28),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'If you are unsure about a medicine, ask your doctor or family member.',
                  style: TextStyle(fontSize: 15, color: nestDark, height: 1.4),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
  Widget _medicineCard(
    String time,
    String clock,
    String name,
    bool taken,
    VoidCallback toggle,
  ) => NestCard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.access_time_rounded, color: nestTeal),
            const SizedBox(width: 8),
            Text(
              time,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: nestDark,
              ),
            ),
            const Spacer(),
            Text(clock, style: const TextStyle(fontSize: 15, color: nestMuted)),
          ],
        ),
        const Divider(height: 26),
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: nestPaleGreen,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.medication_rounded,
                color: nestTeal,
                size: 27,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: nestDark,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 52,
          child: OutlinedButton.icon(
            onPressed: toggle,
            icon: Icon(
              taken
                  ? Icons.check_circle_rounded
                  : Icons.check_circle_outline_rounded,
            ),
            label: Text(
              taken ? 'Taken ✓' : 'Mark as Taken',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: taken ? nestTeal : nestDark,
              side: BorderSide(
                color: taken ? nestTeal : const Color(0xFFD8D9D2),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class PensionScreen extends StatelessWidget {
  const PensionScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(
    title: 'My Pension',
    subtitle: 'A simple place to keep track of your pension details.',
    child: Column(
      children: [
        NestCard(
          color: nestTeal,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'MONTHLY PENSION',
                style: TextStyle(
                  color: Colors.white70,
                  letterSpacing: 1.2,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '₹12,500',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'Monthly pension',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        NestCard(
          child: Column(
            children: [
              _detailRow(
                Icons.check_circle_rounded,
                'Last received',
                '1 October 2026',
              ),
              const Divider(height: 26),
              _detailRow(
                Icons.calendar_month_rounded,
                'Next expected',
                '1 November 2026',
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Government Schemes',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: nestDark,
            ),
          ),
        ),
        const SizedBox(height: 12),
        NestCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.account_balance_rounded,
                size: 34,
                color: nestTeal,
              ),
              const SizedBox(height: 12),
              const Text(
                'Benefits you may be eligible for',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: nestDark,
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                'Explore senior citizen schemes and check the documents you may need.',
                style: TextStyle(fontSize: 15, color: nestMuted, height: 1.45),
              ),
              const SizedBox(height: 16),
              NestButton(
                label: 'Find Schemes I May Be Eligible For',
                onPressed: () => _open(context, const SchemesScreen()),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _detailRow(IconData icon, String label, String value) => Row(
  children: [
    Icon(icon, color: nestTeal, size: 25),
    const SizedBox(width: 12),
    Expanded(
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, color: nestMuted),
      ),
    ),
    Flexible(
      child: Text(
        value,
        textAlign: TextAlign.end,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w800,
          color: nestDark,
        ),
      ),
    ),
  ],
);

class SchemesScreen extends StatelessWidget {
  const SchemesScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(
    title: 'Benefits & Schemes',
    subtitle:
        'Scheme rules can change. Confirm eligibility with the official government source before applying.',
    child: Column(
      children: [
        _schemeCard(
          'Senior Citizen Pension',
          'You may be eligible based on your age, income and state rules.',
          'Eligibility: varies by scheme and state',
          'Age proof, identity proof, bank details',
          'Check eligibility',
        ),
        const SizedBox(height: 14),
        _schemeCard(
          'Senior Citizen Savings Scheme',
          'A government-backed savings option for eligible older adults.',
          'Eligibility: age and account conditions apply',
          'Identity proof, age proof, bank documents',
          'Learn more',
        ),
        const SizedBox(height: 18),
        const Text(
          'Safety note: NEST is a guide, not a government authority. Use official government websites or an authorised service centre for final information.',
          style: TextStyle(fontSize: 14, color: nestMuted, height: 1.45),
        ),
      ],
    ),
  );
  Widget _schemeCard(
    String title,
    String desc,
    String eligibility,
    String docs,
    String action,
  ) => NestCard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.verified_user_outlined, color: nestTeal),
            SizedBox(width: 7),
            Text(
              'Government scheme information',
              style: TextStyle(
                color: nestTeal,
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w900,
            color: nestDark,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          desc,
          style: const TextStyle(fontSize: 15, color: nestMuted, height: 1.4),
        ),
        const SizedBox(height: 13),
        const Text(
          'Eligibility',
          style: TextStyle(fontWeight: FontWeight.w900, color: nestDark),
        ),
        const SizedBox(height: 4),
        Text(
          eligibility,
          style: const TextStyle(color: nestMuted, fontSize: 14),
        ),
        const SizedBox(height: 10),
        const Text(
          'Documents to prepare',
          style: TextStyle(fontWeight: FontWeight.w900, color: nestDark),
        ),
        const SizedBox(height: 4),
        Text(docs, style: const TextStyle(color: nestMuted, fontSize: 14)),
        const SizedBox(height: 14),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Please verify details on an official government source.',
                ),
              ),
            ),
            child: Text(action),
          ),
        ),
      ],
    ),
  );
}

class PayScreen extends StatefulWidget {
  const PayScreen({super.key});
  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  String recipient = 'Pharmacy';
  final amountController = TextEditingController(text: '500');
  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PageShell(
    title: 'Pay',
    subtitle:
        'NEST helps you review a payment safely. It does not collect your UPI PIN.',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Who do you want to pay?',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: nestDark,
          ),
        ),
        const SizedBox(height: 13),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _recipientChip('Family', Icons.family_restroom_rounded),
            _recipientChip('Shop', Icons.storefront_rounded),
            _recipientChip('Pharmacy', Icons.local_pharmacy_rounded),
            _recipientChip('Transport', Icons.local_taxi_rounded),
            _recipientChip('Other', Icons.add_circle_outline_rounded),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Amount (₹)',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w800,
            color: nestDark,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: amountController,
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          decoration: InputDecoration(
            prefixText: '₹ ',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 20),
        NestCard(
          color: const Color(0xFFFFF1D9),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.shield_outlined, color: Color(0xFF9A6B17), size: 30),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Before you pay',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                        color: nestDark,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Check the recipient and amount. Never share your UPI PIN or OTP. NEST will never ask you to enter them here.',
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.45,
                        color: nestDark,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        NestButton(
          label: 'Review Payment',
          icon: Icons.arrow_forward_rounded,
          onPressed: () {
            final amount = amountController.text.trim().isEmpty
                ? '0'
                : amountController.text.trim();
            _open(
              context,
              PaymentReviewScreen(recipient: recipient, amount: amount),
            );
          },
        ),
      ],
    ),
  );
  Widget _recipientChip(String label, IconData icon) {
    final selected = recipient == label;
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: selected ? Colors.white : nestDark,
        ),
      ),
      avatar: Icon(icon, size: 20, color: selected ? Colors.white : nestTeal),
      selected: selected,
      onSelected: (_) => setState(() => recipient = label),
      selectedColor: nestTeal,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: selected ? nestTeal : const Color(0xFFE4E4DC)),
      ),
    );
  }
}

class PaymentReviewScreen extends StatelessWidget {
  final String recipient, amount;
  const PaymentReviewScreen({
    super.key,
    required this.recipient,
    required this.amount,
  });
  @override
  Widget build(BuildContext context) => PageShell(
    title: 'Review payment',
    subtitle: 'Check these details before continuing in your UPI app.',
    child: Column(
      children: [
        const SizedBox(height: 12),
        NestCard(
          child: Column(
            children: [
              const Text(
                "You're about to pay",
                style: TextStyle(fontSize: 17, color: nestMuted),
              ),
              const SizedBox(height: 8),
              Text(
                '₹$amount',
                style: const TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                  color: nestDark,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                recipient == 'Pharmacy' ? 'XYZ Pharmacy' : recipient,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: nestDark,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Recipient details should be verified in your UPI app.',
                textAlign: TextAlign.center,
                style: TextStyle(color: nestMuted, fontSize: 14),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        NestCard(
          color: nestPaleCoral,
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Color(0xFF9C4E35),
                size: 28,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Never share your UPI PIN or OTP. Your PIN should only be entered in your trusted UPI app.',
                  style: TextStyle(fontSize: 15, color: nestDark, height: 1.45),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        NestButton(
          label: 'Continue to UPI',
          onPressed: () => showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Continue safely'),
              content: const Text(
                'This prototype does not initiate real payments. Open your trusted UPI app yourself and verify the recipient there.',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Understood'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        NestButton(
          label: 'Cancel',
          secondary: true,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}

class FamilyScreen extends StatelessWidget {
  const FamilyScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(
    title: 'My Family ❤️',
    subtitle: 'The people you can reach whenever you need them.',
    child: Column(
      children: [
        _familyMember('Shourya', 'Son', Icons.person_rounded),
        const SizedBox(height: 12),
        _familyMember('Ananya', 'Daughter', Icons.person_3_rounded),
        const SizedBox(height: 12),
        _familyMember(
          'Ravi',
          'Trusted family member',
          Icons.person_outline_rounded,
        ),
        const SizedBox(height: 24),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Family Updates',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w900,
              color: nestDark,
            ),
          ),
        ),
        const SizedBox(height: 12),
        NestCard(
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: nestPaleCoral,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.photo_camera_rounded, color: nestCoral),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Your daughter shared a photo ❤️',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: nestDark,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
  Widget _familyMember(String name, String relation, IconData icon) => NestCard(
    child: Row(
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: const BoxDecoration(
            color: nestPaleGreen,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: nestTeal, size: 30),
        ),
        const SizedBox(width: 13),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                relation,
                style: const TextStyle(fontSize: 13, color: nestMuted),
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: nestDark,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          tooltip: 'Call $name',
          onPressed: () => _contactMessage(context, 'Call $name'),
          icon: const Icon(Icons.call_rounded, color: nestTeal),
        ),
        IconButton(
          tooltip: 'Message $name',
          onPressed: () => _contactMessage(context, 'Message $name'),
          icon: const Icon(Icons.chat_bubble_outline_rounded, color: nestTeal),
        ),
      ],
    ),
  );
  void _contactMessage(BuildContext context, String action) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '$action would connect to your phone app in the full version.',
          ),
        ),
      );
}

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(
    title: 'How can we help?',
    subtitle:
        'Choose the kind of help you need. If there is immediate danger, contact local emergency services.',
    child: Column(
      children: [
        _helpAction(
          context,
          Icons.favorite_rounded,
          'Medical Help',
          'I need health-related help',
          nestPaleCoral,
        ),
        const SizedBox(height: 12),
        _helpAction(
          context,
          Icons.call_rounded,
          'Call Family',
          'Talk to someone you trust',
          nestPaleGreen,
        ),
        const SizedBox(height: 12),
        _helpAction(
          context,
          Icons.local_taxi_rounded,
          'I Need a Ride',
          'Help arranging transport',
          const Color(0xFFFFF0D8),
        ),
        const SizedBox(height: 12),
        _helpAction(
          context,
          Icons.home_rounded,
          'Something Happened at Home',
          'I need help at home',
          const Color(0xFFECEBFA),
        ),
        const SizedBox(height: 12),
        NestCard(
          color: const Color(0xFFFFE4E2),
          child: Row(
            children: [
              const Icon(Icons.sos_rounded, color: Color(0xFFB3261E), size: 37),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Emergency',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF8C1D18),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'For urgent danger or immediate medical risk.',
                      style: TextStyle(fontSize: 14, color: nestDark),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => _confirmEmergency(context),
                icon: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Color(0xFF8C1D18),
                  size: 27,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
  Widget _helpAction(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    Color tint,
  ) => NestCard(
    onTap: () => _confirmHelp(context, title),
    child: Row(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: tint,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: nestTeal, size: 28),
        ),
        const SizedBox(width: 13),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  color: nestDark,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 14, color: nestMuted),
              ),
            ],
          ),
        ),
        const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: nestTeal),
      ],
    ),
  );
  void _confirmHelp(BuildContext context, String title) => showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(title),
      content: const Text(
        'Would you like to contact a trusted family member for help? This demo will not place a real call.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Not now'),
        ),
        FilledButton(
          onPressed: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'In the full app, this would contact your chosen helper.',
                ),
              ),
            );
          },
          child: const Text('Yes, help me'),
        ),
      ],
    ),
  );
  void _confirmEmergency(BuildContext context) => showDialog(
    context: context,
    builder: (_) => AlertDialog(
      icon: const Icon(
        Icons.warning_rounded,
        color: Color(0xFFB3261E),
        size: 42,
      ),
      title: const Text('Confirm emergency alert'),
      content: const Text(
        'Do you want to alert your emergency contact? If you are in immediate danger, call local emergency services now.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Demo only: no emergency alert was sent.'),
              ),
            );
          },
          child: const Text('Confirm'),
        ),
      ],
    ),
  );
}

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(
    title: 'Today',
    subtitle: 'A simple overview of your day.',
    child: Column(
      children: [
        NestCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your day at a glance',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: nestDark,
                ),
              ),
              const SizedBox(height: 16),
              _timeline(
                Icons.medication_rounded,
                '8:00 AM',
                'Morning medicine',
                'Marked as taken',
              ),
              const SizedBox(height: 15),
              _timeline(
                Icons.favorite_rounded,
                'Today',
                'Family check-in',
                'Tap “I’m Okay” on Home',
              ),
              const SizedBox(height: 15),
              _timeline(
                Icons.medication_rounded,
                '8:00 PM',
                'Evening medicine',
                'Reminder scheduled',
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        NestCard(
          child: const Row(
            children: [
              Icon(Icons.calendar_month_rounded, color: nestTeal, size: 30),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Doctor appointment tomorrow',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: nestDark,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
  Widget _timeline(IconData icon, String time, String title, String note) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              color: nestPaleGreen,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: nestTeal),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$time · $title',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: nestDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  note,
                  style: const TextStyle(fontSize: 14, color: nestMuted),
                ),
              ],
            ),
          ),
        ],
      );
}

class SafetyScreen extends StatefulWidget {
  const SafetyScreen({super.key});
  @override
  State<SafetyScreen> createState() => _SafetyScreenState();
}

class _SafetyScreenState extends State<SafetyScreen> {
  String choice = 'Message';
  bool checked = false;
  @override
  Widget build(BuildContext context) => PageShell(
    title: 'Is This Safe?',
    subtitle:
        'Not sure about a message, link, payment or call? Let’s think it through.',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'What would you like to check?',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w900,
            color: nestDark,
          ),
        ),
        const SizedBox(height: 13),
        Wrap(
          spacing: 9,
          runSpacing: 9,
          children: ['Message', 'Link', 'Payment', 'Call']
              .map(
                (v) => ChoiceChip(
                  label: Text(v),
                  selected: choice == v,
                  onSelected: (_) => setState(() {
                    choice = v;
                    checked = false;
                  }),
                  selectedColor: nestPaleGreen,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: choice == v ? nestTeal : nestDark,
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 20),
        NestCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Paste or describe what happened',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: nestDark,
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText:
                      'Example: Someone says my bank account will close unless I share an OTP.',
                  filled: true,
                  fillColor: nestBg,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                ),
              ),
              const SizedBox(height: 13),
              NestButton(
                label: 'Help Me Check',
                onPressed: () => setState(() => checked = true),
              ),
            ],
          ),
        ),
        if (checked) ...[
          const SizedBox(height: 16),
          NestCard(
            color: nestPaleCoral,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: Color(0xFFB34E32),
                      size: 30,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Be careful — possible scam',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w900,
                          color: nestDark,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'If someone asks for an OTP, PIN, password, or urges you to act immediately, it may be a scam.',
                  style: TextStyle(fontSize: 15, color: nestDark, height: 1.45),
                ),
                const SizedBox(height: 12),
                const Text(
                  'What should you do?',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: nestDark,
                  ),
                ),
                const SizedBox(height: 7),
                const Text(
                  '• Don’t click the link\n• Don’t share an OTP or PIN\n• Ask a trusted family member\n• Contact your bank using its official number if money is involved',
                  style: TextStyle(fontSize: 15, color: nestDark, height: 1.6),
                ),
              ],
            ),
          ),
        ],
        const SizedBox(height: 16),
        const Text(
          'This guide cannot verify a message automatically. When unsure, pause and ask someone you trust.',
          style: TextStyle(fontSize: 14, color: nestMuted, height: 1.45),
        ),
      ],
    ),
  );
}

class VoiceScreen extends StatelessWidget {
  const VoiceScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(
    title: 'Ask NEST',
    subtitle: 'Use these quick actions or ask for help in your own words.',
    child: Column(
      children: [
        Container(
          width: 145,
          height: 145,
          decoration: const BoxDecoration(
            color: nestPaleGreen,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.mic_rounded, color: nestTeal, size: 75),
        ),
        const SizedBox(height: 16),
        const Text(
          'How can I help?',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            color: nestDark,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Voice recognition is a future feature. For now, choose a quick action below.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, color: nestMuted, height: 1.45),
        ),
        const SizedBox(height: 22),
        _quick(
          context,
          'Show my pension',
          Icons.account_balance_wallet_rounded,
          const PensionScreen(),
        ),
        const SizedBox(height: 10),
        _quick(
          context,
          'What medicines do I have today?',
          Icons.medication_rounded,
          const MedicinesScreen(),
        ),
        const SizedBox(height: 10),
        _quick(
          context,
          'Call my family',
          Icons.call_rounded,
          const FamilyScreen(),
        ),
        const SizedBox(height: 10),
        _quick(
          context,
          'Is this payment safe?',
          Icons.shield_rounded,
          const SafetyScreen(),
        ),
      ],
    ),
  );
  Widget _quick(
    BuildContext context,
    String label,
    IconData icon,
    Widget screen,
  ) => NestCard(
    onTap: () => _open(context, screen),
    child: Row(
      children: [
        Icon(icon, color: nestTeal, size: 25),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: nestDark,
            ),
          ),
        ),
        const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: nestTeal),
      ],
    ),
  );
}

class FamilyHomeScreen extends StatelessWidget {
  const FamilyHomeScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const BrandMark(),
      actions: [
        IconButton(
          onPressed: () => _open(context, const VoiceScreen()),
          icon: const Icon(Icons.mic_none_rounded),
        ),
        const SizedBox(width: 8),
      ],
    ),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
      children: [
        const Text(
          "Mom's Space ❤️",
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.w900,
            color: nestDark,
          ),
        ),
        const SizedBox(height: 7),
        const Text(
          'A little reassurance, without the feeling of being watched.',
          style: TextStyle(fontSize: 16, color: nestMuted, height: 1.45),
        ),
        const SizedBox(height: 20),
        NestCard(
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: const BoxDecoration(
                  color: nestPaleGreen,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_rounded,
                  color: nestTeal,
                  size: 31,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Checked in',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                        color: nestDark,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Today at 10:32 AM',
                      style: TextStyle(fontSize: 15, color: nestMuted),
                    ),
                  ],
                ),
              ),
              const Text('●', style: TextStyle(color: nestTeal, fontSize: 22)),
            ],
          ),
        ),
        const SizedBox(height: 13),
        _familyStatus(
          Icons.medication_rounded,
          'Medicine',
          'Morning medicine ✓',
          nestPaleGreen,
        ),
        const SizedBox(height: 12),
        _familyStatus(
          Icons.account_balance_wallet_rounded,
          'Pension',
          'Last received 1 Oct',
          const Color(0xFFFFF0D8),
        ),
        const SizedBox(height: 12),
        _familyStatus(
          Icons.calendar_month_rounded,
          'Upcoming',
          'Doctor appointment tomorrow',
          const Color(0xFFECEBFA),
        ),
        const SizedBox(height: 22),
        const Text(
          'Quick actions',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w900,
            color: nestDark,
          ),
        ),
        const SizedBox(height: 12),
        NestButton(
          label: 'Call Mom',
          icon: Icons.call_rounded,
          onPressed: () => _familyAction(context, 'Call Mom'),
        ),
        const SizedBox(height: 10),
        NestButton(
          label: 'Message',
          icon: Icons.chat_bubble_outline_rounded,
          secondary: true,
          onPressed: () => _familyAction(context, 'Message Mom'),
        ),
        const SizedBox(height: 10),
        NestButton(
          label: 'Emergency Support',
          icon: Icons.sos_rounded,
          danger: true,
          onPressed: () => _open(context, const HelpScreen()),
        ),
        const SizedBox(height: 22),
        NestCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.lock_outline_rounded, color: nestTeal),
                  SizedBox(width: 8),
                  Text(
                    'Privacy & sharing',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: nestDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Mom chooses which updates are shared with family. Care should support independence, not surveillance.',
                style: TextStyle(fontSize: 15, color: nestMuted, height: 1.45),
              ),
              const SizedBox(height: 12),
              TextButton.icon(
                onPressed: () => _open(context, const PrivacyScreen()),
                icon: const Icon(Icons.tune_rounded),
                label: const Text('Review privacy controls'),
              ),
            ],
          ),
        ),
      ],
    ),
  );
  Widget _familyStatus(
    IconData icon,
    String title,
    String subtitle,
    Color tint,
  ) => NestCard(
    child: Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: tint,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: nestTeal, size: 26),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16, color: nestMuted),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: nestDark,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
  void _familyAction(BuildContext context, String action) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '$action will open the phone or messaging app in the full version.',
          ),
        ),
      );
}

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});
  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool checkIn = true, medicine = true, pension = false, appointments = true;
  @override
  Widget build(BuildContext context) => PageShell(
    title: 'Privacy controls',
    subtitle:
        'The senior should choose what is shared. These switches are demo settings stored only while this screen is open.',
    child: Column(
      children: [
        _switchRow(
          'Daily check-in',
          'Share whether they checked in',
          checkIn,
          (v) => setState(() => checkIn = v),
        ),
        const SizedBox(height: 12),
        _switchRow(
          'Medicine status',
          'Share taken / not taken updates',
          medicine,
          (v) => setState(() => medicine = v),
        ),
        const SizedBox(height: 12),
        _switchRow(
          'Pension details',
          'Share financial information',
          pension,
          (v) => setState(() => pension = v),
        ),
        const SizedBox(height: 12),
        _switchRow(
          'Appointments',
          'Share upcoming appointments',
          appointments,
          (v) => setState(() => appointments = v),
        ),
        const SizedBox(height: 20),
        const Text(
          'Only share information that is useful and comfortable for the senior. Financial information should remain private unless explicitly approved.',
          style: TextStyle(fontSize: 15, color: nestMuted, height: 1.5),
        ),
      ],
    ),
  );
  Widget _switchRow(
    String title,
    String subtitle,
    bool value,
    ValueChanged<bool> change,
  ) => NestCard(
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  color: nestDark,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 14, color: nestMuted),
              ),
            ],
          ),
        ),
        Switch(value: value, onChanged: change, activeColor: nestTeal),
      ],
    ),
  );
}
