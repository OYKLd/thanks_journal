import 'package:flutter/material.dart';

void main() {
  runApp(const GratitudeJournalApp());
}

class GratitudeJournalApp extends StatelessWidget {
  const GratitudeJournalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Journal de Gratitude',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: const Color(0xFFB3C2BF), // bleu/gris pastel
          background: const Color(0xFFF6F5F2), // beige très clair
          secondary: const Color(0xFFD9D9D6), // gris doux
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F5F2),
        fontFamily: 'Nunito',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 20, color: Color(0xFF444444)),
          bodyMedium: TextStyle(fontSize: 16, color: Color(0xFF444444)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFFF0EFEB),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFB3C2BF),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          ),
        ),
      ),
      home: const GratitudeHomePage(),
    );
  }
}

class GratitudeHomePage extends StatefulWidget {
  const GratitudeHomePage({super.key});

  @override
  State<GratitudeHomePage> createState() => _GratitudeHomePageState();
}

class _GratitudeHomePageState extends State<GratitudeHomePage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _entries = [];

  void _addEntry() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _entries.insert(0, text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Bonjour, de quoi es-tu reconnaissant aujourd’hui ?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF444444),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _controller,
                minLines: 3,
                maxLines: 5,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  hintText: 'Écris ici ta gratitude du jour…',
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: _addEntry,
                  child: const Text('Enregistrer'),
                ),
              ),
              const SizedBox(height: 32),
              if (_entries.isNotEmpty)
                const Text(
                  'Tes gratitudes précédentes',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF888888),
                  ),
                  textAlign: TextAlign.left,
                ),
              const SizedBox(height: 8),
              Expanded(
                child: _entries.isEmpty
                    ? const SizedBox.shrink()
                    : ListView.separated(
                        itemCount: _entries.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0EFEB),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Text(
                              _entries[index],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF444444),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
