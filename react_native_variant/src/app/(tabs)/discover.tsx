import { Link } from 'expo-router';
import { FlatList, Pressable, StyleSheet } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { sampleTours } from '@/constants/sample-tours';
import { BottomTabInset, MaxContentWidth, Radius, Spacing } from '@/constants/theme';

export default function DiscoverScreen() {
  const insets = useSafeAreaInsets();

  return (
    <ThemedView style={styles.container}>
      <FlatList
        style={styles.list}
        contentContainerStyle={[
          styles.listContent,
          { paddingTop: insets.top + Spacing.four, paddingBottom: insets.bottom + BottomTabInset },
        ]}
        data={sampleTours}
        keyExtractor={(tour) => tour.id}
        ListHeaderComponent={
          <ThemedText type="subtitle" style={styles.header}>
            Discover
          </ThemedText>
        }
        renderItem={({ item }) => (
          <Link href={{ pathname: '/tour-details/[id]', params: { id: item.id } }} asChild>
            <Pressable style={({ pressed }) => pressed && styles.pressed}>
              <ThemedView type="backgroundElement" style={styles.card}>
                <ThemedText type="smallBold">{item.title}</ThemedText>
                <ThemedText type="small" themeColor="textSecondary">
                  {item.location} · ${item.price}
                </ThemedText>
              </ThemedView>
            </Pressable>
          </Link>
        )}
      />
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  list: {
    flex: 1,
    alignSelf: 'center',
    width: '100%',
    maxWidth: MaxContentWidth,
  },
  listContent: {
    paddingHorizontal: Spacing.four,
    gap: Spacing.three,
  },
  header: {
    marginBottom: Spacing.two,
  },
  card: {
    gap: Spacing.half,
    padding: Spacing.three,
    borderRadius: Radius.card,
  },
  pressed: {
    opacity: 0.7,
  },
});
