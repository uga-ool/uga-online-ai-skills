---
name: elc-course-reviewer
description: Review a UGA online course that will be deployed to D2L at both the course level and the individual-content level. Evaluate instructional design, learning-objective alignment, assessments, rubrics, navigation, learner support, reusable HTML, UGA Online Design System compliance, and accessibility across HTML, Word, PDF, PowerPoint, images, tables, equations, multimedia, and converted content. Use whenever the user asks for a course review, accessibility review, pre-publication review, HTML cleanup, PDF or slide remediation, rubric-based evaluation, or an assessment of whether course content is understandable, navigable, and usable by learners with disabilities.
---

# Course and content reviewer for D2L

Treat course review and accessibility review as one integrated quality-assurance task performed at different levels of detail. A course may be pedagogically strong but inaccessible, or technically accessible but confusing to navigate. Review both dimensions together whenever the supplied materials support it.

**Prefer `elc-html-cleanup`** when the user only wants remediation of one or more HTML files (design system + accessibility fixes, no scored course review). Use this skill for rubric-based or multi-area course quality review, or when they ask for both findings and corrected content at course/module scope.

This skill assumes the course or content will be used in D2L or another online learning environment. Apply D2L-compatible requirements and expectations unless the user explicitly requests a different delivery environment.

## Operating limits

This environment has no live LMS session and no automatic access to course spaces. Review only what the user supplies directly, such as:

- exported HTML or ZIP packages
- Word, PDF, PowerPoint, or image files
- course maps, syllabi, rubrics, screenshots, transcripts, or pasted content
- output from PDF-remediation, OCR, or PPT-to-HTML tools

Do not ask the user to grant API access or imply that a live LMS crawl is available.

## Before reviewing

Ask only for information that is genuinely needed and not already evident from the materials:

- **Scope:** whole course, selected modules, a single file, or a single page
- **Framework:** Quality Matters, WCAG, Section 508, an internal UGA rubric, or another supplied standard
- **Priority:** instructional design, accessibility, design-system compliance, remediation, or all areas
- **Deliverable:** findings only, a scored matrix, corrected content, or both
- **Target format:** standalone web page, reusable fragment, PDF, Word, PowerPoint, or mixed package

For a clearly scoped request, begin the review without asking unnecessary questions.

# Review method

Use a four-stage process:

1. **Inventory the supplied materials.** Identify file types, module structure, content patterns, interactive elements, assessments, media, and converted or scanned content.
2. **Evaluate with the applicable matrices.** Use every matrix that applies; mark non-applicable criteria as `N/A` rather than omitting them.
3. **Verify high-risk items manually.** Do not rely only on automated checkers for reading order, alt text quality, table relationships, equation meaning, captions, keyboard behavior, or instructional alignment.
4. **Report or remediate.** Preserve instructional meaning and identify anything that still requires a human decision.

# Rating model

Use the following status labels consistently:

| Status           | Meaning                                                                              | Required response                               |
| ---------------- | ------------------------------------------------------------------------------------ | ----------------------------------------------- |
| **Pass**         | Criterion is met with no material barrier.                                           | No change required; optionally note a strength. |
| **Partial**      | Criterion is present but inconsistent, incomplete, or fragile.                       | Give a specific correction.                     |
| **Fail**         | Criterion creates a likely access, comprehension, navigation, or compliance barrier. | Treat as a required fix.                        |
| **Not verified** | The supplied material does not provide enough evidence.                              | State what must be tested or supplied.          |
| **N/A**          | Criterion does not apply to this item.                                               | Give a brief reason when useful.                |

Use these severity levels for findings:

| Severity     | Definition                                                                           | Typical examples                                                                                                                   |
| ------------ | ------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------- |
| **Blocking** | Prevents access, completion, understanding, navigation, or meaningful participation. | Image-only PDF; unlabeled form control; keyboard trap; missing captions; assessment cannot be completed without vision or a mouse. |
| **High**     | Creates a serious barrier or repeated failure but may have a workaround.             | Broken heading structure across a module; complex table without associated headers; major reading-order errors.                    |
| **Moderate** | Causes friction, ambiguity, or inconsistent accessibility.                           | Weak link text; incomplete alt text; inconsistent navigation labels; unclear rubric criteria.                                      |
| **Low**      | Improvement that increases clarity, consistency, resilience, or usability.           | Excessive decorative styling; unnecessarily long alt text; minor terminology inconsistency.                                        |

# Matrix A: Course architecture and learner experience

Use this matrix for a whole course or multi-module review.

| Area                          | Pass criteria                                                                                                                             | Common failure evidence                                                                     | Verification method                                          |
| ----------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| Course orientation            | Learners can identify where to begin, how the course is organized, required technologies, communication channels, and major expectations. | No start-here guidance; orientation information scattered across files.                     | Review landing materials and first module.                   |
| Module consistency            | Modules follow a predictable pattern for overview, objectives, content, activities, assessments, and wrap-up.                             | Different naming and sequence each week without instructional reason.                       | Compare at least three representative modules.               |
| Navigation                    | Labels are descriptive, destinations are predictable, and learners do not need visual guesswork to locate required work.                  | "Click here," icon-only navigation, duplicate labels, unexplained abbreviations.            | Trace common learner tasks from entry to completion.         |
| Workload signaling            | Due dates, estimated effort, sequence, and dependencies are clear.                                                                        | Hidden prerequisites; assignments referenced before instructions appear.                    | Compare schedule, module pages, and assessment instructions. |
| Learner support               | Academic, technical, accessibility, and instructor-support information is easy to locate.                                                 | Support links only in syllabus or buried late in course.                                    | Search major entry points and orientation content.           |
| Mobile and reflow resilience  | Essential information remains understandable when content reflows or is viewed at narrow widths.                                          | Side-by-side instructions lose relationships; horizontal scrolling required for basic text. | Inspect responsive HTML or screenshots at narrow viewport.   |
| Error prevention and recovery | Learners receive clear submission, save, retry, and troubleshooting guidance where failure is consequential.                              | No explanation of accepted file types, retry rules, or what to do after an error.           | Review assessment and technology instructions.               |

# Matrix B: Learning alignment and assessment quality

| Area                    | Pass criteria                                                                                                                                         | Common failure evidence                                                        | Verification method                                             |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------ | --------------------------------------------------------------- |
| Objective clarity       | Objectives use observable, measurable language and describe what learners will demonstrate.                                                           | "Understand" or "know" without evidence of performance.                        | Review course and module objectives.                            |
| Objective hierarchy     | Course, module, and lesson objectives are coherent and do not contradict one another.                                                                 | Module work does not contribute to course outcomes.                            | Build a simple objective map.                                   |
| Content alignment       | Required readings, media, examples, and practice directly support the stated objectives.                                                              | Large amounts of content with no clear purpose or assessment connection.       | Sample each module and trace to objectives.                     |
| Activity alignment      | Practice requires the same kind of thinking learners will use on graded work.                                                                         | Recall-only practice before a synthesis assessment.                            | Compare practice and graded task demands.                       |
| Assessment alignment    | Every significant assessment measures one or more stated objectives.                                                                                  | Graded tasks assess unstated skills or omit core outcomes.                     | Create an objective-to-assessment crosswalk.                    |
| Instructions            | Task, purpose, steps, submission format, constraints, deadline, and evaluation criteria are explicit.                                                 | Key details only implied or located in another file.                           | Review assignment as a first-time learner.                      |
| Rubric quality          | Criteria are observable, performance levels are distinct, and scoring matches the task.                                                               | Vague labels such as "excellent" without descriptors.                          | Compare rubric language with assignment requirements.           |
| Accessible alternatives | Time, sensory, motor, communication, or technology demands do not unnecessarily exclude learners; equivalent alternatives are identified when needed. | Color-only analysis, audio-only response, timed interaction without rationale. | Review task requirements and possible assistive-technology use. |
| Feedback design         | Learners know when, where, and how feedback will be provided and can use it to improve.                                                               | Feedback only as a score; no revision or reflection pathway.                   | Review assessment descriptions and grading guidance.            |

# Matrix C: Cross-format accessibility baseline

Apply to every content item regardless of file type.

| Requirement                              | Pass criteria                                                                                               | Severity when absent | Notes                                                              |
| ---------------------------------------- | ----------------------------------------------------------------------------------------------------------- | -------------------- | ------------------------------------------------------------------ |
| Meaningful title                         | File or page title identifies the content and is not a filename artifact.                                   | Moderate             | PDF and HTML title metadata should also be checked.                |
| Language                                 | Primary language is programmatically identified; language changes are marked when substantial.              | High                 | Use `lang` in HTML and document properties in office files/PDF.    |
| Logical structure                        | Headings, paragraphs, lists, quotes, tables, and landmarks are represented semantically, not only visually. | High                 | Visual bolding alone is not a heading.                             |
| Reading order                            | Assistive technology encounters content in a meaningful sequence.                                           | Blocking/High        | Visual placement does not prove reading order.                     |
| Keyboard access                          | All interactive functions work without a mouse and show visible focus.                                      | Blocking             | Applies to web, forms, embedded tools, and custom controls.        |
| Text alternatives                        | Informative visuals have equivalent text; decorative visuals are ignored by assistive technology.           | High                 | Complex visuals may need a long description or data table.         |
| Color and contrast                       | Meaning does not depend on color alone; text and controls have sufficient contrast.                         | High                 | Verify states, charts, focus indicators, and disabled controls.    |
| Resize and reflow                        | Text can be enlarged and content reflows without loss of meaning or function.                               | High                 | Avoid fixed-height containers and image-based text.                |
| Links                                    | Link purpose is clear from its accessible name and surrounding context.                                     | Moderate             | Avoid raw URLs and repeated "learn more" links without context.    |
| Consistent terminology                   | The same concept, control, and destination use the same label.                                              | Moderate             | Especially important in multi-module courses.                      |
| Instructions independent of sensory cues | Directions do not rely only on location, shape, sound, or color.                                            | High                 | Replace "click the red button on the right" with the control name. |
| Automated check plus manual review       | Automated results are supplemented by human inspection and assistive-technology checks where practical.     | High                 | A checker passing does not establish accessibility.                |

# Matrix D: HTML and web content

## Document and landmark structure

| Criterion            | Pass criteria                                                                                                       | Typical remediation                                                  |
| -------------------- | ------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| Doctype and language | Valid HTML document uses `<!doctype html>` and `<html lang="…">`.                                                   | Add or correct the document shell.                                   |
| Page title           | `<title>` is unique and descriptive.                                                                                | Replace generic titles such as "Document."                           |
| Main landmark        | One primary `<main>` region exists and has a stable target for the skip link.                                       | Add `<main id="main-content">`.                                      |
| Skip link            | First focusable element allows users to bypass repeated navigation.                                                 | Add a visible-on-focus skip link.                                    |
| Landmark naming      | Multiple navigation or complementary regions have useful accessible names.                                          | Add `aria-label` only when native visible headings are insufficient. |
| Heading hierarchy    | One clear page-level heading; lower headings reflect content hierarchy without using heading levels for appearance. | Retag headings and style with CSS.                                   |
| Lists                | List items are direct children of `<ul>` or `<ol>`; definition lists are used when appropriate.                     | Rebuild pseudo-lists made with bullets or line breaks.               |
| Quotes and emphasis  | `<blockquote>`, `<q>`, `<em>`, and `<strong>` communicate meaning rather than visual styling alone.                 | Replace presentational spans.                                        |

## UGA Online Design System

For a full standalone page, verify:

- Google Fonts links for Merriweather, Merriweather Sans, and Oswald
- Design-system CSS: `https://design.online.uga.edu/css/base.css` (prefer a versioned production URL, e.g. `/v1.x.x/css/base.css`, in production)
- Design-system JS: `https://design.online.uga.edu/js/scripts.js` before `</body>` when components require it
- The documented skip-link component (`cmp-skip-to-content` or equivalent) and a `<main id="main-content">` landmark
- Design-system layout utilities (e.g. `obj-reading-width`) rather than one-off inline layout styles

For a fragment (no `<html>` wrapper), require the appropriate design-system component and container classes but do not add a second `<html>`, `<head>`, or `<body>` shell — upgrade a fragment to a full page only if it will be hosted as a standalone file.

## Interactive HTML

| Criterion             | Pass criteria                                                                      | Typical remediation                                                               |
| --------------------- | ---------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| Native controls       | Buttons are `<button>` elements and links are `<a href>`.                          | Replace clickable `<div>` or `<span>` elements.                                   |
| Accessible names      | Every control has a clear programmatic name.                                       | Associate `<label>` with inputs; use visible button text.                         |
| Keyboard operation    | Interaction supports expected keys and no keyboard trap occurs.                    | Implement native elements or complete keyboard behavior.                          |
| Focus visibility      | Focus indicator remains clearly visible against surrounding colors.                | Remove `outline: none`; add compliant focus styling.                              |
| Focus order           | Tab order follows reading and task order.                                          | Remove unnecessary positive `tabindex`; correct DOM order.                        |
| Status messages       | Dynamic confirmations and errors are announced without moving focus unnecessarily. | Use an appropriate live region or status role.                                    |
| Disclosure components | Expanded state and controlled region are conveyed programmatically.                | Use native `<details>` where suitable or correct `aria-expanded`/`aria-controls`. |
| Dialogs               | Focus enters, remains within, and returns from a modal appropriately.              | Use a proven dialog component and label it.                                       |
| Time limits           | Learners can extend, disable, or understand justified time limits.                 | Add controls and warning mechanisms.                                              |

# Matrix E: Images, charts, diagrams, maps, and visual instruction

Classify each visual before writing alt text.

| Visual type                         | Required treatment                                                                                     | Quality test                                                                    |
| ----------------------------------- | ------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------- |
| Decorative                          | Empty alt text in HTML or marked decorative/artifact in the file format.                               | Removing it does not reduce instructional meaning.                              |
| Functional                          | Alt text or accessible name states the action or destination, not appearance.                          | A user can predict what activation will do.                                     |
| Informational photo or illustration | Concise description communicates the relevant purpose in context.                                      | Description includes what the learner needs, not every visible detail.          |
| Simple chart                        | Alt text states chart type, variables, and primary trend or conclusion.                                | A nonvisual learner receives the same key takeaway.                             |
| Complex chart or data visualization | Short alt text plus adjacent long description, accessible data table, or structured explanation.       | Values, relationships, anomalies, and conclusions are available without vision. |
| Process diagram                     | Describe start point, sequence, branches, relationships, and outcome.                                  | The process can be reconstructed from the text.                                 |
| Spatial or technical diagram        | Provide structured description; consider tactile graphics when spatial relationships are essential.    | Learner can understand relationships, not just labels.                          |
| Image of text                       | Replace with real text whenever possible; otherwise provide exact equivalent text.                     | Text remains selectable, searchable, zoomable, and readable by AT.              |
| Screenshot used for instruction     | Alt text identifies purpose; surrounding text provides the actual steps and relevant interface labels. | Instructions do not depend on seeing a red circle or arrow.                     |

Do not use placeholder alt text such as `image`, `graphic`, or a filename. When meaning cannot be determined, use a visible or code comment such as `DESCRIPTION NEEDS SUBJECT-MATTER REVIEW` rather than inventing content.

# Matrix F: Tables

| Criterion               | Pass criteria                                                                                    | Severity when absent |
| ----------------------- | ------------------------------------------------------------------------------------------------ | -------------------- |
| Appropriate use         | Table is used for relational data, not visual layout.                                            | Moderate             |
| Caption or introduction | Purpose is clear before the table; caption is provided when useful.                              | Moderate             |
| Header cells            | Row and column headers use semantic header cells (`<thead>`, `<th scope="col">`/`scope="row"`).  | High                 |
| Header association      | Simple tables use appropriate scope; complex tables use explicit associations or are redesigned. | High                 |
| Simplicity              | Avoid merged, split, nested, or blank cells unless essential and correctly associated.           | High                 |
| Reading order           | Cells are encountered left-to-right and top-to-bottom in a meaningful sequence.                  | High                 |
| Abbreviations           | Unfamiliar abbreviations are expanded or explained.                                              | Moderate             |
| Reflow                  | Table remains usable at zoom or on narrow screens; an alternate view is provided when needed.    | High                 |
| Equivalent narrative    | Complex interpretation is summarized outside the table.                                          | Moderate             |

For PDF tables, verify the tag hierarchy includes `<Table>`, `<TR>`, `<TH>`, and `<TD>` in the correct nesting order. For Word tables, require a designated header row and prohibit improvised tables built with tabs or spaces.

# Matrix G: Equations, formulas, scientific notation, and code

| Content type      | Preferred accessible form                                                                                          | Required checks                                                                      |
| ----------------- | ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ |
| Inline equation   | MathML or another platform-supported semantic math format.                                                         | Meaning, symbols, grouping, and spoken interpretation are correct.                   |
| Display equation  | Semantic math with a visually equivalent rendered form.                                                            | Equation is keyboard reachable when interactive and does not rely on an image alone. |
| Equation image    | Replace with semantic math where feasible; otherwise provide accurate text/LaTeX and a meaningful description.     | Never delete or guess at ambiguous notation.                                         |
| Chemical notation | Use a format that preserves subscripts, superscripts, bonds, charges, and reading sequence.                        | Test with the target rendering and AT environment.                                   |
| Source code       | Use `<pre><code>` or equivalent, preserve whitespace, identify language, and provide text rather than screenshots. | Long lines wrap or scroll without obscuring content.                                 |
| Data expression   | Explain variables and units in nearby text.                                                                        | Learners can identify what each symbol represents.                                   |

For plain-text equations converted from PDF/PPT: convert to MathML when intent is clear; when it's not, wrap the original text in `<span class="math-inline">` and insert `<!-- EQUATION NEEDS SUBJECT-MATTER REVIEW -->` rather than guessing. For an equation image, replace with MathML or a LaTeX display block and note `<!-- converted from image -->`. Never delete an equation you can't confidently fix — flag it instead.

# Matrix H: Word documents

| Criterion              | Pass criteria                                                                                     | Verification                                           |
| ---------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------ |
| Styles                 | Built-in title, heading, normal, list, and table styles convey structure.                         | Inspect Navigation Pane and style assignments.         |
| Heading order          | Heading levels form a logical hierarchy.                                                          | Navigate by heading, not just visually.                |
| Paragraph construction | Spacing uses paragraph settings rather than repeated blank lines.                                 | Show formatting marks.                                 |
| Lists                  | Built-in list tools are used.                                                                     | Inspect list structure.                                |
| Columns                | Built-in columns are used only when reading order remains logical.                                | Test with screen reader or export review.              |
| Tables                 | Built-in tables, designated header rows, simple structure, no blank layout cells.                 | Use Word accessibility checker plus manual inspection. |
| Images                 | Alt text or decorative marking is appropriate.                                                    | Review each image in context.                          |
| Links                  | Descriptive display text and valid destination.                                                   | Tab through links and inspect link text.               |
| Color and typography   | Adequate contrast, readable fonts, no meaning by color alone, text remains legible when enlarged. | Visual inspection and contrast check.                  |
| Document properties    | Meaningful title, author as appropriate, and language are set.                                    | Inspect file properties.                               |
| Export                 | PDF export preserves tags, bookmarks/headings, links, and document language.                      | Inspect resulting tagged PDF.                          |

Avoid claiming that a specific font or a 12-point minimum alone establishes accessibility. Readability depends on typeface, spacing, contrast, display, zoom, and user needs.

# Matrix I: PDF and OCR remediation

## Source quality and OCR

| Criterion            | Pass criteria                                                                                   | Failure evidence                                                    |
| -------------------- | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| Source quality       | Pages are clear, straight, complete, and high enough resolution for accurate OCR.               | Blurry copies of copies, shadows, curvature, clipped margins.       |
| Searchable text      | Text can be selected, searched, copied, and read accurately.                                    | Entire page behaves as one image.                                   |
| OCR accuracy         | Characters, words, columns, punctuation, headings, and page breaks are human-reviewed.          | `rn` becomes `m`, headers merge into body text, columns interleave. |
| Language and symbols | OCR language matches content and special characters are preserved.                              | Accents, Greek letters, math, or scientific notation are corrupted. |
| Repeated artifacts   | Running headers, footers, page numbers, stains, and scan marks are artifacted when appropriate. | Screen reader announces repeated clutter on every page.             |

## Tagged PDF structure

| Criterion            | Pass criteria                                                                      | Severity when absent |
| -------------------- | ---------------------------------------------------------------------------------- | -------------------- |
| Tagged document      | PDF has a coherent tag tree rooted in a document structure.                        | Blocking             |
| Reading order        | Tag order and content order match intended reading sequence.                       | Blocking/High        |
| Headings             | Heading tags reflect hierarchy and are not used for appearance.                    | High                 |
| Paragraphs and lists | Body text and lists use correct semantic tags and nesting.                         | High                 |
| Figures              | Meaningful figures are tagged with alt text; decorative items are artifacts.       | High                 |
| Tables               | Correct table, row, header, and data-cell structure with associations.             | High                 |
| Links                | Link annotations and link tags align and have meaningful names.                    | High                 |
| Form fields          | Fields are keyboard accessible, labeled, ordered, and provide instructions/errors. | Blocking             |
| Bookmarks            | Long documents include bookmarks that reflect major structure.                     | Moderate             |
| Metadata             | Title, language, and other relevant properties are set.                            | Moderate             |
| Security             | Security settings do not prevent assistive-technology access.                      | Blocking             |

A PDF that merely passes OCR is not necessarily accessible. A visually correct PDF may still have unusable reading order or tags.

# Matrix J: PowerPoint and slide-derived content

| Criterion     | Pass criteria                                                                            | Verification                                             |
| ------------- | ---------------------------------------------------------------------------------------- | -------------------------------------------------------- |
| Slide title   | Every slide has a unique, meaningful title in the reading order.                         | Inspect Outline and Selection/Reading Order pane.        |
| Object order  | Objects are read in a logical sequence.                                                  | Review reading order on every distinct layout.           |
| Layouts       | Built-in slide layouts are used where possible.                                          | Inspect layout assignments.                              |
| Text          | Real text is used instead of screenshots; text is readable and not overcrowded.          | Zoom and inspect exported content.                       |
| Images        | Alt text or decorative marking is appropriate.                                           | Review each visual in teaching context.                  |
| Charts        | Data and key conclusions are available in text or an accessible table.                   | Inspect chart data and notes.                            |
| Tables        | Simple tables with clear headers; avoid merged cells.                                    | Review structure and exported result.                    |
| Color         | Contrast is sufficient and meaning is not color-only.                                    | Contrast test and grayscale review.                      |
| Links         | Link purpose is clear and URLs are not the only visible text unless necessary.           | Keyboard navigation.                                     |
| Media         | Captions, transcripts, and audio descriptions are available as needed.                   | Play media with captions and keyboard.                   |
| Animations    | Essential information is not available only through animation or timing.                 | Review slide show and static export.                     |
| Speaker notes | Instructionally necessary notes are included in the learner-facing alternative.          | Compare notes with exported version.                     |
| Export        | PDF or HTML export preserves titles, reading order, links, alt text, and text semantics. | Inspect the exported artifact, not only the source deck. |

When cleaning PPT-to-HTML output, remove slide-transition scripts and hidden presenter-note containers unless the user asks to keep them for learners. Preserve all instructional content.

# Matrix K: Audio, video, animation, and embedded media

| Criterion            | Pass criteria                                                                                   | Severity when absent |
| -------------------- | ----------------------------------------------------------------------------------------------- | -------------------- |
| Captions             | Synchronized, accurate captions identify speech and meaningful sounds.                          | Blocking             |
| Transcript           | A readable transcript is provided for audio-only content and when useful for video.             | High                 |
| Audio description    | Important visual information not conveyed in dialogue is described.                             | High                 |
| Player accessibility | Controls are keyboard operable, labeled, visible on focus, and do not autoplay unexpectedly.    | Blocking/High        |
| Pause and timing     | Users can pause, stop, replay, and control time-based content.                                  | High                 |
| Flashing             | Content does not flash at unsafe rates.                                                         | Blocking             |
| Embedded documents   | PDFs, slides, and interactive objects inside the media experience are independently accessible. | High                 |
| Equivalent learning  | Caption or transcript is not merely verbatim when visual context carries instructional meaning. | High                 |

# Matrix L: Forms, quizzes, and interactive assessments

| Criterion                    | Pass criteria                                                                  | Severity when absent |
| ---------------------------- | ------------------------------------------------------------------------------ | -------------------- |
| Labels                       | Every field and control has an explicit accessible name.                       | Blocking             |
| Grouping                     | Related controls use fieldsets/legends or equivalent grouping.                 | High                 |
| Instructions                 | Required format, constraints, and examples are provided before input.          | High                 |
| Required state               | Required fields are conveyed programmatically and visually.                    | High                 |
| Errors                       | Errors identify the field, explain the problem, and suggest correction.        | Blocking/High        |
| Focus management             | Focus moves predictably after validation, page changes, or modal interactions. | High                 |
| Timing                       | Time limits are justified, disclosed, and adjustable when required.            | Blocking/High        |
| Drag-and-drop                | Equivalent keyboard and nonvisual interaction is available.                    | Blocking             |
| Ordering/matching            | Relationships are conveyed without requiring visual spatial placement alone.   | Blocking             |
| Proctoring/third-party tools | Accessibility limitations and accommodations are identified before use.        | High                 |
| Submission confirmation      | Learner receives an accessible confirmation and can verify what was submitted. | High                 |

# Matrix M: Accessibility validation and assistive-technology checks

Automated tools are useful for detection but not final judgment. Use this layered validation model when the environment permits:

| Layer                    | Minimum test                                                                                          |
| ------------------------ | ----------------------------------------------------------------------------------------------------- |
| Structural inspection    | Review source structure, tags, reading order, metadata, and semantic roles.                           |
| Automated checker        | Run the native checker for Word, PowerPoint, Acrobat, or HTML tooling and interpret results manually. |
| Keyboard-only            | Complete all navigation and interactions without a mouse.                                             |
| Zoom/reflow              | Test enlarged text and narrow viewport behavior without loss of content or function.                  |
| Color/contrast           | Verify text, controls, focus, charts, and state indicators.                                           |
| Screen reader smoke test | Navigate headings, landmarks, links, lists, tables, forms, and key interactions.                      |
| Content equivalence      | Compare what a nonvisual user receives with the visual instructional meaning.                         |
| User-context review      | Consider learner accommodations, disciplinary notation, and the actual delivery platform.             |

Do not state that an item is "fully accessible" solely because an automated checker reports no errors. Prefer language such as "meets the reviewed criteria" and identify the limits of testing.

# Reusable component suggestions

When supplied HTML reinvents something the `uga-lit-components` Lit component library already provides, note it as a build/reuse suggestion — Low or Moderate severity, not a compliance failure — rather than silently rewriting the markup to use it. Verify current tag names, data formats, and demos against `uga-lit-components/src/README.md` and the matching `demo/<component>.html` before recommending one, since the library evolves independently of this skill.

Components that work in any web-hosted course (no D2L/Valence dependency):

| Custom element        | Suggest when the content has…                                                                      |
| --------------------- | -------------------------------------------------------------------------------------------------- |
| `uga-accordion`       | Hand-built expand/collapse sections (nested `<details>`, JS toggles, duplicated show/hide divs)    |
| `uga-tabs`            | Hand-rolled tabbed navigation                                                                      |
| `uga-toc`             | A manually maintained table of contents that could instead scan the page's own headings            |
| `uga-callout`         | Ad hoc "note," "tip," or "warning" boxes styled with inline CSS                                    |
| `uga-code`            | Code samples pasted as plain text or screenshots instead of a syntax-highlighted block             |
| `uga-image`           | Plain `<img>` usage that would benefit from the shared lazy-loading/captioning pattern             |
| `uga-slideshow`       | A manual carousel or a sequence of static images meant to be paged through                         |
| `uga-circles`         | Stat/number callouts laid out as ad hoc grids                                                      |
| `uga-video`           | A Kaltura (or similar) video embedded with raw iframe/script markup                                |
| `uga-instructor-note` | Recurring "note from your instructor" content blocks                                               |
| `uga-course-calendar` | A manually formatted course schedule/calendar table (see `docs/COURSE_CALENDAR_FORMAT.md`)         |
| `uga-footer`          | A hand-built course/program footer duplicated across pages                                         |
| `uga-quiz`            | A self-check or practice quiz built from scratch (JSON/CSV-driven; see `docs/QUIZ_JSON_FORMAT.md`) |
| `uga-return-to-top`   | A long page with no "back to top" affordance                                                       |

Components that call D2L Valence APIs (`uga-assignment`, `uga-course-analytics`, `uga-duedate`, `uga-elc-google-sync`, `uga-instructor-card`, `uga-quiz-grade-sync`, `uga-rating`) only function inside eLC/Brightspace.

If suggesting a component, name the exact custom element and point to its demo page (and data-format doc, where one exists) so the user can evaluate the fit — do not assert it's a required fix.

## Minimal usage reference

When a fix should actually apply a component (not just recommend one), emit the real element and its verified attributes rather than a prose description or an invented API. These snippets are confirmed against each component's source (`@property` declarations) and matching `demo/<component>.html` as of this writing — re-check both before use, since attributes and defaults can change:

```html
<!-- uga-accordion: type="local"|"program"; filename is required -->
<uga-accordion type="local" filename="REPLACE-WITH-FILENAME.json"></uga-accordion>

<!-- uga-tabs: same loadData contract as uga-accordion -->
<uga-tabs type="local" filename="REPLACE-WITH-FILENAME.json"></uga-tabs>

<!-- uga-toc: no attributes; scans the page's own headings -->
<uga-toc></uga-toc>

<!-- uga-callout: type is note|important|tip|example|warning; size is small|medium|large|xlarge -->
<uga-callout type="note" size="medium" label="Note" body="Replace with the callout text."></uga-callout>

<!-- uga-code: language is a Prism language id; code is slotted, not an attribute -->
<uga-code language="javascript">function example() { return true; }</uga-code>

<!-- uga-image: src/alt required; caption, srcset, sizes, max-width, border-radius/color/width, lightbox-disabled are optional -->
<uga-image src="REPLACE-WITH-PATH.jpg" alt="Descriptive alt text" caption="Optional caption."></uga-image>

<!-- uga-slideshow: imageheight is lowercase (no hyphen) because it's an unmapped Lit property -->
<uga-slideshow filename="REPLACE-WITH-FILENAME.json" imageheight="400"></uga-slideshow>

<!-- uga-circles: same loadData contract as uga-accordion -->
<uga-circles type="local" filename="REPLACE-WITH-FILENAME.json"></uga-circles>

<!-- uga-video: Kaltura by videoid, OR host="youtube" with videoid, OR type="local" + filename for multiple videos -->
<uga-video videoid="REPLACE-WITH-KALTURA-ID"></uga-video>
<uga-video host="youtube" videoid="REPLACE-WITH-YOUTUBE-ID" name="Video title"></uga-video>

<!-- uga-instructor-note: filename can point to an HTML or JSON source -->
<uga-instructor-note type="local" filename="REPLACE-WITH-FILENAME.html"></uga-instructor-note>

<!-- uga-course-calendar: type="local"|"csv"; omit sync-due-status/sync-from-course/course-id/le-version outside D2L — those require Valence -->
<uga-course-calendar type="local" filename="REPLACE-WITH-FILENAME.json"></uga-course-calendar>

<!-- uga-footer: filename (JSON) OR program shorthand, not both -->
<uga-footer filename="REPLACE-WITH-FILENAME.json"></uga-footer>

<!-- uga-quiz: type="local"|"csv"|"inline"; omit dropbox-folder-id/dropbox-assignment-name outside D2L — those require Valence -->
<uga-quiz
  quiz-id="REPLACE-WITH-ID"
  quiz-title="Replace with quiz title"
  type="local"
  filename="REPLACE-WITH-FILENAME.json"
  passing-score="70"
  allow-retry="true"
  max-attempts="3"
  show-feedback="true">
</uga-quiz>

<!-- uga-return-to-top: no attributes -->
<uga-return-to-top></uga-return-to-top>
```

Rules for emitting this markup:

- Keep any `REPLACE-WITH-…` placeholder attribute value exactly as a placeholder — never invent a real filename, ID, or data file that wasn't supplied.
- Never add `dropbox-folder-id`, `dropbox-assignment-name`, `sync-due-status`, `sync-from-course`, `course-id`, or `le-version` unless the user has confirmed the content is going to D2L — these are the Valence-backed optional attributes on otherwise-portable components.
- Include the component's `<script type="module" src="…uga-components.js">` bundle reference (or note that it must be loaded) when adding a component to a page that doesn't already load it.
- Treat inserting a component as a substantive edit under the remediation rules below: call it out explicitly rather than folding it silently into a larger diff.

# Cleanup and remediation rules

When asked to fix content:

- Preserve all instructional meaning, examples, citations, labels, and assessment requirements.
- Do not silently rewrite academic content unless necessary to correct an accessibility barrier; document substantive edits.
- Remove empty elements, conversion debris, repeated headers/footers, and page-break artifacts.
- Merge paragraphs split mid-sentence by OCR or PDF conversion.
- Replace presentational HTML with semantic HTML and CSS utilities.
- Remove inline font, color, and size styling when the design system supplies an equivalent.
- Repair invalid list and table structures.
- Replace image-based text with real text whenever feasible.
- Preserve unresolved equations, diagrams, and ambiguous OCR text and flag them for subject-matter review.
- Do not invent alt text for visuals whose instructional purpose is unclear.
- Retest the remediated output rather than assuming the correction worked.

# Output requirements

## Findings report

Organize findings by matrix area rather than as one flat list. Include:

1. **Executive summary:** overall readiness, highest-risk barriers, and major strengths
2. **Scope and evidence reviewed:** files, modules, pages, or samples examined
3. **Accessibility matrix:** criterion, status, severity, evidence, recommended fix, and verification step
4. **Instructional-design matrix:** alignment and learner-experience findings when course-level material is present
5. **Priority remediation plan:** ordered by learner impact and dependency
6. **Items requiring human review:** ambiguous alt text, equations, complex diagrams, disciplinary notation, or platform behavior
7. **Testing limitations:** anything not verified, such as a live embedded tool or target screen-reader environment

Use a table with these columns for detailed findings:

| ID  | Matrix/criterion | Status | Severity | Evidence/location | Impact | Required fix | Verification |
| --- | ---------------- | ------ | -------- | ----------------- | ------ | ------------ | ------------ |

## Corrected HTML

When returning corrected HTML:

- provide valid, complete code appropriate to the requested format
- preserve all instructional content
- include a clear `<!-- REVIEW SUMMARY: ... -->` comment at the end
- list unresolved issues inside that summary
- do not claim completion when human review remains necessary
- when a fix adopts a suggested `uga-lit-components` element, insert the actual `<uga-*>` markup from the minimal usage reference above (with any required data file/ID left as a clearly marked placeholder) instead of describing the component in prose or leaving the original hand-built markup in place; note the swap in the `REVIEW SUMMARY` comment, including any placeholder the user still needs to fill in

## Scored matrix

Only calculate a score when the user requests one or supplies a scoring rubric. Do not convert accessibility compliance into a misleading percentage by default. Blocking barriers should remain visible even when an aggregate score is high.

# Privacy

Use anonymized examples. Do not request, reproduce, or expose student names, UGA IDs, accommodation letters, grades, disability diagnoses, or other sensitive student data. When course exports contain such data, exclude it from the report and recommend redaction.
