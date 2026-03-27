# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

This document acts as an **engineering contract**. All modifications must respect performance,
stability, and architectural intent described below.

# Environment & Scope Constraints:

Root Directory: Treat the directory containing CLAUDE.md as the absolute project root (/).

Strict Scoping: Do not perform recursive searches, file reads, or path indexing outside of this root.

External Dependencies: If a task requires context from files outside this scope (e.g., global configs, external libraries), you must pause and ask the user to provide the specific file content or path.

No System Access: Accessing hidden system directories, user home folders, or environment variables outside the project context is strictly prohibited.

-------------------------------------------------------------------------------
