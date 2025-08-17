---
allowed-tools: Read, Write, Glob, Grep, LS, Edit
title: Generate a task list
description: Create a detailed, step-by-step task list in Markdown format.
---

To guide an AI assistant in creating a detailed, step-by-step task list in Markdown format based on an existing Product Requirements Document (PRD). The task list should guide a developer through implementation.

## Output

- **Format:** Markdown (`.md`)
- **Location:** `./TODO.md`

The generated task list _must_ follow this structure:

```markdown
## Tasks

- [ ] Parent Task Title
  - [ ] Sub-task description
  - [ ] Sub-task description
- [ ] Parent Task Title
  - [ ] Sub-task description
- [ ] Parent Task Title (may not require sub-tasks if purely structural or configuration)
```

## Target Audience

Assume the primary reader of the task list is a **developer** who will implement the feature.
