# OBJECTION! v5: delta on v4 (plan.md §2), 31 Oct ~2:15 PM IST
All 7 must-builds stay. This file only lists what changes.

## Upgrades by rubric axis
| Axis | v5 addition | Notes |
|---|---|---|
| AI integration 20 | **A real agent loop.** Gemini function calling, max 8 steps per debrief. Tools: `search_memory(topic, query, window)` (starts at 14 days and widens to 90 days, then all time, if nothing is found); `ask_clarifying_question(field, options)` (when the owner or date is ambiguous, e.g. "Thursday this week or next?", the user answers by voice); `verify_conflict(new, old)` (a second, independent check before an Objection is shown, which cuts false positives); `file_issue(action)`; `schedule_reminder(action, when)`. The last two only queue into the confirmation tray and never run before you confirm. A **visible reasoning trail** panel lists each tool call, its arguments, what it found and why | Answers agy r5: "a prompt chain, not an agent" |
| AI / memory | **Embedding fallback.** Topic keys first; if there's no match, Gemini text-embedding plus cosine similarity over stored decisions (computed in Postgres with pgvector on Supabase, or in JS over fewer than 500 rows) | Answers agy r5: "fragile 15-key taxonomy" |
| Wispr 20 | Voice for: (1) the Debrief, (2) **objection verdicts** ("overrule it, 28th stands"), (3) **voice Q&A over memory**: "what did we decide about pricing?" returns a timeline answer with citations, (4) answers to clarifying questions. **Spoken-words counter** in the masthead: words entered through voice boxes (a client-side count). It is NOT Wispr's own number; the real Wispr screenshot goes in the submission | Never present the app's counter as Wispr's count (faking = negative marking) |
| UX 20 | Courtroom-ledger theme + decision spine (v4) + **mobile one-tap cards**: the objection card and tray become swipeable full-width cards on phones (Overrule / Keep / Flag as big tap targets) | |
| Problem 15 | **WhatsApp chat export** as input ("[31/10/26, 2:05 pm] Name: text" format, speakers taken from the senders) to answer agy's "decisions change in WhatsApp". **Markdown export** of confirmed items (Notion/Linear-style checklist, copy button + .md download) alongside GitHub Issues, for non-technical teams | Native Notion/Linear APIs stay on the cut list |
| LinkedIn 15 | A build-in-public clip: Akash dictates "we're three of us now", the app objects with the kickoff quote (team max 2), and the clip ends on the Wispr screen. A "Share as image" button on every Objection card | |
| Innovation 10 | **Decision debt score**: decisions reversed *silently* in the last 7 days (contradicted but never given an explicit Overrule verdict), divided by total decisions, shown as a gauge with a trend. "Your team silently reversed 3 decisions this week." | Measurable, only works because of cross-meeting memory |
| Friction (agy r5) | Speaker rename becomes optional (auto-guess from names in the text); objections have a "Pivot (intentional)" verdict alongside Overrule, so changing your mind is quick and not bureaucratic | |

## Cut order if behind (drop from the top; never drop the "Never cut" line)
1. Mobile swipe cards (keep the responsive layout)
2. Share-as-image
3. Voice Q&A over memory (keep it if before 9 PM)
4. Embedding fallback (topic keys only)
5. Daily Vercel cron backup (GitHub Actions hourly + Send now stay)
6. Markdown export (keep a basic copy button)
7. Clarifying-question tool (agent assumes, flags the item "unclear")
8. Decision debt gauge (show a plain number instead)
**Never cut:** transcript/WhatsApp parsing with speakers, extraction with quotes, agent loop with search_memory + verify_conflict + reasoning trail, Objection card + verdicts, confirmation tray, GitHub issue, reminders (Send now + log), digest page, deploy + login, eval page.

## Rough added time
Agent loop + trail +1.5 h; embedding fallback +0.5 h; WhatsApp parser +0.3 h; markdown export +0.2 h; voice Q&A +0.5 h; decision debt +0.4 h; mobile cards +0.5 h. About +4 h on top of v4, so items 1–4 of the cut order are likely casualties unless the build runs fast.

---
## v5 revision after round 5 must-fixes (Grok, Meta AI, agy), 31 Oct ~2:20 PM IST
Raised by 2 or more judges, so all three are applied:

**(a) A real tool-use loop with a visible trace (all 3 judges).** Kept, but bounded: Gemini function calling, **4 tools, max 5 steps**, then a hard stop. Tools: `search_memory` (topic key → widen window → embedding fallback), `verify_conflict`, `ask_clarifying_question`, `queue_action` (task/reminder into the tray). Each step is written to a `trace` table and shown live in the Reasoning trail panel. If the loop errors or runs out of steps, a deterministic fallback (extract → key lookup → classify) still produces the tray, so the demo can't stall.

**(b) Scope: ruthless core path (agy, Grok).** Build in this order and freeze the core by 7:30 PM IST:
1. Paste transcript / spoken Debrief → extraction with quotes → confirmation tray (MB1, MB2, MB7)
2. Memory + agent loop + Objection card + trace (MB3)
3. Ledger tracker + Notion push (MB4)
4. Reminders: one GitHub Actions hourly job + Send now + log (MB5); the Vercel cron backup is **cut**
5. Digest page (MB6)
6. Deploy + login + eval page
Everything else is a stretch, added in the cut order above only after the core is deployed: voice Q&A, decision debt, WhatsApp import, markdown export, mobile swipe cards, share image. Last 3 h are reserved for polish, video and LinkedIn (agy r6a).

**(c) Tracker for non-technical users (agy, Meta AI).** **The ledger itself is the tracker**: each confirmed action is a card with owner, due date, status (open / done / blocked), source quote and a one-tap or spoken status update. The one real external integration becomes **Notion** (a database via the official API with an internal integration token, free; most Indian founders and agencies already use it). GitHub Issues moves to the cut list. The markdown export stays a stretch item for Linear/others.

All 7 must-builds stay, including reminders.
