---
name: zettelkasten
description: "Use when creating, updating, or researching zettel in Manuel's zettelkasten, especially when asked to create a zettel from a conversation, question, agent work, topic, paper, or notes. Provides the allowed write location, paper lookup rules, and read-only handling for Zotero-managed metadata."
---

# Zettelkasten

Use this skill when the user asks to create or update a `zettel`, capture what was discussed, preserve an insight from agent work, or work with papers in Manuel's zettelkasten.

## Locations

- Zettelkasten root: `~/projects/zettelkasten`.
- Agent write area: `~/projects/zettelkasten/Agent zettel`.
- Only write, create, rename, or delete files inside `~/projects/zettelkasten/Agent zettel`.
- Treat all other zettelkasten paths as read-only unless the user explicitly changes this rule.
- Never edit `~/projects/zettelkasten/zettelkasten.bib`; Zotero manages it.

## Creating Zettel

1. Infer the topic and scope from the user's request and the current conversation.
2. Inspect existing files in `~/projects/zettelkasten/Agent zettel` to follow local naming and formatting conventions when practical.
3. If no convention is clear, create a Markdown file with a concise, descriptive title and a collision-free filename.
4. Keep the note focused on reusable ideas, claims, decisions, sources, and open questions rather than a transcript.
5. Include enough provenance for the user to reconstruct the context, such as related conversation topic, source paper, file path, or date.
6. Before writing, ensure the target path is inside `~/projects/zettelkasten/Agent zettel`.

## Papers

- A filename in `~/projects/zettelkasten/papers` corresponds to a specific paper saved on disk.
- To read a paper, look up the matching entry in `~/projects/zettelkasten/zettelkasten.bib` and use the file path specified there.
- Read `zettelkasten.bib` as Zotero-managed metadata only. Do not edit, reformat, sort, or "fix" it.
- If the paper path in `zettelkasten.bib` points outside the zettelkasten folder, treat that target as read-only too.

## Safety Checks

- If a requested action would write outside `Agent zettel`, ask the user for explicit confirmation before proceeding.
- If a source file is missing or the paper mapping is ambiguous, explain the ambiguity and ask which source to use.
- Do not store secrets, auth tokens, caches, databases, or mutable application state in any zettel.
