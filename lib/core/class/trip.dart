// ignore_for_file: constant_identifier_names

enum Season {
  Winter,
  Spring,
  Summer,
  Autumn,
}

enum TripType {
  Exploration,
  Recovery,
  Activities,
  Therapy,
}

class Trip {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> activities;
  final List<String> program;
  final int duration;
  final Season season;
  final TripType tripType;
  final bool isInWinter;
  final bool isInSpring;
  final bool isInSummer;
  final bool isInAutumn;

  final bool isForFamilies;
  const Trip({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.activities,
    required this.program,
    required this.duration,
    required this.season,
    required this.tripType,
    required this.isInWinter,
    required this.isInSpring,
    required this.isInSummer,
    required this.isInAutumn,
    required this.isForFamilies,
  });
}