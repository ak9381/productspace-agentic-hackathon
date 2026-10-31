# PLAN v5 — Product Space Agentic AI Hackathon, 31 Oct 2026
v4 written 31 Oct ~2:10 PM IST; **updated to v5 ~2:25 PM IST** after rounds 5–6 (adds Grok + Meta AI judges). Originally written by Grok Bot (chair) after a 4-round council of Claude Code + Antigravity (agy). Build by Akash's voice only; nothing has been scaffolded.

## 1. Chosen track: 03 Meeting-to-execution → "OBJECTION!"
**Why:** speech is the natural input (a 30-second spoken debrief after a call), the demo goes voice → action in under 30 s, all 7 must-builds are feasible solo with free tools, Akash already has real demo data (today's kickoff transcript), and it passed every compliance check. Exam-prep tutor (02) was the runner-up: strongest India appeal but 7 subsystems and documented hallucination risk in misconception detection make it hard to prove in 9 h.

### Council scores (/30 = User+Investor+Business; /100 = event rubric)
| Round | Candidate | Claude /30 | agy /30 | Avg /30 | Avg /100 |
|---|---|---|---|---|---|
| 1 | A Media | 19 | 12 | 15.5 | 59.5 |
| 1 | B Tutor | 21 | 20 | 20.5 | 84.5 |
| 1 | **C Meeting (C1)** | 18 | 26 | **22.0** | **86.0** |
| 1 | D Finance | 17 | 16 | 16.5 | 73.5 |
| 1 | E Career | 17 | 15 | 16.0 | 70.0 |
| 2 | C1 control | 18 | 16 | 17.0 | 64.0 |
| 2 | **C2 OBJECTION! v2** | 20 | 24 | **22.0** | **86.0** |
| 3 | C2 control | 19 | 20 | 19.5 | 78.0 |
| 3 | **C3 v3 (de-risked)** | 21 | 25.5 | **23.2** | **91.0** |
| 4 | C3 control | 19 | 20 | 19.5 | 78.5 |
| 4 | **C4 v4 (final)** | 21 | 25 | **23.0** | **86.5** |
| 5 | C4 v4 (4 judges: Claude PENDING, agy 18, Meta AI 21, Grok 15) | – | 18 | **18.0** (avg of 3) | 72.0 |
| 6 | **C5 v5** (Claude PENDING, agy 19, Meta AI 21, Grok 13) | – | 19 | **17.7** (avg of 3) | 70.3 |
Rounds 5–6 use a stricter fixed-format prompt and 2 harsher judges, so compare within a round, not across. Round 6 novelty /8: agy 6, Meta AI 6, Grok 5; end-user /8: 5, 6, 5. Must-builds: Meta AI all yes; agy MB4/MB5 partial; Grok MB1/3/4/6 partial.
Round 4 added novelty and end-user value: C4 got novelty 6/8 and end-user 7/8 (Claude/agy).
**Noise:** control moved >2 points every round (C1 −5, C2 −2.5, C3 −3.7), so the judges are noisy. Trust the ranking (v-next beat its control every round), not the absolute numbers. Target (>25 avg, no judge <22) **not reached**: Claude stays at 21. Its remaining critique is scope against the clock.
**Must-fixes applied:** R1 conflict engine front and centre (both judges); R2 cut infra bloat (pgvector, multiple trackers) and add LinkedIn (both); R3 real reminders, topic-key drift (both); R4 Vercel free cron is daily-only, so hourly runs go through GitHub Actions, and keep 'Send now' (both). Open (one judge): multi-speaker parsing must stay solid (prompt 4), schedule tightness (cut order in §4).
Process note: rounds 3–4 used fresh sessions and the same prompt for both judges. The compliance, novelty and end-user sections arrived after round 3 had run, so they are in the round-4 prompt only. Rounds 5–6 summaries: council/round-5.md, round-6.md; v5 delta: council/v5-candidate.md. Raw outputs are in council/round-N.md, and scores are in council/scores.csv.

### Compliance check (all 5 vs rules.md)
| Check | 03 OBJECTION! | 01 Media | 02 Tutor | 04 Finance | 05 Career |
|---|---|---|---|---|---|
| Voice is main input | ✅ Debrief box | ⚠️ URL/upload | ✅ spoken reasoning | ⚠️ CSV/PDF | ⚠️ partly |
| Deployable free today | ✅ | ⚠️ video | ⚠️ 7 subsystems | ⚠️ PDF parsing | ⚠️ scraping |
| Test credentials | ✅ demo/demo | – | – | – | – |
| 2–3 min video lands | ✅ 30 s wow | ⚠️ | ✅ | ⚠️ | ⚠️ |
| Brand-new, not old project | ✅ (fitness research is unrelated, nothing reused) | ✅ | ✅ | ✅ | ✅ |
| Non-generic UI | ✅ ledger theme | – | – | – | – |
| AI genuinely useful | ✅ memory + verdicts | ✅ | ✅ | ✅ | ⚠️ |

## 2. Product spec — "OBJECTION!" v5 (the meeting agent that argues back)
**One line:** paste a call transcript or a WhatsApp chat, or just talk for 30 seconds. OBJECTION! turns it into decisions and tasks, and it objects, with receipts, when you contradict something the team already decided.

**End user.** A founder, PM or agency lead at a 5–30 person Indian startup with 10+ calls a week, where half the decisions actually happen in WhatsApp groups. The pain moment: "Didn't we agree launch was the 15th?" Nobody can find where, or a client WhatsApp quietly changes scope. Today: Notion notes, WhatsApp "MoM" messages, Otter summaries nobody rereads. Why switch: it remembers what was *decided* across calls and chats, and capture is one paste or 30 seconds of talking.

**Must-build coverage (statement 03), the frozen core:**
| Official must-build | v5 | Demo-visible |
|---|---|---|
| MB1 Transcript ingestion + speaker attribution | Three inputs: Zoom/Meet/Wispr transcript (`[mm:ss] Speaker N:` / `Name:`), **WhatsApp chat export** (`[31/10/26, 2:05 pm] Name: text` or `31/10/26, 14:05 - Name: text`; the sender is the speaker), spoken Debrief (speaker = you). Speaker names auto-guessed; rename is a stretch | Yes |
| MB2 Decisions, actions, owners, deadlines | Gemini structured JSON; each item has exact quote + speaker + timestamp; relative dates resolved; unquotable items dropped; self-corrections shown struck through | Yes |
| MB3 Conflicts with earlier decisions in memory | **Bounded agent loop** (Gemini function calling, 4 tools, max 5 steps): `search_memory` (topic key → widen 14 d/90 d/all → embedding fallback), `verify_conflict` (independent second check), `ask_clarifying_question` (ambiguous owner/date; answer by voice), `queue_action` (tray only). **Reasoning-trail panel** shows each step. On error/timeout → deterministic fallback (extract → key lookup → classify) so the demo never stalls. Contradiction → red **OBJECTION!** card: then-vs-now quotes, who/where/when; verdicts Overrule · Pivot (intentional) · Keep old · Flag, by tap or voice | **Hero** |
| MB4 Tracker via integration | **Ledger = tracker**: action cards with owner, due date, status open/done/blocked, source quote, one-tap/spoken status. **One real integration: Notion** — one database, fixed schema (Title, Owner, Due, Status, Source quote, Meeting, Objection link), internal integration token | Yes |
| MB5 Reminders before deadlines | GitHub Actions hourly schedule → `/api/reminders` (secret header) → Resend email for actions due < 24 h, writes Reminder log; **Send now** runs the same function. Emails go to Akash's own address (no domain setup) | Yes |
| MB6 Weekly digest per person | `/digest/[person]`: owned tasks, what changed this week, open objections, Gemini summary on top; "Email this" | Yes |
| MB7 Confirmation before posting | Confirmation tray: nothing is saved, sent to Notion or emailed until ticked + Confirm | Yes |
Optional (cheap): **Share to WhatsApp** — `https://wa.me/?text=` link with the confirmed decision or objection text; the user taps send. No API.

**Voice-first UX.** Hero Debrief box typed by Wispr (hold Fn). Voice also for verdicts, clarifying answers and (stretch) "what did we decide about X?" Q&A.
**Design (anti-Claude-UI).** Courtroom ledger / newspaper: paper #F4EFE6, ink black, stamp red #C0392B, serif display (Fraunces), mono quotes, rubber stamps (CONFIRMED / OVERRULED / PIVOT), vertical decision spine with superseded decisions struck through.
**Wow (30 s).** Memory holds the real kickoff call. Akash pastes a short WhatsApp export from a "team" chat ("Rohan: bro let's do it as 3 of us") → OBJECTION! "Kickoff (Sakshi, 30:41): max team size is 2". Then he speaks a debrief with a self-correction ("submit at midnight, actually 11:45") → struck-through correction, reasoning trail shows search_memory → verify_conflict → "refines 11:59 PM deadline, not a conflict". Confirm → Notion page appears, reminder queued.
**Proof.** /eval: 10 labelled snippets (3 contradictions, 2 refinements that must NOT be flagged, 5 plain incl. 2 WhatsApp) → live precision/recall + the agent-vs-fallback rate. Plus the Notion page, reminder log, real Wispr word count.
**Stretch (only after the core is deployed, in order):** Share to WhatsApp → voice Q&A → decision-debt score (silently reversed decisions/week) → markdown export → speaker rename → mobile swipe cards → share-as-image.
**Cut:** GitHub Issues as tracker, Vercel cron backup, Slack/Calendar/Linear APIs, live call joining, multi-tenant auth.
**Novelty (honest):** builds on temporal agent memory (Zep/Graphiti, arXiv 2501.13956) and meeting-recap research (Microsoft, PACM HCI 2025). What's new: conflict-at-capture across calls *and WhatsApp*, objection-with-receipts UX, a visible bounded agent trail, and a measured false-positive test. See council/research.md.

## 3. Architecture & stack (free, fast)
- **Next.js 15 + TypeScript + Tailwind** (custom theme) → **Vercel** Hobby.
- **Supabase** free Postgres (+ pgvector for the embedding fallback): meetings, utterances, decisions, actions, objections, agent_trace, reminders_log, people.
- **Gemini 2.x Flash** via Google AI Studio free key: JSON schema + function calling; `text-embedding` model for fallback. Check current model names in AI Studio at setup.
- **Notion API**: internal integration token + one shared database. **Resend** free (to Akash's own email). **GitHub Actions** cron in the app repo.
- Env vars: GEMINI_API_KEY, SUPABASE_URL, SUPABASE_SERVICE_KEY, NOTION_TOKEN, NOTION_DB_ID, RESEND_API_KEY, REMINDER_TO_EMAIL, CRON_SECRET, DEMO_PASSWORD. Never paste keys in chat or commit them.
- Routes: `/api/ingest` (parse transcript/WhatsApp/debrief) → `/api/agent` (loop + trace, fallback) → tray → `/api/commit` (DB + Notion) ; `/api/reminders` ; pages `/`, `/ledger`, `/meetings/[id]`, `/digest/[person]`, `/eval`, `/login`.

## 4. Hour-by-hour (IST) — core frozen by 7:30 PM
| Time | Do | Done when |
|---|---|---|
| 3:30–3:50 | LinkedIn post 1; Supabase project, AI Studio key, Notion integration + DB (share it with the integration), Resend; new folder in Claude Code | Keys in .env.local |
| 3:50–4:20 | Prompts 1–3: scaffold, theme, login, schema | Themed shell |
| 4:20–5:15 | Prompts 4–6: parsers (transcript + WhatsApp), extraction, Debrief + tray | Kickoff + WhatsApp → cited items |
| 5:15–5:30 | Prompt 7: first Vercel deploy | Live URL with login |
| 5:30–6:45 | Prompts 8–10: agent loop + trace + fallback, Objection card + verdicts, decision spine | Wow moment works |
| 6:45–7:30 | Prompts 11–13: ledger tracker + Notion, reminders + log + GitHub Actions, digest | **Core frozen + redeployed** |
| 7:30–8:00 | Dinner; LinkedIn post 2 | Posted |
| 8:00–9:00 | Prompts 14–15: seed data + eval page, tighten prompts | P/R live |
| 9:00–9:45 | Prompts 16–18: stretch in order (WhatsApp share, voice Q&A, decision debt) | Only if core is green |
| 9:45–10:30 | Prompt 19–20: design polish, README, full live run-through | No broken pages |
| 10:30–11:00 | Record video (§6), upload to Drive (link sharing on) | Opens logged-out |
| 11:00–11:30 | Real Wispr screenshot, fill form, submit; buffer | Submitted ≤ 11:30 |
| 1 Nov | LinkedIn post 3; submit post links by 11:59 PM | — |
**If behind at 6:45:** agent uses the fallback path only, with the trace still shown. **If behind at 7:30:** skip all stretch. Never drop: parsers, extraction, Objection card, tray, ledger + Notion, reminders + Send now, digest, deploy, eval.

## 5. LinkedIn posts (drafts — Akash posts them himself)
**Post 1 (now):**
"Today I'm building an AI product without typing a single prompt. 🎙️
I'm at the #AgenticAI Hackathon by @Product Space x @Wispr Flow, taking on Meeting-to-Execution.
In Indian startups, decisions don't die in meetings. They die in WhatsApp. 'Bro let's push launch to the 30th' and the 15th is quietly gone.
So I'm building OBJECTION!: paste a call or a WhatsApp chat, or just talk for 30 seconds. It turns that into tasks, and it *objects*, with receipts, when you contradict something your team already decided.
Every line dictated with Wispr Flow into Claude Code. 10 hours. 👇 Where did your team's last lost decision die?"

**Post 2 (while building; 20–30 s clip: Wispr dictating into Claude Code, then the reasoning trail and a red OBJECTION!):**
"~5 hours in. ~X,XXX words spoken, 0 typed.
Learning: speaking prompts makes me explain *why*, and the AI builds what I meant.
Plot twist: I fed the app our own hackathon kickoff call. Then I pasted a WhatsApp message from 'my team' saying we're 3 people. It objected: 'Kickoff ruled max team size = 2', with the timestamp. 😅
@Product Space @Wispr Flow #BuildWithVoice"

**Post 3 (by 1 Nov, demo video):**
"Built in one day, entirely by voice: OBJECTION! 🔨
→ calls, WhatsApp chats or a 30-second voice debrief → decisions, owners, deadlines, each with the quote
→ an agent that searches past decisions, double-checks itself and objects when you contradict them (eval: __% precision, refinements correctly not flagged)
→ confirm, then tasks land in the ledger + Notion; reminders and a weekly digest per person
Wispr Flow for the day: __ words. Takeaway: when you speak, you think out loud, and that's the best spec an AI can get.
Try it: <url> (demo / demo). Thanks @Product Space @Wispr Flow. What should it object to next?"

## 6. Demo video script (2:30, screen + voiceover)
0:00–0:15 Hook: "In Indian startups, decisions don't die in meetings, they die in WhatsApp. This is OBJECTION!, the meeting agent that argues back, built entirely by voice."
0:15–0:35 Memory: decision spine with today's real kickoff call ingested: speakers, quotes, timestamps.
0:35–1:00 WhatsApp: paste a chat export. Senders become speakers. Red OBJECTION! "Kickoff ruled max team = 2". Tap **Keep old**.
1:00–1:30 Voice: hold Fn, speak a messy debrief with a self-correction. Show it struck through. Reasoning trail: search_memory → verify_conflict → "refinement, not a conflict". The agent asks "Is Priya the owner?", answered by voice.
1:30–1:50 Confirm → ledger card + Notion page appear. Reminder log + **Send now** email arrives. Priya's weekly digest.
1:50–2:10 Eval page: precision/recall, refinements correctly not flagged, agent-vs-fallback rate. "Not a summarizer: memory plus judgement."
2:10–2:30 Built by voice: Wispr word count + clip of dictating to Claude Code. Close: "Paste it, say it, and never lose a decision again."

## 7. Spoken prompts (dictate via Wispr into Claude Code, in order)
1. "Okay, so we're starting a brand new project called Objection. It's a Next.js 15 app with the App Router, TypeScript and Tailwind, deploying on Vercel. Set it up in this folder, add a dot env example with GEMINI_API_KEY, SUPABASE_URL, SUPABASE_SERVICE_KEY, NOTION_TOKEN, NOTION_DB_ID, RESEND_API_KEY, REMINDER_TO_EMAIL, CRON_SECRET and DEMO_PASSWORD, and never put real keys in the code. Run it once to check it starts."
2. "Now the look. I don't want this to look like a default AI app — no purple gradients, no generic cards. Make it feel like a courtroom ledger or an old newspaper: warm paper background, ink black text, one stamp-red accent, Fraunces for headings and a mono font for quotes. Put it in a design tokens file and the Tailwind config, and make a masthead that says OBJECTION! with the tagline 'the meeting agent that argues back.'"
3. "Add a simple login: username demo and the password from DEMO_PASSWORD, set a cookie, protect every page except login and the reminders API. Then set up Supabase Postgres with tables for meetings, utterances with speaker and time, decisions with topic key, quote, speaker, time, status and an embedding column using pgvector, actions with owner, due date and status, objections with verdict, agent trace steps, a reminders log, and people. Give me the SQL as a migration and a small db helper."
4. "Ingestion. I'll paste three kinds of input. One: transcripts like square bracket minutes colon seconds, Speaker 1 colon, text, or just Name colon text. Two: WhatsApp chat exports, which look like square bracket 31 slash 10 slash 26 comma 2:05 pm square bracket Name colon message, or the Android format, date comma time dash Name colon message. The sender is the speaker, and skip system lines like 'messages are end-to-end encrypted' and media omitted. Three: a spoken debrief where the speaker is me. Auto-detect which one it is, turn it into utterances with speaker and time, and test it on a few lines from the kickoff transcript and a fake WhatsApp chat."
5. "Now the extraction step. Make an API route that calls Gemini with a strict JSON schema and returns a cleaned version of the text with self-corrections kept as pairs, what was said first and what it was corrected to, plus decisions and action items with owner, deadline resolved to a real date using the meeting date, the exact quote, the speaker and the time. Drop anything whose quote isn't in the source. Give each decision a topic key from this list: launch-date, deadline, team-size, pricing, scope, owner, budget, tech-stack, design, hiring, submission, tooling, meeting-cadence, client, other."
6. "Build the main screen. A big Debrief box as the hero — it's where Wispr Flow types — with a hint like 'hold Fn and just talk', plus a 'paste transcript or WhatsApp chat' tab. After submitting, show the cleaned text with my self-corrections struck through, then a Confirmation tray with every decision and action as a checkbox. Nothing is saved or sent anywhere until I tick and press Confirm."
7. "Let's deploy now. Help me push this to a new GitHub repo and deploy it to Vercel, and tell me exactly which environment variables to add. Then I'll test logging in on the live site."
8. "Now the agent. Use Gemini function calling with four tools and a hard limit of five steps. search_memory takes a topic and a query and looks for earlier active decisions with the same topic key in the last 14 days, then 90 days, then all time, and if there's still nothing, falls back to embedding similarity. verify_conflict does a separate, strict check of whether the new decision really contradicts the old one or just refines it. ask_clarifying_question is for when the owner or date is ambiguous. queue_action only adds things to the tray. Save every step to the agent trace table. If anything errors or times out, fall back to a simple fixed path: extract, look up by key, classify. Mark which path ran."
9. "Show the agent's work. Add a Reasoning trail panel next to the tray that shows each tool call, what it searched, what it found and why it decided, step by step, in the ledger style. When the agent asks a clarifying question, show it as a question card I can answer by typing or with my voice, and continue the loop with my answer."
10. "When a decision contradicts, show a big red OBJECTION! stamp card in the tray, with then versus now: the earlier quote, who said it, which meeting or chat and when, and the new quote. Four verdict buttons: Overrule, which supersedes the old decision; Pivot, meaning it's an intentional change, which also supersedes it but labels it intentional; Keep old; and Flag for discussion. Also a small box where I can say the verdict, like 'pivot, the 28th stands', and Gemini maps it to a button and asks me to confirm. Then make the home page a decision spine timeline grouped by topic, superseded ones struck through with an OVERRULED or PIVOT stamp."
11. "Now the tracker. Make a Ledger page where every confirmed action is a card with owner, due date, status open, done or blocked, the source quote and a link to the meeting, and I can change status with one tap. Then add Notion: when I confirm, create a page in the Notion database from NOTION_DB_ID with these exact properties — Title, Owner, Due, Status, Source quote, Meeting and Objection link — and show a 'filed in Notion' stamp with the link. Handle a bad token nicely."
12. "Reminders. Make an API route at api slash reminders that checks a CRON_SECRET header, finds open actions due in the next 24 hours that haven't been reminded, emails them with Resend to REMINDER_TO_EMAIL with the owner's name in the subject, and writes a row to the reminders log. Add a GitHub Actions workflow that calls it every hour with the secret, a Reminder log page, and a 'Send now' button that runs the same function."
13. "Weekly digest per person: a page at digest slash name showing what they own and when it's due, what changed this week — new, overruled and pivoted decisions — and open objections that involve them, with a short friendly Gemini summary on top and an 'Email this digest' button. Then redeploy."
14. "Seed data. Write a seed script that loads the real kickoff transcript from a file, dated today, with Speaker 2 as Sakshi, plus three short earlier team meetings from last week with a launch date, a pricing decision and an owner, and one small WhatsApp chat export from the team. Make it safe to run twice."
15. "Now an eval page to prove it works. Ten labelled snippets: three that really contradict earlier decisions, two that are refinements and must not be flagged, and five normal ones with known actions, including two from WhatsApp. Run them through the real pipeline and show precision and recall for action extraction and conflict detection, which path ran, agent or fallback, and the failures. Then run it and tighten the prompts until the refinements stop getting flagged — but don't change the labels."
16. "Small one: on every confirmed decision and objection add a 'Share to WhatsApp' button that opens a wa dot me link with the text filled in, so I just tap send."
17. "Add voice Q&A over memory: a box where I can ask 'what did we decide about pricing?' and it answers with the timeline of decisions on that topic, with quotes and dates, using search_memory."
18. "Add a Decision debt score in the masthead: the share of decisions in the last seven days that were contradicted without anyone giving a verdict, shown as a little gauge with last week's number for comparison, and clicking it lists them."
19. "Design pass. Go through every page: empty states, loading states that say things like 'checking the record', stamps animating in slightly, good spacing at laptop size, and a decent layout on a phone. Keep the newspaper feel."
20. "Write a README with what Objection does, the seven must-builds mapped to features, the architecture, how the agent loop and fallback work, how to run it, the demo login, and a section on how I built it entirely by voice with Wispr Flow. Redeploy, then walk through the whole demo on the live URL with me and fix anything broken."
