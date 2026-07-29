import 'package:firstsplashscreenview/firstsplashscreenview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FirstSplashScreenView Showcase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C5CE7),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const SplashScreenShowcase(),
    );
  }
}

class SplashScreenShowcase extends StatelessWidget {
  const SplashScreenShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return FirstSplashScreenView(
      preset: SplashPreset.liquidGlass,
      duration: const Duration(seconds: 3),
      nextPage: const ShowcaseHomeScreen(),
      titleText: 'FirstSplashScreenView',
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 26,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
      brandingKit: const BrandingKit(
        tagline: 'The #1 Splash Screen Package for Flutter',
        version: '1.0.0',
        copyright: '© 2026 imCoderAditya',
      ),
      child: const Icon(
        Icons.auto_awesome_rounded,
        size: 50,
        color: Colors.white,
      ),
    );
  }
}

class ShowcaseHomeScreen extends StatefulWidget {
  const ShowcaseHomeScreen({super.key});

  @override
  State<ShowcaseHomeScreen> createState() => _ShowcaseHomeScreenState();
}

class _ShowcaseHomeScreenState extends State<ShowcaseHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0E15),
      appBar: AppBar(
        title: const Text('100+ Splash Templates Explorer'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFF6C5CE7),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          tabs: const [
            Tab(icon: Icon(Icons.star_rounded), text: 'Core Presets'),
            Tab(icon: Icon(Icons.grid_view_rounded), text: '100+ Templates'),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [_buildPresetsTab(context), _buildTemplatesTab(context)],
        ),
      ),
    );
  }

  Widget _buildPresetsTab(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1F1D2B), Color(0xFF2A2D3E)],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.rocket_launch_rounded,
                  size: 48,
                  color: Color(0xFF6C5CE7),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Flagship Splash Experience',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Choose a preset below to instantly preview built-in presets.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView(
              children: [
                _buildPresetTile(
                  context: context,
                  preset: SplashPreset.apple,

                  title: 'Apple Style Splash',
                  subtitle: 'Minimal, elegant dark theme with scaling logo',
                  icon: Icons.apple,
                  accentColor: Colors.white,
                ),
                _buildPresetTile(
                  context: context,
                  preset: SplashPreset.light,
                  particleType: ParticleType.stars,

                  title: 'Rain & Monsoon Splash',
                  subtitle: 'Serene rainy atmosphere over dark night sky',
                  icon: Icons.umbrella_rounded,
                  accentColor: Colors.lightBlueAccent,
                ),
                _buildPresetTile(
                  context: context,
                  preset: SplashPreset.liquidGlass,
                  title: 'Liquid Glass (iOS 26)',
                  subtitle: 'Frosted glassmorphic blur with aurora canvas',
                  icon: Icons.water_drop_rounded,
                  accentColor: Colors.cyanAccent,
                ),
                _buildPresetTile(
                  context: context,
                  preset: SplashPreset.cyberpunk,
                  title: 'Cyberpunk & Neon',
                  subtitle: 'Dark futuristic theme with typewriter text',
                  icon: Icons.memory_rounded,
                  accentColor: Colors.pinkAccent,
                ),
                _buildPresetTile(
                  context: context,
                  preset: SplashPreset.material3,
                  title: 'Material 3 / You',
                  subtitle: 'Dynamic color palette with bouncing logo',
                  icon: Icons.palette_rounded,
                  accentColor: Colors.deepPurpleAccent,
                ),
                _buildPresetTile(
                  context: context,
                  preset: SplashPreset.ai,
                  particleType: ParticleType.stars,
                  title: 'AI & Space Engine',
                  subtitle: 'Cosmic starfield with atom orbit indicator',
                  icon: Icons.auto_awesome,
                  accentColor: Colors.tealAccent,
                ),
                _buildPresetTile(
                  context: context,
                  preset: SplashPreset.luxury,
                  title: 'Luxury Gold',
                  subtitle: 'Deep black with sparkle particle canvas',
                  icon: Icons.diamond_rounded,
                  accentColor: Colors.amber,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTemplatesTab(BuildContext context) {
    final allTemplates = SplashTemplate.values.where((t) {
      if (_searchQuery.isEmpty) return true;
      return t.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Search 100+ templates (e.g. crypto, ai, luxury)...',
              hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.4)),
              prefixIcon: const Icon(Icons.search, color: Colors.white70),
              filled: true,
              fillColor: const Color(0xFF161824),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (val) {
              setState(() {
                _searchQuery = val;
              });
            },
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.6,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: allTemplates.length,
              itemBuilder: (context, index) {
                final template = allTemplates[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => FirstSplashScreenView(
                          template: template,
                          duration: const Duration(seconds: 3),
                          nextPage: const ShowcaseHomeScreen(),
                          titleText: template.name.toUpperCase(),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161824),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.08),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.style_rounded,
                          color: Color(0xFF6C5CE7),
                          size: 28,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          template.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPresetTile({
    required BuildContext context,
    required SplashPreset preset,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color accentColor,
    ParticleType? particleType,
    List<Color>? particleColors,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF161824),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: accentColor.withValues(alpha: 0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: accentColor, size: 24),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.6),
            fontSize: 12,
          ),
        ),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: accentColor.withValues(alpha: 0.2),
            foregroundColor: accentColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => FirstSplashScreenView(
                  preset: preset,
                  particleType: particleType,
                  particleColors: particleColors,
                  duration: const Duration(seconds: 3),
                  nextPage: const ShowcaseHomeScreen(),
                  titleText: title,
                  child: Icon(icon, size: 48, color: accentColor),
                ),
              ),
            );
          },
          child: const Text('Preview'),
        ),
      ),
    );
  }
}
