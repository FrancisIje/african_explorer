import { SymbolView } from 'expo-symbols';
import { Link } from 'expo-router';
import { useMemo, useState } from 'react';
import { FlatList, Pressable, StyleSheet, TextInput } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { sampleTours } from '@/constants/sample-tours';
import { BottomTabInset, MaxContentWidth, Radius, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';

export default function SearchScreen() {
  const insets = useSafeAreaInsets();
  const theme = useTheme();
  const [query, setQuery] = useState('');

  const results = useMemo(
    () => sampleTours.filter((tour) => tour.title.toLowerCase().includes(query.toLowerCase())),
    [query],
  );

  return (
    <ThemedView style={styles.container}>
      <ThemedView style={[styles.header, { paddingTop: insets.top + Spacing.four }]}>
        <ThemedText type="subtitle">Search</ThemedText>
        <ThemedView type="backgroundElement" style={styles.searchBar}>
          <SymbolView
            tintColor={theme.textSecondary}
            name={{ ios: 'magnifyingglass', android: 'search', web: 'search' }}
            size={16}
          />
          <TextInput
            value={query}
            onChangeText={setQuery}
            placeholder="Search tours"
            placeholderTextColor={theme.textSecondary}
            style={[styles.input, { color: theme.text }]}
          />
        </ThemedView>
      </ThemedView>

      <FlatList
        style={styles.list}
        contentContainerStyle={[styles.listContent, { paddingBottom: insets.bottom + BottomTabInset }]}
        data={results}
        keyExtractor={(tour) => tour.id}
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
        ListEmptyComponent={
          <ThemedText type="small" themeColor="textSecondary" style={styles.empty}>
            No tours match “{query}”.
          </ThemedText>
        }
      />
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  header: {
    alignSelf: 'center',
    width: '100%',
    maxWidth: MaxContentWidth,
    paddingHorizontal: Spacing.four,
    gap: Spacing.three,
  },
  searchBar: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.two,
    paddingHorizontal: Spacing.three,
    paddingVertical: Spacing.two,
    borderRadius: Radius.pill,
  },
  input: {
    flex: 1,
    fontSize: 16,
  },
  list: {
    flex: 1,
    alignSelf: 'center',
    width: '100%',
    maxWidth: MaxContentWidth,
  },
  listContent: {
    paddingHorizontal: Spacing.four,
    paddingTop: Spacing.three,
    gap: Spacing.three,
  },
  card: {
    gap: Spacing.half,
    padding: Spacing.three,
    borderRadius: Radius.card,
  },
  pressed: {
    opacity: 0.7,
  },
  empty: {
    textAlign: 'center',
    marginTop: Spacing.five,
  },
});
