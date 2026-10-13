import 'package:flutter/material.dart';

const Color medicineCream = Color(0xFFF8F2E8);
const Color medicineIndigo = Color(0xFF4B4D9B);
const Color medicineCoral = Color(0xFFFA7945);
const Color medicineDark = Color(0xFF343451);

class MedicineScreen extends StatefulWidget {
  const MedicineScreen({super.key});

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  final List<Map<String, dynamic>> medicines = [
    {
      'name': 'Morning medicine',
      'dosage': '1 tablet',
      'time': '9:00 AM',
      'taken': false,
    },
    {
      'name': 'Afternoon medicine',
      'dosage': '1 tablet',
      'time': '2:00 PM',
      'taken': false,
    },
    {
      'name': 'Evening medicine',
      'dosage': '1 tablet',
      'time': '8:00 PM',
      'taken': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final completed = medicines.where((m) => m['taken'] == true).length;
    final progress = completed / medicines.length;

    return Scaffold(
      backgroundColor: medicineCream,
      appBar: AppBar(
        title: const Text(
          'My Medicines',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: medicineCream,
        foregroundColor: medicineDark,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 28),
        children: [
          const Text(
            'Your health matters',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: medicineDark,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'A little reminder to take care of yourself ❤️',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 24),

          // Daily progress card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [medicineIndigo, Color(0xFF6869B5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: medicineIndigo.withValues(alpha: 0.16),
                  blurRadius: 16,
                  offset: const Offset(0, 7),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.16),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.medication_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Text(
                        "TODAY'S PROGRESS",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.favorite_rounded,
                      color: medicineCoral,
                      size: 25,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  '$completed of ${medicines.length} medicines taken',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 14),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 9,
                    backgroundColor: Colors.white24,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      medicineCoral,
                    ),
                  ),
                ),
                const SizedBox(height: 9),
                Text(
                  completed == medicines.length
                      ? 'Wonderful! You completed today’s schedule.'
                      : 'Keep going, one step at a time.',
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),
          const Text(
            'Your schedule',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: medicineDark,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Your medicines for today',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 16),

          ...medicines.asMap().entries.map((entry) {
            final index = entry.key;
            final medicine = entry.value;
            final taken = medicine['taken'] as bool;

            return Container(
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: taken
                      ? const Color(0xFFDCDCF4)
                      : const Color(0xFFECE5DA),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.035),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: taken
                              ? const Color(0xFFEAEAF8)
                              : const Color(0xFFFFEEE5),
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: Icon(
                          Icons.medication_outlined,
                          color: taken ? medicineIndigo : medicineCoral,
                          size: 29,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              medicine['name'] as String,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: medicineDark,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              '${medicine['dosage']}  •  ${medicine['time']}',
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (taken)
                        const Icon(
                          Icons.check_circle_rounded,
                          color: medicineIndigo,
                          size: 25,
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: taken
                          ? null
                          : () {
                              setState(() {
                                medicines[index]['taken'] = true;
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '${medicine['name']} marked as taken.',
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: taken
                            ? const Color(0xFFEAEAF8)
                            : medicineIndigo,
                        disabledBackgroundColor: const Color(0xFFEAEAF8),
                        foregroundColor: Colors.white,
                        disabledForegroundColor: medicineIndigo,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        taken ? '✓  Marked as Taken' : 'Mark as Taken',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEEE5),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  color: medicineCoral,
                  size: 23,
                ),
                SizedBox(width: 11),
                Expanded(
                  child: Text(
                    'Reminder: follow the dosage and schedule provided by your healthcare professional.',
                    style: TextStyle(
                      color: medicineDark,
                      fontSize: 13,
                      height: 1.5,
                    ),
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
