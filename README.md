# Charlie Kilpatrick

Personal academic website. Content is sourced from [Northwestern CIERA](https://ciera.northwestern.edu/directory/charlie-kilpatrick/).

## Pages

- **Home** (`index.html`) — Photo, contact, bio
- **Research** (`research.html`) — Research overview and topics
- **Publications** (`publications.html`) — Publication list
- **CV** (`cv.html`) — Curriculum vitae / download link (`assets/kilpatrick_cv_full.pdf`)

## Update CV (copy, commit, push)

From the repo root, after making the script executable once (`chmod +x scripts/update.sh`):

```bash
./scripts/update.sh
```

This copies your latest CV into `assets/kilpatrick_cv_full.pdf`, commits if the file changed, and pushes to GitHub.

**Default source path:** `$HOME/Dropbox/CV/cv/kilpatrick_cv_full.pdf`  
If your PDF lives elsewhere (for example under iCloud Dropbox):

```bash
CV_SOURCE="$HOME/Library/CloudStorage/Dropbox/CV/cv/kilpatrick_cv_full.pdf" ./scripts/update.sh
```

If the PDF is identical to the last commit, the script exits without committing or pushing.

## Local preview

Open `index.html` in a browser, or use a simple server:

```bash
python3 -m http.server 8000
```

Then visit http://localhost:8000
