class Project {
  final String title;
  final String tech;
  final String role;
  final String desc;

  const Project({
    required this.title,
    required this.tech,
    required this.role,
    required this.desc,
  });
}
/// List of all portfolio projects
const List<Project> projects = [
  Project(
    title: 'FleetAnalytix – Fleet Management & Auditing App',
    tech: 'Flutter, SQLite, Native Android (DataWedge API), REST APIs',
    role: 'End-to-end development from scratch',
    desc:
    'Built auditing, lot reporting, and trip tracking features. Integrated Zebra barcode scanner using native Android code with Flutter via platform channels for fast, accurate scanning.',
  ),
  Project(
    title: 'Inplass – Hotel & F&B Management App',
    tech: 'Flutter, Firebase, BLoC',
    role: 'Bug fixing, feature enhancement',
    desc:
    'Improved task management, order processing, and real-time updates.',
  ),
  Project(
    title: 'Hornbill – Time-Monitoring & Remote Control App',
    tech: 'Flutter, Firebase, Bluetooth',
    role: 'Feature implementation & performance optimization',
    desc:
    'Implemented Bluetooth connectivity to integrate with a Raspberry Pi for controlling a motorized desk and optimized performance.',
  ),
  Project(
    title: 'Doctor Live App – Online Consultancy Platform',
    tech: 'Flutter, Firebase, WebRTC (or third-party video SDK)',
    role: 'Feature integration',
    desc:
    'Integrated video and voice calling functionalities, enhanced appointment scheduling and real-time chat features.',
  ),
  Project(
    title: 'Logistic App – Trader & Driver Logistics Platform',
    tech: 'Flutter, REST APIs',
    role: 'Full app development',
    desc:
    'Built separate apps for traders and drivers to streamline operations.',
  ),
  Project(
    title: 'Adil App – Site Inspection & Project Tracking',
    tech: 'Flutter',
    role: 'Full-cycle development',
    desc:
    'Designed and developed full-cycle inspection tracking solution for engineers.',
  ),
];
