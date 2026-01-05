# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build Command

```bash
typst compile habit-tracker.typ
```

This compiles the Typst source to `habit-tracker.pdf`.

## Project Overview

This is a single-file Typst project that generates a printable weekly habit tracker. The output is a landscape US Letter PDF designed for physical printing and manual tracking.

## Structure

The `habit-tracker.typ` file contains:
- Page setup (landscape US Letter, 0.4in margins)
- Color definitions for the visual theme
- Reusable checkbox/input components (`cmark`, `smallcmark`, `tinycmark`, `moodcircle`, `inputline`)
- Cell content helpers for each habit type (medication, cardio, steps, etc.)
- A weight graph section with Y-axis input lines
- A main habits table with 16 trackable habits across 7 days
