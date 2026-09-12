# to-delete

Files moved out of the way during the post-revival modernization pass
(Hugo 0.73.0 to 0.166.0, GitHub Actions bumps). None of them affects the built
site: the full output of Hugo 0.166.0 was compared file-by-file against the
0.73.0 baseline after these moves, with 0 URLs lost and 0 URLs added.

Kept here rather than deleted outright so they can be reviewed before
`rm -rf to-delete/`.

| File | Origin | Why it is here |
|---|---|---|
| `Dockerfile` | VPS-era deploy | Built the nginx image for the OVH VPS that no longer exists. The site is on GitHub Pages, built by `.github/workflows/deploy.yml`. Nothing consumed this any more, yet dependabot was still watching it. |
| `nginx-default.conf` | VPS-era deploy | nginx vhost with the 301/302 redirect rules. GitHub Pages has no server-side redirects, so the redirects that mattered were reimplemented as Hugo `aliases:` front matter and a static meta-refresh page during the revival. |
| `redeploy-if-change.sh` | VPS-era deploy | Polled git and rebuilt the Docker image on the VPS. Replaced entirely by the GitHub Actions workflow. |
| `TODO` | 2014-era notes | Stale scratch notes from the original Dotclear-to-Hugo migration. Everything actionable in it is either done or no longer relevant. |
| `static/notfound.html` | Dotclear era | Superseded by `static/404.html`, which is what GitHub Pages actually serves. This file was never referenced. |
| `static/.htaccess` | Dotclear era | Apache rewrite rules. Neither nginx nor GitHub Pages reads `.htaccess`, so it has been inert for over a decade. |
| `static/blog-resources/2019-09-learning/unoptimized-learnings.xcf` | 2019 post | 1 MB GIMP source file, published by accident alongside the exported PNG that the post actually uses. Source files do not belong in `static/`. |
| `content/blog/feed/rss2` | Dotclear era | A page resource of a branch bundle, so Hugo copied it verbatim to `/blog/feed/rss2`, where it returned HTTP 200 while serving raw unrendered Go template source (`{{ .Title }}` visible in the response body). `/blog/` itself is a 404. Moving it removes a live 200 URL, which Baptiste explicitly approved, since what it served was broken. |

## Considered and deliberately kept

- `static/dotclear/public/jrunscript.swf` (4.1 MB Flash). Flash is end-of-life
  and no browser can play it, but this is Baptiste's own screen recording of a
  jrunscript demo, and it is a live link from
  `content/post/2007/Sun-Tech-Days-mercredi-21.md:118`, where
  `jrunscript-presentation.jpg` is the clickable thumbnail for it. Moving it
  would break that link. Stays.
- The `!static/dotclear/public` negation in `.gitignore`. That directory still
  holds the images Dotclear-era posts link to, so the negation is still doing
  work.
