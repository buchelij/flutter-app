
class Resources {
  String id;
  String name;
  String description;
  DateTime date;
  String image;

  Resources({
    required this.date,
    required this.name,
    required this.description,
    required this.image,
    required this.id,

  });
}
final List<Resources> resources = [
  Resources(
    name: "Educational Resource Page Example",
    description: "Join us today for some Law and order, Formed in 2009. The",
    date: DateTime.now().add(const Duration(days: 33)),
    image: '',
    id: '1',
  ),
  Resources(
    name: "Project Resource page",
    date: DateTime.now().add(const Duration(days: 33)),
    description: "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    image: '',
    id: '2',
  ),
  Resources(
    name: "Online Courses",
    date: DateTime.now().add(const Duration(days: 12)),
    description: "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    image: '',
    id: '3',
  ),
  Resources(
    name: "Warner Brothers",
    date: DateTime.now().add(const Duration(days: 1)),
    description: "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    image: '',
    id: '4',
  ),
  Resources(
    name: "Science4You",
    date: DateTime.now().add(const Duration(days: 4)),
    description: "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    image: '',
    id: '5',
  ),
  Resources(
    name: "Robotics",
    date: DateTime.now().add(const Duration(days: 2)),
    description: "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    image: '',
    id: '6',
  ),
  Resources(
    name: "Rock Concert",
    date: DateTime.now().add(const Duration(days: 21)),
    description: "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    image: '',
    id: '7',
  ),
  Resources(
    name: "Songwriters in Concert",
    date: DateTime.now().add(const Duration(days: 16)),
    description: "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    image: '',
    id: '8',
  ),
];



