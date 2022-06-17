class Ticket {
  final int id, price, nbplace, numplace;
  final String title, description, image;

  Ticket(
      {required this.id,
      required this.price,
      required this.title,
      required this.description,
      required this.nbplace,
      required this.numplace,
      required this.image});
}

// list of products
// for our demo
List<Ticket> tickets = [
  Ticket(
    id: 1,
    price: 20000,
    title: "Lome  Kara",
    image: "assets/images/alikara.jpeg",
    description: "voummmmmmmmmmmm",
    nbplace: 1,
    numplace: 22,
  ),
  Ticket(
    id: 2,
    price: 68000,
    title: "Lome  Atakpame",
    image: "assets/images/atakpame.jpeg",
    description: "départ  arrivé",
    nbplace: 1,
    numplace: 33,
  ),
  Ticket(
    id: 3,
    price: 39000,
    title: "Lome  Dapaong",
    image: "assets/images/Dapaong.jpg",
    description: "voummmmmmmmmmmm",
    nbplace: 3,
    numplace: 10
  ),
  Ticket(
    id: 4,
    price: 39000,
    title: "Lome  Kpalime",
    image: "assets/images/kpalime.jpeg",
    description: "voummmmmmmmmmmm",
    nbplace: 1,
    numplace: 12
  ),
  Ticket(
    id: 5,
    price: 30000,
    title: "Dapaong  Lome",
    image: "assets/images/lome.jpg",
    description: "voummmmmmmmmmmm",
    nbplace: 4,
    numplace: 3
  ),
  Ticket(
    id: 6,
    price: 90400,
    title: "Lome  Sokode",
    image: "assets/images/sokode.jpeg",
    description: "voummmmmmmmmmmm",
    nbplace: 2,
    numplace: 12,
  ),
];
