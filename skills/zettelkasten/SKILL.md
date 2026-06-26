---
name: zettelkasten
description: "Use when creating, updating, or researching notes ('zettel') in my zettelkasten, especially when asked to create a zettel from a conversation, question, your work, topic, paper, or other notes."
---

# Zettelkasten

An Obsidian vault of atomic, densely interlinked notes ('zettel') on machine learning research. Zettel are short and concept-first, connected with Obsidian `[[wikilinks]]` and arranged spatially on (JSON) `.canvas` maps.

## Locations

- Zettelkasten root: `~/Projects/zettelkasten`.
- Your write area: `~/Projects/zettelkasten/Action zettel`. Only write, create, rename, or delete files inside `Action zettel`!
- Treat all other contents as read-only unless *explicitly* asked not to.
- Never edit (reformat, sort, or fix) `~/projects/zettelkasten/zettelkasten.bib`; Zotero manages it.

### Action zettel

- The only folder you may write to, create, rename, or delete files in.
- Put every note you generate here - drafts from a conversation, summaries of your work, or proposed concept/paper/topic zettel.
- These are called action zettel because each zettel corresponds to one, or more, actions I need to take - mostly reviewing and understanding, but it can be anything!
- Use the same conventions as the rest of the vault (terse, atomic, LaTeX math, `[[wikilinks]]`).
- Don't refile notes into `Concept zettel`/`Paper zettel` yourself; leave that to me.

### Canvases

- Used by me to organize (concept, paper) zettel spatially, like a digital whiteboard.
- A canvas is JSON, so easy to parse and read; however, do not modify any canvases!

### Concept zettel

- One note per idea, method, or term (e.g. `Normalizing Flow`, `SBI`, `NPE`, `TabPFN`). The filename is the note title.
- Lives in `~/Projects/zettelkasten/Concept zettel`, optionally nested in a topical subfolder (e.g. `SBI methods/`, `Attention mechanisms/`).
- Atomic and self-contained: define the concept, then relate it to others via `[[wikilinks]]`.

### Paper zettel

- A filename in `~/Projects/zettelkasten/Paper zettel` corresponds to a specific paper. (The PDF is typically saved on disk.)
- The filename is the paper's BibTeX citekey, e.g. `daxFlowMatchingScalable2023.md` ↔ `@online{daxFlowMatchingScalable2023, ...}`.
- To read a paper, look up the matching entry in `~/Projects/zettelkasten/zettelkasten.bib` and use the file path in its `file = {...}` field. Treat the PDF as read-only too.
- Content summarizes the paper's core contribution and method, and links out to the relevant `[[Concept zettel]]` and related work.

## Tags

I use the following action tags across all zettel and canvases:

```txt
#open/todo
#open/question
#open/further-reading
#open/flashcard
```

I also use tags for projects, structured like `#project/name-of-the-project`. These can be helpful for finding specific zettel; you are not expected to tag anything unless asked.

## Creating zettel

- Write the new note as a single `.md` file in `Action zettel`. Filename should be the zettel title for concept or topic notes, the BibTeX citekey for a paper, or just some action I need to take (e.g., "Proof that ...").
- Keep it atomic and terse: one idea per note, bullets over prose, LaTeX for math (square-bracket function args, e.g. `p[\theta|x]`, `N[0,I]`).
- Reference existing notes with `[[Note title]]` (Obsidian resolves by title, so no path is needed). Scan existing titles in `Concept zettel` and `Paper zettel` first so links resolve and you don't duplicate a note.
- For a paper zettel: find the entry in `zettelkasten.bib`, read the PDF from its `file = {...}` path, then summarize the contribution and method and link to the concepts it builds on.
- If a close note already exists, prefer extending it over creating a new one - but still write your version inside `Action zettel` and note the intended target.
