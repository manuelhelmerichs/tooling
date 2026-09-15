---
name: zettelkasten
description: "Use when creating, updating, or researching notes ('zettel') in my zettelkasten."
---

# Zettelkasten

An Obsidian vault of atomic, densely interlinked notes ('zettel') on machine learning research. Zettel are short and concept-first, connected with `[[wikilinks]]` and arranged spatially on (JSON) `.canvas` maps.

## Locations

- Zettelkasten root: `~/Projects/zettelkasten`.
- Your write area: `~/Projects/zettelkasten/Actions`.
- Treat all other contents as read-only unless *explicitly* asked not to.
- Never edit `~/Projects/zettelkasten/zettelkasten.bib`; Zotero manages it.

### Actions

- The only folder you may write to, create, rename, or delete files in.
- Put every note you generate here - drafts from a conversation, summaries of your work, or proposed concept/paper/topic zettel.
- These are called actions because each zettel corresponds to one (or more) actions I need to take - mostly reviewing and understanding, but it can be anything!
- Use the same conventions as the rest of the vault (terse, atomic, LaTeX math, links to `[[Other zettel]]`). (Obsidian resolves by title, so no path is needed).
- Don't refile notes into `Concepts`/`Papers` yourself; leave that to me.

### Canvases

- Used by me to organize (concept, paper) zettel spatially, like a digital whiteboard.
- A canvas is JSON, so easy to parse and read, but do not modify them!

### Concepts

- One note per idea, method, or term (e.g. `Normalizing Flow`, `SBI`, `NPE`, `TabPFN`). The filename is the note title.
- Lives in `~/Projects/zettelkasten/Concepts`, optionally nested in a topical subfolder (e.g. `SBI methods/`, `Attention mechanisms/`).

### Papers

- A filename in `~/Projects/zettelkasten/Papers` corresponds to a specific paper. (The PDF is typically saved on disk.)
- The filename is the paper's BibTeX citekey, e.g. `daxFlowMatchingScalable2023.md`.
- These typically summarize the paper's core contribution and method, and link out to the relevant `[[Concepts]]` zettel and related work.

## Tags

I use the following action tags across all zettel and canvases:

```txt
#open/todo
#open/to-show
#open/question
#open/further-reading
#open/flashcard
```

I also use tags for projects, structured like `#project/name-of-the-project`.
