/// Placeholder tour data shared by the discover, search, and tour-details
/// screens until a real backend is wired up.
class SampleTour {
  const SampleTour({
    required this.id,
    required this.title,
    required this.location,
    required this.price,
  });

  final String id;
  final String title;
  final String location;
  final int price;
}

const List<SampleTour> sampleTours = [
  SampleTour(id: '1', title: 'Serengeti Safari', location: 'Tanzania', price: 1200),
  SampleTour(id: '2', title: 'Masai Mara Adventure', location: 'Kenya', price: 950),
  SampleTour(id: '3', title: 'Victoria Falls Trek', location: 'Zambia', price: 700),
  SampleTour(id: '4', title: 'Sahara Desert Expedition', location: 'Morocco', price: 850),
];
