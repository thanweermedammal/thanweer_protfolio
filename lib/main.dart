import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';
import 'package:thanweer_protfolio/projects.dart';
import 'package:url_launcher/url_launcher.dart';
void main() => runApp(const PortfolioApp());

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thanweer M — Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});
  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  int _index = 0;
  final sections = const ['About', 'Projects', 'Skills', 'Experience', 'Education', 'Contact'];
  void _onNav(int i) => setState(() => _index = i);

  final linkedInUrl = 'https://www.linkedin.com/in/thanweer-medammal';

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 1000;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade700,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.flutter_dash, color: Colors.white),
          const SizedBox(width: 8),
          const Text('Thanweer M — Flutter Developer', style: TextStyle(color: Colors.white)),
        ]),
        centerTitle: true,
      ),
      drawer: isWide ? null : Drawer(child: _buildDrawer()),
      body: Row(children: [
        if (isWide)
          NavigationRail(
            selectedIndex: _index,
            onDestinationSelected: _onNav,
            backgroundColor: Colors.indigo.shade50,
            labelType: NavigationRailLabelType.selected,
            selectedIconTheme: const IconThemeData(color: Colors.indigo, size: 22),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            selectedLabelTextStyle: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
            destinations:  const [
              NavigationRailDestination(icon: Icon(Icons.person), label: Text('About')),
              NavigationRailDestination(icon: Icon(Icons.work), label: Text('Projects')),
              NavigationRailDestination(icon: Icon(Icons.code), label: Text('Skills')),
              NavigationRailDestination(icon: Icon(Icons.timeline), label: Text('Experience')),
              NavigationRailDestination(icon: Icon(Icons.school), label: Text('Education')),
              NavigationRailDestination(icon: Icon(Icons.mail), label: Text('Contact')),
            ],
          ),
        Expanded(
          child:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildSection(_index),
          )
        ),
      ]),
      bottomNavigationBar: isWide
          ? null
          : NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: _onNav,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.person), label: 'About'),
          NavigationDestination(icon: Icon(Icons.work), label: 'Projects'),
          NavigationDestination(icon: Icon(Icons.code), label: 'Skills'),
          NavigationDestination(icon: Icon(Icons.timeline), label: 'Experience'),
          NavigationDestination(icon: Icon(Icons.school), label: 'Education'),
          NavigationDestination(icon: Icon(Icons.mail), label: 'Contact'),
        ],
      ),
    );
  }
  Widget _buildSection(int index) {
    switch (index) {
      case 0:
        return _heroAbout();
      case 1:
        return _projectsSection();
      case 2:
        return _skillsSection();
      case 3:
        return _experienceSection();
      case 4:
        return _educationSection();
      case 5:
        return _contactSection();
      default:
        return const SizedBox.shrink();
    }
  }
  Widget _buildDrawer() {
    return Column(children: [
      UserAccountsDrawerHeader(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.indigo, Colors.purple])),
        accountName: const Text('Thanweer M'),
        accountEmail: const Text('Flutter Developer'),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: const AssetImage('assets/images/my_photo.jpg'),
        ),
      ),
      for (int i = 0; i < sections.length; i++)
        ListTile(title: Text(sections[i]), onTap: () => _onNav(i)),
    ]);
  }

  Widget _heroAbout() {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Hero banner
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(colors: [Colors.indigo.shade600, Colors.purple.shade400]),
          ),
          child: Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/images/my_photo.jpg', width: 160, height: 160, fit: BoxFit.cover),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Thanweer M', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                const Text('Building high-quality cross-platform apps with Flutter', style: TextStyle(color: Colors.white70, fontSize: 16)),
                const SizedBox(height: 12),
                const Text(
                  'Dynamic Flutter Developer with 3+ years of experience in designing, developing, and optimizing cross-platform mobile applications. Proficient in Dart, Flutter, Firebase, REST APIs, and SQLite. Skilled in state management (BLoC, Provider), native code integration, and performance optimization.',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 12),
                Row(children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _launchLink(linkedInUrl),
                      icon: const FaIcon(FontAwesomeIcons.linkedin),
                      label: const Text('LinkedIn'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade800),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _downloadCV(),
                      icon: const Icon(Icons.download),
                      label: const Text('Download CV'),
                      style: OutlinedButton.styleFrom(backgroundColor: Colors.white24, foregroundColor: Colors.white),
                    ),
                  )
                ])
              ]),
            )
          ]),
        ),

        const SizedBox(height: 28),
        const Text('Quick Facts', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Wrap(spacing: 12, children: const [
          Chip(label: Text('Location: Tirur, Kerala')),
          Chip(label: Text('Availability: Open to full-time & contract')),
          Chip(label: Text('Experience: 3+ years')),
        ]),
      ]),
    );
  }

  Widget _projectsSection() {


    final cross = MediaQuery.of(context).size.width > 1400 ? 3 : MediaQuery.of(context).size.width > 900 ? 2 : 1;

    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Projects', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: cross, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 1.2),
          itemCount: projects.length,
          itemBuilder: (context, i) {
            final p = projects[i];
            return FadeInUp(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(p.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 6),
                    Text(p.tech, style: const TextStyle(color: Colors.grey)),
                    const SizedBox(height: 8),
                    Expanded(child: Text(p.desc)),
                    const SizedBox(height: 8),
                    Text('Role: ${p.role}', style: const TextStyle(fontStyle: FontStyle.italic)),
                  ]),
                ),
              ),
            );
          },
        ),
      ]),
    );
  }

  Widget _skillsSection() {
    final skills = [
      'Dart', 'Flutter', 'Firebase (Firestore & Realtime DB)', 'SQLite', 'REST APIs', 'BLoC', 'Provider', 'Git', 'Bitbucket', 'Android Studio', 'VS Code', 'Performance Optimization', 'Native Android integration', 'Google Maps API', 'FCM'
    ];

    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Technical Skills', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Wrap(spacing: 8, runSpacing: 8, children: skills.map((s) => Chip(label: Text(s))).toList()),
        const SizedBox(height: 20),
        const Text('Core Skills & Practices', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('- State Management: BLoC, Provider - Native code integration (Android) - App debugging & optimization - Unit & widget testing - CI/CD basics'),
      ]),
    );
  }

  Widget _experienceSection() {
    final experiences = [
      {
        'org': 'Wiinnova',
        'role': 'Flutter Developer',
        'period': 'Mar 2023 – Present',
        'bullets': [
          'Collaborated with backend, UI/UX, and QA teams to deliver high-quality apps.',
          'Contributed to feature planning, API integration, and state management.',
          'Optimized app load times by ~30% through performance profiling and code improvements.'
        ]
      },
      {
        'org': 'Optimist Tech Hub',
        'role': 'Flutter Developer',
        'period': 'Sep 2022 – Mar 2023',
        'bullets': [
          'Integrated third-party APIs to extend app functionality.',
          'Resolved critical bugs, reducing crash rate by ~20%.',
          'Implemented Agile practices to speed up delivery.'
        ]
      },
      {
        'org': 'Tech Friar',
        'role': 'Flutter Developer (Trainee)',
        'period': 'May 2022 – Aug 2022',
        'bullets': ['Gained practical experience in development workflows, UI fixes, and debugging.']
      }
    ];

    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Professional Experience', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        for (final e in experiences) _expCard(e),
      ]),
    );
  }

  Widget _expCard(Map e) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const Icon(Icons.business, color: Colors.indigo),
            const SizedBox(width: 8),
            Text(e['org'], style: const TextStyle(fontWeight: FontWeight.bold)),
            const Spacer(),
            Text(e['period'], style: const TextStyle(color: Colors.grey)),
          ]),
          const SizedBox(height: 8),
          Text(e['role'], style: const TextStyle(fontStyle: FontStyle.italic)),
          const SizedBox(height: 8),
          for (final b in e['bullets']) Text('• $b'),
        ]),
      ),
    );
  }

  Widget _educationSection() {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        Text('Education', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: Icon(Icons.school, color: Colors.indigo),
            title: Text('B.Tech – Computer Science Engineering'),
            subtitle: Text('AVIT Engineering College, Chennai — CGPA: 7.81'),
          ),
        ),
        SizedBox(height: 8),
        Card(
          child: ListTile(
            leading: Icon(Icons.school, color: Colors.indigo),
            title: Text('Higher Secondary — IU Higher Secondary School'),

          ),
        ),
        SizedBox(height: 8),
        Card(
          child: ListTile(
            leading: Icon(Icons.school, color: Colors.indigo),
            title: Text('Secondary Education — PKMMHSS Edarikkode'),
          ),
        ),
      ]),
    );
  }

  Widget _contactSection() {
    return Center(
      child: FadeInUp(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Let's Connect", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Text('Phone: +91-9995291385'),
          const SizedBox(height: 6),
          const Text('Email: thanweermedammal0@gmail.com'),
          const SizedBox(height: 6),
          const Text('Location: Tirur, Kerala, India'),
          const SizedBox(height: 12),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            IconButton(onPressed: () => _launchLink(linkedInUrl), icon: const FaIcon(FontAwesomeIcons.linkedin, size: 28, color: Colors.blue)),
            const SizedBox(width: 12),
            IconButton(onPressed: () => _downloadCV(), icon: const Icon(Icons.download, size: 28)),
          ])
        ]),
      ),
    );
  }


  void _launchLink(String url) async{
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Could not open link')),
    );
    }
  }

  void _downloadCV() async{
    const cvUrl = 'https://drive.google.com/file/d/1GP1xTpz2qIPujsBC04GjpGX-AvL2P7wN/preview';
    final uri = Uri.parse(cvUrl);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open CV link')),
      );
    }
  }
}
