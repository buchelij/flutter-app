class Event {
  String name;
  String description;
  DateTime eventDate;
  String image;
  String location;
  String organizer;
  num price;
  String status;

  Event({
    required this.eventDate,
    required this.image,
    required this.location,
    required this.name,
    required this.organizer,
    required this.price,
    required this.description,
    required this.status,
  });
}

final List<Event> upcomingEvents = [
  Event(
    name: "Law and Order",
    eventDate: DateTime.now().add(const Duration(days: 24)),
    image: 'https://source.unsplash.com/800x600/?concert',
    description: "Join us today for some Law and order, Formed in 2009. The",
    location: "Fairview Gospel Church",
    organizer: "Westfield Centre",
    price: 30, status: 'live',
  ),
  Event(
    name: "Live Orchestra",
    eventDate: DateTime.now().add(const Duration(days: 33)),
    image: 'https://source.unsplash.com/800x600/?band',
    description: "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    location: "David Geffen Hall",
    organizer: "Westfield Centre",
    price: 30, status: 'live',
  ),
  Event(
    name: "Math4You",
    eventDate: DateTime.now().add(const Duration(days: 12)),
    image: 'https://source.unsplash.com/800x600/h3kuhYUCE9A',
    description: "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    location: "The Cutting room",
    organizer: "Westfield Centre",
    price: 30, status: 'live',
  ),
];

final List<Event> nearbyEvents = [
  Event(
    name: "Warner Brothers",
    eventDate: DateTime.now().add(const Duration(days: 1)),
    image: 'https://source.unsplash.com/600x800/?concert',
    description: "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    location: "Fairview Gospel Church",
    organizer: "Westfield Centre",
    price: 30, status: 'live',
  ),
  Event(
    name: "Science4You",
    eventDate: DateTime.now().add(const Duration(days: 4)),
    image: 'https://source.unsplash.com/600x800/?live',
    description: "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    location: "David Geffen Hall",
    organizer: "Westfield Centre",
    price: 30, status: 'live',
  ),
  Event(
    name: "Robotics",
    eventDate: DateTime.now().add(const Duration(days: 2)),
    image: 'https://source.unsplash.com/600x800/?orchestra',
    description: "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    location: "The Cutting room",
    organizer: "Westfield Centre",
    price: 30, status: 'live',
  ),
  Event(
    name: "Rock Concert",
    eventDate: DateTime.now().add(const Duration(days: 21)),
    image: 'https://source.unsplash.com/600x800/?music',
    description: "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    location: "The Cutting room",
    organizer: "Westfield Centre",
    price: 32, status: 'live',
  ),
  Event(
    name: "Songwriters in Concert",
    eventDate: DateTime.now().add(const Duration(days: 16)),
    image: 'https://source.unsplash.com/gySMaocSdqs/600x300',
    description: "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    location: "David Field",
    organizer: "Westfield Centre",
    price: 14, status: 'live',
  ),
];



  