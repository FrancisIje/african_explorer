/**
 * Below are the colors that are used in the app. The colors are defined in the light and dark mode.
 * There are many other ways to style your app. For example, [Nativewind](https://www.nativewind.dev/), [Tamagui](https://tamagui.dev/), [unistyles](https://reactnativeunistyles.vercel.app), etc.
 *
 * The palette mirrors the `African Explorer` variable collection in the
 * "African Explorer — Safari App UI" Figma file. That collection ships a single
 * (dark) mode, so `dark` matches the design 1:1 and `light` is its cream-ground
 * counterpart built from `color/bg/cream`.
 */

import '@/global.css';

import { Platform } from 'react-native';

export const Colors = {
  light: {
    /** Figma `color/bg/base`, used as ink on cream */
    text: '#17120F',
    /** Figma `color/bg/cream` */
    background: '#FFFFFF',
    backgroundElement: '#F3EFEA',
    backgroundSelected: '#E6DFD8',
    surface: '#F3EFEA',
    textSecondary: '#6B6259',
    /** Figma `color/accent/red` */
    accent: '#E8402A',
    /** Figma `color/accent/sunset` */
    accentPressed: '#C03A25',
  },
  dark: {
    /** Figma `color/text/primary` */
    text: '#FFFFFF',
    /** Figma `color/bg/base` */
    background: '#17120F',
    /** Figma `color/bg/surface` */
    backgroundElement: '#2E2724',
    backgroundSelected: '#3B3330',
    /** Figma `color/bg/surface` */
    surface: '#2E2724',
    /** Figma `color/text/secondary` */
    textSecondary: '#9A8F86',
    /** Figma `color/accent/red` */
    accent: '#E8402A',
    /** Figma `color/accent/sunset` */
    accentPressed: '#C03A25',
  },
} as const;

export type ThemeColor = keyof typeof Colors.light & keyof typeof Colors.dark;

export const Fonts = Platform.select({
  ios: {
    /** iOS `UIFontDescriptorSystemDesignDefault` */
    sans: 'system-ui',
    /** iOS `UIFontDescriptorSystemDesignSerif` */
    serif: 'ui-serif',
    /** iOS `UIFontDescriptorSystemDesignRounded` */
    rounded: 'ui-rounded',
    /** iOS `UIFontDescriptorSystemDesignMonospaced` */
    mono: 'ui-monospace',
  },
  default: {
    sans: 'normal',
    serif: 'serif',
    rounded: 'normal',
    mono: 'monospace',
  },
  web: {
    sans: 'var(--font-display)',
    serif: 'var(--font-serif)',
    rounded: 'var(--font-rounded)',
    mono: 'var(--font-mono)',
  },
});

export const Spacing = {
  half: 2,
  one: 4,
  two: 8,
  three: 16,
  four: 24,
  five: 32,
  six: 64,
  /** Figma `space/gap` */
  gap: 12,
  /** Figma `space/gutter` */
  gutter: 24,
} as const;

/** Figma `radius/*` */
export const Radius = {
  card: 6,
  pill: 999,
} as const;

export const BottomTabInset = Platform.select({ ios: 50, android: 80 }) ?? 0;
export const MaxContentWidth = 800;
