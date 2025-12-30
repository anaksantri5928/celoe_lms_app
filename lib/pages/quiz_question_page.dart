import 'package:flutter/material.dart';

class QuizQuestionPage extends StatefulWidget {
  const QuizQuestionPage({super.key});

  @override
  State<QuizQuestionPage> createState() => _QuizQuestionPageState();
}

class _QuizQuestionPageState extends State<QuizQuestionPage> {
  static const primaryRed = Color(0xFFB71C1C);

  int currentQuestion = 1;
  int totalQuestion = 15;
  int? selectedOption;

  final List<String> options = [
    'Jenis Kelamin',
    'Alamat',
    'Hobby',
    'Riwayat Pendidikan',
    'Umur',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// APP BAR
      appBar: AppBar(
        backgroundColor: primaryRed,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Quiz Review 1',
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: const [
                Icon(Icons.alarm, size: 18),
                SizedBox(width: 4),
                Text(
                  '15 : 00',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _questionNavigation(),
            const SizedBox(height: 20),
            Text(
              'Soal Nomor $currentQuestion / $totalQuestion',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            const Text(
              'Radio button dapat digunakan untuk menentukan ?',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 24),
            ..._buildOptions(),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton(
                onPressed: () {
                  if (currentQuestion < totalQuestion) {
                    setState(() {
                      currentQuestion++;
                      selectedOption = null;
                    });
                  }
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('Soal Selanjutnya'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= NAVIGASI NOMOR =================
  Widget _questionNavigation() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: totalQuestion,
        separatorBuilder: (_, __) => const SizedBox(width: 6),
        itemBuilder: (context, index) {
          final number = index + 1;
          final isActive = number == currentQuestion;

          return GestureDetector(
            onTap: () {
              setState(() {
                currentQuestion = number;
                selectedOption = null;
              });
            },
            child: Container(
              width: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isActive ? primaryRed : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Text(
                number.toString(),
                style: TextStyle(
                  fontSize: 12,
                  color: isActive ? Colors.white : Colors.black,
                  fontWeight:
                      isActive ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ================= PILIHAN JAWABAN =================
  List<Widget> _buildOptions() {
    return List.generate(options.length, (index) {
      final isSelected = selectedOption == index;

      return GestureDetector(
        onTap: () {
          setState(() {
            selectedOption = index;
          });
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: isSelected ? Colors.red.shade400 : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Text(
                '${String.fromCharCode(65 + index)}.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  options[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
