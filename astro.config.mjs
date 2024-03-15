import { defineConfig } from 'astro/config';
import vercel from '@astrojs/vercel/static';
import solidJs from "@astrojs/solid-js";
import {
  transformerNotationDiff,
  transformerMetaHighlight,
  transformerMetaWordHighlight
} from '@shikijs/transformers';

// https://docs.astro.build/en/guides/internationalization/
// https://docs.astro.build/en/reference/configuration-reference/
// https://docs.astro.build/en/guides/integrations-guide/vercel/
// https://docs.astro.build/en/guides/integrations-guide/solid-js/

// Remember https://shiki.style/packages/transformers
// USEFUL!!!: https://github.com/shikijs/shiki/issues/3#issuecomment-881312748

export default defineConfig({
  site: 'https://rasbat.se',
  trailingSlash: 'never',

  srcDir: './src',
  publicDir: './static',
  outDir: './dist',
  output: 'server',

  build: {
    format: 'preserve',
    inlineStylesheets: 'never'
  },

  server: {
    port: 8080,
    host: false,
    open: '/'
  },

  markdown: {
    shikiConfig: {
      theme: 'slack-dark',
      wrap: false,
      transformers: [
        transformerNotationDiff(),
        transformerMetaHighlight(),
        transformerMetaWordHighlight()
      ]
    }
  },

  i18n: {
    defaultLocale: 'sv-SE',
    locales: ['sv-SE', 'en-UK'],
    routing: {
      prefixDefaultLocale: true,
      redirectToDefaultLocale: false // vercel handles this
    }
  },

  adapter: vercel(),

  integrations: [
    solidJs()
  ]
});