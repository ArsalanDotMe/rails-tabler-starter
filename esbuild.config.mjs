#!/usr/bin/env node

let args = process.argv.slice(2);
let watch = args.includes('--watch')

import { context } from 'esbuild'
import { sassPlugin } from 'esbuild-sass-plugin'

let ctx = await context({
  entryPoints: [
    "app/assets/stylesheets/application.scss",
    "app/assets/stylesheets/application-cool.scss",
    "app/assets/stylesheets/rails_admin.scss",
  ],
  bundle: true,
  loader: {
    ".png": "dataurl",
    ".woff": "dataurl",
    ".woff2": "dataurl",
    ".eot": "dataurl",
    ".ttf": "dataurl",
    ".svg": "dataurl",
  },
  logLevel: "info",
  outdir: "app/assets/builds",
  plugins: [sassPlugin({ cssImports: true })],
})

if (watch) {
  console.log('Watching for changes...')
  await ctx.watch()
} else {
  console.log('Building...')
  await ctx.rebuild()
}