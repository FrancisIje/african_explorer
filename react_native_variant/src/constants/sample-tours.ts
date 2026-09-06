/** Placeholder tour data shared by the discover, search, and tour-details screens. */
export type SampleTour = {
  id: string;
  title: string;
  location: string;
  price: number;
};

export const sampleTours: SampleTour[] = [
  { id: '1', title: 'Serengeti Safari', location: 'Tanzania', price: 1200 },
  { id: '2', title: 'Masai Mara Adventure', location: 'Kenya', price: 950 },
  { id: '3', title: 'Victoria Falls Trek', location: 'Zambia', price: 700 },
  { id: '4', title: 'Sahara Desert Expedition', location: 'Morocco', price: 850 },
];

export function findSampleTour(id: string): SampleTour {
  return (
    sampleTours.find((tour) => tour.id === id) ?? {
      id,
      title: `Tour ${id}`,
      location: 'Unknown',
      price: 0,
    }
  );
}
