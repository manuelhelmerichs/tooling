---
name: mineru
description: "Use MinerU for local document parsing, OCR, layout extraction, table/formula extraction, and converting PDFs, images, DOCX, PPTX, or XLSX files into Markdown, JSON, extracted images, and visual debug artifacts. Use when Codex needs to prepare documents for reading, research notes, RAG ingestion, structured extraction, or quality-checking document parse output."
---

# MinerU

## Overview

MinerU is installed as repo-managed Home Manager wrappers around a pinned `uvx` package environment. Use the local CLI for private document parsing and keep model caches, `mineru.json`, and generated parse outputs out of Git unless the user explicitly asks for checked-in artifacts.

## Commands

Available commands:

- `mineru`
- `mineru-api`
- `mineru-gradio`
- `mineru-router`
- `mineru-models-download`

The wrappers pin `mineru[all]==3.4.3`, use Python 3.12 through `uvx`, and set `PYTORCH_ENABLE_MPS_FALLBACK=1` so unsupported Apple Silicon GPU operations can fall back instead of failing the whole parse.

If the commands are missing, tell the user to apply the Home Manager configuration; do not install MinerU ad hoc during document work.

## Workflow

1. Choose an output directory outside the repository, such as `/tmp/mineru-output` or a user-specified folder. Do not commit generated Markdown, images, JSON, or debug PDFs unless requested.
2. For large or unknown documents, first parse one or two pages with `-s 0 -e 1` to confirm the backend and output quality.
3. Use the default backend first on Apple Silicon:

```zsh
mineru -p input.pdf -o /tmp/mineru-output
```

4. If the default backend fails or the machine is memory constrained, retry with the CPU-friendly pipeline backend:

```zsh
mineru -p input.pdf -o /tmp/mineru-output -b pipeline
```

5. Inspect both human-readable and structured outputs. Prioritize the generated Markdown for reading, `*_content_list.json` for downstream structured content, `*_middle.json` for page/block geometry and backend metadata, and `*_layout.pdf` / `*_span.pdf` for visual debugging when the parse looks wrong.

## Common Options

- `-p, --path`: input file or directory.
- `-o, --output`: output directory.
- `-b, --backend`: one of `pipeline`, `vlm-engine`, `hybrid-engine`, `vlm-http-client`, or `hybrid-http-client`; default is `hybrid-engine`.
- `-m, --method`: `auto`, `txt`, or `ocr` for pipeline and hybrid backends.
- `-s, --start` and `-e, --end`: zero-based page range for smoke tests and partial parses.
- `-f, --formula` and `-t, --table`: enable or disable formula/table parsing.
- `-l, --lang`: OCR language hint for pipeline backend.

## Model Setup

If local models are not present, run:

```zsh
mineru-models-download
```

This downloads mutable model state and updates the user-level MinerU config. Treat model files and `mineru.json` as machine state, not repository content.
