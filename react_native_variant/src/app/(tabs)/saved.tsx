import { SymbolView } from 'expo-symbols';
import { StyleSheet } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { MaxContentWidth, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';

export default function SavedScreen() {
  const insets = useSafeAreaInsets();
  const theme = useTheme();

  return (
    <ThemedView style={styles.container}>
      <ThemedView style={[styles.content, { paddingTop: insets.top + Spacing.four }]}>
        <ThemedText type="subtitle">Saved</ThemedText>
        <ThemedView style={styles.empty}>
          <SymbolView
            tintColor={theme.textSecondary}
            name={{ ios: 'bookmark', android: 'bookmark_border', web: 'bookmark' }}
            size={48}
          />
          <ThemedText type="small" themeColor="textSecondary" style={styles.emptyText}>
            Tours you save will show up here.
          </ThemedText>
        </ThemedView>
      </ThemedView>
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  content: {
    flex: 1,
    alignSelf: 'center',
    width: '100%',
    maxWidth: MaxContentWidth,
    paddingHorizontal: Spacing.four,
    gap: Spacing.three,
  },
  empty: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    gap: Spacing.three,
  },
  emptyText: {
    textAlign: 'center',
  },
});
