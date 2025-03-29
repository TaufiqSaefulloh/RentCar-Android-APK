class Cars {
  String name;
  String location;
  String description;
  String openDays;
  String openTime;
  String ticketPrice;
  String price;
  String imageAsset;
  List<String> imageUrls;

  Cars({
    required this.name,
    required this.location,
    required this.description,
    required this.openDays,
    required this.openTime,
    required this.ticketPrice,
    required this.price,
    required this.imageAsset,
    required this.imageUrls,
  });
}

var CarsList = [
  Cars(
    name: 'Avanza Reborn',
    location: 'Lembang',
    description:
        'Avanza Reborn 2024 1.3 lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nec nisl euismod',
    openDays: 'Open Everyday',
    openTime: '07.00 - 22.00',
    ticketPrice: 'Rp 400.000/24jam - 300.000/12jam - 40.000/jam',
    price: 'Rp 400.000/24jam',
    imageAsset: 'images/avanza.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/10/1b/fe/81.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/de/65/85.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/1b/fe/ca.jpg',
    ],
  ),
  Cars(
    name: 'Almaz Turbo 1.5',
    location: 'Lembang',
    description:
        'lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nec nisl euismod',
    openDays: 'Open Everyday',
    openTime: '07.00 - 22.00',
    ticketPrice: 'Rp 500.000/24jam - 400.000/12jam - 50.000/jam',
    price: 'Rp 500.000/24jam',
    imageAsset: 'images/almaz.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/10/1b/fe/81.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/de/65/85.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/1b/fe/ca.jpg',
    ],
  ),
  Cars(
    name: 'Brio Satya',
    location: 'Kota Bandung',
    description:
        'lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nec nisl euismod',
    openDays: 'Open Everyday',
    openTime: '07.00 - 22.00',
    ticketPrice: 'Rp 300.000/24jam - 200.000/12jam - 30.000/jam',
    price: 'Rp 300.000/24jam',
    imageAsset: 'images/brio.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/10/1b/fe/81.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/de/65/85.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/1b/fe/ca.jpg',
    ],
  ),
  Cars(
    name: 'Toyota Calya 1.2',
    location: 'Padalarang',
    description:
        'lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nec nisl euismod',
    openDays: 'Open Everyday',
    openTime: '07.00 - 22.00',
    ticketPrice: 'Rp 300.000/24jam - 200.000/12jam - 30.000/jam',
    price: 'Rp 300.000/24jam',
    imageAsset: 'images/calya.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/10/1b/fe/81.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/de/65/85.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/1b/fe/ca.jpg',
    ],
  ),
  Cars(
    name: 'Grandmax Pickup 1.5',
    location: 'Kota Bandung',
    description:
        'lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nec nisl euismod',
    openDays: 'Open Everyday',
    openTime: '07.00 - 22.00',
    ticketPrice: 'Rp 250.000/24jam - 200.000/12jam - 30.000/jam',
    price: 'Rp 250.000/24jam',
    imageAsset: 'images/grandmax.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/10/1b/fe/81.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/de/65/85.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/1b/fe/ca.jpg',
    ],
  ),
  Cars(
    name: 'Jazz RS',
    location: 'Kota Bandung',
    description:
        'lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nec nisl euismod',
    openDays: 'Open Everyday',
    openTime: '07.00 - 22.00',
    ticketPrice: 'Rp 400.000/24jam - 300.000/12jam - 40.000/jam',
    price: 'Rp 400.000/24jam',
    imageAsset: 'images/jazz.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/10/1b/fe/81.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/de/65/85.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/1b/fe/ca.jpg',
    ],
  ),
  Cars(
    name: 'Pajero Sport',
    location: 'Lembang',
    description:
        'lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nec nisl euismod',
    openDays: 'Open Everyday',
    openTime: '07.00 - 22.00',
    ticketPrice: 'Rp 600.000/24jam - 500.000/12jam - 60.000/jam',
    price: 'Rp 600.000/24jam',
    imageAsset: 'images/pajero.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/10/1b/fe/81.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/de/65/85.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/1b/fe/ca.jpg',
    ],
  ),
  Cars(
    name: 'Inova Zenix',
    location: 'Ciwidey',
    description:
        'lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nec nisl euismod',
    openDays: 'Open Everyday',
    openTime: '07:00 - 22:00',
    ticketPrice: 'Rp 600.000/24jam - 500.000/12jam - 60.000/jam',
    price: 'Rp 600.000/24jam',
    imageAsset: 'images/zenix.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/10/1b/fe/81.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/de/65/85.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/1b/fe/ca.jpg',
    ],
  ),
  Cars(
    name: 'yaris',
    location: 'Ciwidey',
    description:
        'lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nec nisl euismod',
    openDays: 'Open Everyday',
    openTime: '07.00 - 22.00',
    ticketPrice: 'Rp 350.000/24jam - 250.000/12jam - 35.000/jam',
    price: 'Rp 350.000/24jam',
    imageAsset: 'images/yaris.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/10/1b/fe/81.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/de/65/85.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/1b/fe/ca.jpg',
    ],
  ),
];
