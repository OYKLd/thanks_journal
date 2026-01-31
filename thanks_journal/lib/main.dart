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
          primary: const Color(0xFF3A5A40), // vert sauge profond
          secondary: const Color(0xFFD4A373), // doré chaud
          background: const Color(0xFFFDF6EC), // crème chaud
        ),
        scaffoldBackgroundColor: const Color(0xFFFDF6EC),
        fontFamily: 'Nunito',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 20, color: Color(0xFF2F3E46)),
          bodyMedium: TextStyle(fontSize: 16, color: Color(0xFF2F3E46)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFF1EDE4),
          hintStyle: const TextStyle(color: Color(0xFF8A817C)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3A5A40),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            elevation: 2,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
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
                'Bonjour 🌿\nDe quoi es-tu reconnaissant aujourd’hui ?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF3A5A40),
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
                  hintText: 'Note ici un moment, une personne, une émotion…',
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
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6B705C),
                  ),
                ),
              const SizedBox(height: 12),
              Expanded(
                child: _entries.isEmpty
                    ? const SizedBox.shrink()
                    : ListView.separated(
                        itemCount: _entries.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: 14),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF1EDE4),
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Text(
                              _entries[index],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF344E41),
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