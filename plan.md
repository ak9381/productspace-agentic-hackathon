# PLAN v6 (final) — Product Space Agentic AI Hackathon, 31 Oct 2026
v4 written 31 Oct ~2:10 PM IST; updated to v5 ~2:25 PM IST after rounds 5–6; **final v6 ~2:40 PM IST** after round 7 (end-to-end review, all 3 judges GO with a hard scope cut); **v6 + LIVE MEETING mode ~2:45 PM IST** (core, MB3). Originally written by Grok Bot (chair) after a 4-round council of Claude Code + Antigravity (agy). Build by Akash's voice only; nothing has been scaffolded.

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
| 7 | **C5-final end-to-end** (Claude PENDING, agy 20, Meta AI 15, Grok 15) | – | 20 | **16.7** (avg of 3) | 77.7 |
Rounds 5–6 use a stricter fixed-format prompt and 2 harsher judges, so compare within a round, not across. Round 6 novelty /8: agy 6, Meta AI 6, Grok 5; end-user /8: 5, 6, 5. Must-builds: Meta AI all yes; agy MB4/MB5 partial; Grok MB1/3/4/6 partial. **Round 7:** all 3 say GO with a hard scope cut; agy all MB yes, Grok MB4 partial, Meta AI MB4/5/6 partial (thin Notion, reminders only to self, digest only a button). v6 fixes are listed in council/round-7.md.
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
| MB3 Conflicts with earlier decisions in memory | **Bounded agent loop** (Gemini function calling, 4 tools, max 5 steps): `search_memory` (topic key → widen 14 d/90 d/all → embedding fallback), `verify_conflict` (independent second check; **refinement rule:** a narrower deadline or a more specific value inside the old one = REFINE, not contradict, e.g. "by midnight" vs "by 11:59 PM"), `ask_clarifying_question` (ambiguous owner/date; answer by voice), `queue_action` (tray only). **Reasoning-trail panel** shows each step. On error/timeout → deterministic fallback (extract → key lookup → classify) so the demo never stalls. On a Gemini 429, the demo inputs (kickoff + demo WhatsApp + scripted debrief) are served from **cached Gemini responses** (stored JSON, labelled "cached"). Contradiction → red **OBJECTION!** card: then-vs-now quotes, who/where/when; verdicts Overrule · Pivot (intentional) · Keep old · Flag, by tap or voice. **LIVE MEETING mode (`/live`)** flags contradictions *during* meeting 2 (see below) | **Hero** |
| MB4 Tracker via integration | **Ledger = primary tracker**: action cards with owner, due date, status open/done/blocked, source quote, one-tap/spoken status. **One real integration: Notion** — one database, fixed schema (Title, Owner, Due, Status, Source quote, Meeting, Objection link), internal integration token. **Best-effort single-DB append**: every confirm tries one Notion page; result (filed / failed + reason) shown in a visible **Notion log**; a failure never blocks the ledger | Yes |
| MB5 Reminders before deadlines | GitHub Actions hourly schedule → `/api/reminders` (secret header) → Resend email for actions due < 24 h, writes Reminder log; **Send now** runs the same function. Emails go to **each owner's email from the `people` table**; demo people use Akash's +alias addresses (akash+priya@…, akash+rohan@…), so real per-person mail with no domain setup | Yes |
| MB6 Weekly digest per person | `/digest/[person]`: owned tasks, what changed this week, open objections, Gemini summary on top; "Email this". **Scheduled:** the same GitHub Actions workflow calls `/api/digest` weekly (Mon 9:00 AM IST) and emails each person their digest; also a Send digest now button + digest log | Yes |
| MB7 Confirmation before posting | Confirmation tray: nothing is saved, sent to Notion or emailed until ticked + Confirm | Yes |
**LIVE MEETING mode (core, MB3).** `/live` uses the browser **Web Speech API** (Chrome on the Mac; `continuous` + `interimResults`, `en-IN`) to transcribe meeting 2 on the laptop mic. Interim text shows greyed; final sentences are appended with a speaker label (tap-to-switch chip: Akash / Guest, default alternates) and an mm:ss timer. **Every ~10 s or 2 new final sentences** (debounced; never more than one request in flight) the client POSTs only the new lines to **`/api/live-check`**. The server first runs a cheap regex/keyword gate (deadline, team, submit, video, deploy, must, decide, let's, by <time>, numbers) and **skips chunks with no decision-like text** (no Gemini call). Otherwise it makes **one Gemini call per chunk** that both extracts candidate decisions (topic key from the same taxonomy) and classifies each against the stored memory rows for those keys (seeded kickoff decisions with exact quotes + timestamps, pre-loaded into the prompt, no agent loop), using the same **refinement rule**. A contradiction pops a live red **OBJECTION!** card: *then* — kickoff quote, speaker (Sakshi), meeting 1 + [mm:ss] — vs *now* — the new line, speaker, live [mm:ss]. Refinements show a small grey "refinement, not flagged" chip; new decisions a small "new" chip. On 429 → the cached-response fallback for the scripted meeting 2 lines. **Fallback:** if mic/Web Speech fails, paste the transcript after the call into the normal ingest. **End meeting** saves the transcript as meeting 2 and runs the full extraction + agent into the confirmation tray (nothing saved to the ledger/Notion until confirmed). Note: Web Speech is not Wispr, so it adds nothing to (and takes nothing from) the Wispr word count; Wispr stays the input for the Debrief, verdicts and all build prompts.
**Demo order:** meeting 1 = the real kickoff call (memory) → meeting 2 = a short live call on `/live` (Akash + his second phone or a friend) → the WhatsApp drift → the Wispr debrief → confirm → ledger/Notion/reminders/digest.
Optional (cheap): **Share to WhatsApp** — `https://wa.me/?text=` link with the confirmed decision or objection text; the user taps send. No API.

**Voice-first UX.** Hero Debrief box typed by Wispr (hold Fn). Voice also for verdicts, clarifying answers and (stretch) "what did we decide about X?" Q&A.
**Design (anti-Claude-UI).** Courtroom ledger / newspaper: **slim theme: 2 colours** (paper #F4EFE6 + stamp red #C0392B, text in ink = near-black of the same palette), **1 serif** (Fraunces) **+ 1 mono** (JetBrains Mono) for quotes; CSS rubber stamps (CONFIRMED / OVERRULED / PIVOT), vertical decision spine with superseded decisions struck through.
**Wow (30 s).** Memory = the **real kickoff transcript** of this hackathon (Sakshi's answers: team max 2, submit by 11:59 PM IST, no old projects, deploy + credentials, 2–3 min video). Akash pastes the `.txt` export of a **small demo WhatsApp group he made himself with friends** (not the official hackathon group). Each wrong claim gets a red OBJECTION! card with both quotes: "Rohan (2:41 pm): we can be 3 na" vs "Sakshi (30:41): max is a team of two". Akash corrects each by tap or by voice ("keep the kickoff rule"), then shares the correction back with a wa.me link. The trail shows one honest non-conflict too: "submit by midnight" is read as a **refinement** of 11:59 PM, not a contradiction.
**Chat inputs.** WhatsApp is the `.txt` from "Export chat → Without media". No WhatsApp Business/API. The same paste box takes **Slack or Google Chat text copied as `Name: text`** (generic format), so no Slack app is needed. Sharing back is a wa.me link the user taps to send.
**Proof.** /eval: 10 labelled snippets (3 contradictions, 2 refinements that must NOT be flagged, 5 plain incl. 2 WhatsApp) → live precision/recall + the agent-vs-fallback rate. Plus the Notion page, reminder log, real Wispr word count.
**Stretch (zero before 10:30 PM IST; only if the core is green and the video is safe, in order):** Share to WhatsApp → voice Q&A → decision-debt score (silently reversed decisions/week) → markdown export → speaker rename → mobile swipe cards → share-as-image.
**Cut:** GitHub Issues as tracker, Vercel cron backup, Slack/Calendar/Linear APIs, live call joining, multi-tenant auth.
**Novelty (honest):** builds on temporal agent memory (Zep/Graphiti, arXiv 2501.13956) and meeting-recap research (Microsoft, PACM HCI 2025). What's new: conflict-at-capture across calls *and WhatsApp*, objection-with-receipts UX, a visible bounded agent trail, and a measured false-positive test. See council/research.md.

## 3. Architecture & stack (free, fast)
- **Next.js 15 + TypeScript + Tailwind** (custom theme) → **Vercel** Hobby.
- **Supabase** free Postgres (+ pgvector for the embedding fallback): meetings, utterances, decisions, actions, objections, agent_trace, reminders_log, people.
- **Gemini 2.x Flash** via Google AI Studio free key: JSON schema + function calling; `text-embedding` model for fallback. Check current model names in AI Studio at setup.
- **Notion API**: internal integration token + one shared database. **Resend** free (to each person's email in `people`; demo people = Akash's +aliases). **GitHub Actions**: one workflow, hourly `/api/reminders` + weekly `/api/digest`.
- Env vars: GEMINI_API_KEY, SUPABASE_URL, SUPABASE_SERVICE_KEY, NOTION_TOKEN, NOTION_DB_ID, RESEND_API_KEY, RESEND_FROM, CRON_SECRET, DEMO_PASSWORD. Never paste keys in chat or commit them.
- `/live`: browser Web Speech API (Chrome) → debounced chunks → `/api/live-check` (regex gate → 1 Gemini call, memory rows inlined) → live cards; End meeting → `/api/ingest` + agent → tray.
- Routes: `/api/ingest` (parse transcript/WhatsApp/debrief) → `/api/agent` (loop + trace, fallback) → tray → `/api/commit` (DB + Notion) ; `/api/reminders` ; `/api/digest` ; `/api/live-check` ; pages `/`, `/live`, `/ledger`, `/meetings/[id]`, `/digest/[person]`, `/eval`, `/login`.

## 4. Hour-by-hour (IST) — core frozen at 7:00 PM, zero stretch before 10:30
**Pre-build checklist (done BEFORE 3:30 PM, by clicking, no code):**
- [ ] **Vercel** account linked to GitHub; empty project name reserved.
- [ ] **Supabase** project created; pgvector enabled; copy the **pooler (transaction) connection URL** (port 6543), not the direct one, plus URL + service key.
- [ ] **Notion**: internal integration created; one database with the fixed schema (Title, Owner, Due, Status, Source quote, Meeting, Objection link) **shared with the integration**; copy token + DB id.
- [ ] **Resend** API key; test one email to akash+test@… arrives (from [email removed]).
- [ ] **Gemini** key from AI Studio; check current Flash + embedding model names; note the free-tier RPM.
- [ ] All values in a local .env.local (never in chat or git); CRON_SECRET + DEMO_PASSWORD generated.
- [ ] Kickoff transcript file + demo WhatsApp .txt export saved in the project folder.

| Time | Do | Done when |
|---|---|---|
| 3:30–3:45 | LinkedIn post 1; new folder in Claude Code | Posted |
| 3:45–4:10 | Prompts 1–3: scaffold, slim theme (no extra styling), login, schema (+ people with emails) | Themed shell |
| 4:10–4:50 | Prompts 4–6: parsers (transcript + WhatsApp + Name: text), extraction, Debrief + tray | Kickoff + WhatsApp → cited items |
| 4:50–5:05 | Prompt 7: first Vercel deploy | Live URL with login |
| 5:05–5:35 | Prompts 14–15 (moved up): seed kickoff decisions with exact quotes + eval page; run eval on the fallback path | Eval runs; 7 (refinement) not flagged |
| 5:35–6:15 | Prompts 8–10: agent loop + trace + fallback + 429 cache, Objection card + verdicts, spine | Wow moment works; eval re-run on agent path |
| 6:15–6:35 | **Prompt 10b: LIVE MEETING mode** `/live` + `/api/live-check`; test with the meeting 2 script (§5c) in Chrome | 2 live objections, refinement not flagged |
| 6:35–7:00 | Prompts 11–13: ledger + Notion best-effort log, reminders + digest on one workflow | **CORE FROZEN 7:00 + redeployed** |
| 7:00–7:30 | Dinner; LinkedIn post 2 | Posted |
| 7:30–9:00 | Hardening only: rehearse the live call (meeting 2) twice on the deployed URL, run the full demo 3×, fix bugs, tighten prompts against eval, cache demo responses | Demo passes 3× |
| 9:00–9:45 | Prompt 20 README + empty/loading states only. **Prompt 19 theme polish cut** (time went to LIVE mode) | No broken pages |
| 9:45–10:30 | Full live run-through on the deployed URL; logged-out check of every link | Green |
| 10:30–11:00 | Record video (§6), upload to Drive (link sharing on) | Opens logged-out |
| 11:00–11:30 | Real Wispr screenshot, fill form, submit; buffer. Stretch (16–18) only if submitted early | Submitted ≤ 11:30 |
| 1 Nov | LinkedIn post 3; submit post links by 11:59 PM | — |
**If behind at 6:30:** agent runs the fallback path only (trace still shown). **If behind at 7:00:** Notion stays log-only on failure, digest = scheduled + button, no new features. Never drop: parsers, extraction, Objection card, LIVE mode (or its paste fallback), tray, ledger + Notion log, reminders + Send now, scheduled digest, deploy, eval.

## 5. LinkedIn posts (drafts — Akash posts them himself)
**Post 1 (now):**
"Today I'm building an AI product without typing a single prompt. 🎙️
I'm at the #AgenticAI Hackathon by @Product Space x @Wispr Flow, taking on Meeting-to-Execution.
In Indian startups, decisions don't die in meetings. They die in WhatsApp. 'Bro let's push launch to the 30th' and the 15th is quietly gone.
So I'm building OBJECTION!: paste a call, a WhatsApp export or Slack text, or just talk for 30 seconds. It turns that into tasks, and it *objects*, with receipts, when you contradict something your team already decided.
Every line dictated with Wispr Flow into Claude Code. 10 hours. 👇 Where did your team's last lost decision die?"

**Post 2 (while building; 20–30 s clip: Wispr dictating into Claude Code, then the live call on /live with a red OBJECTION! popping up mid-sentence):**
"~5 hours in. ~X,XXX words spoken, 0 typed.
Learning: speaking prompts makes me explain *why*, and the AI builds what I meant.
Plot twist: I fed the app our own hackathon kickoff call as memory. Then I hopped on a quick call with a friend and said 'let's make the video 5 minutes', and a red OBJECTION! popped up *live, mid-sentence*, with the kickoff quote: 2–3 minutes. Then I made a tiny WhatsApp group with friends, let them 'discuss' the rules, and pasted the export. It objected four times: team of 3, 'deadline is tomorrow morning', old projects, no deploy. Each came with the exact kickoff quote and timestamp. And it did NOT flag 'let's submit by midnight' or 'let's submit by 11', because that's a refinement. 😅
@Product Space @Wispr Flow #BuildWithVoice"

**Post 3 (by 1 Nov, demo video):**
"Built in one day, entirely by voice: OBJECTION! 🔨
→ calls, WhatsApp exports, Slack/Google Chat text or a 30-second voice debrief → decisions, owners, deadlines, each with the quote
→ an agent that searches past decisions, double-checks itself and objects when you contradict them (eval: __% precision, refinements correctly not flagged)
→ confirm, then tasks land in the ledger + Notion; reminders and a weekly digest per person
Wispr Flow for the day: __ words. Takeaway: when you speak, you think out loud, and that's the best spec an AI can get.
Try it: <url> (demo / demo). Thanks @Product Space @Wispr Flow. What should it object to next?"

## 5b. Demo WhatsApp script
Type these in a small demo group Akash creates (e.g. "Objection demo" with 2–3 friends), then Export chat → Without media and paste the .txt. Nothing goes to the official hackathon group.
1. **Rohan:** Bro I'm in for the hackathon, adding Neha too, we can be 3 na?
2. **Neha:** Yes 3 is fine I think, they never said a limit
3. **Akash:** Ok cool. When's the submission?
4. **Rohan:** Deadline is tomorrow morning I heard, we have the whole night 😎
5. **Neha:** Also can we just submit my old expense-tracker project? old projects are fine right
6. **Rohan:** And no need to deploy, video is enough
7. **Akash:** Let's aim to submit by midnight then
8. **Neha:** Wispr is optional na, we can type

Expected result:
- Objections: 1–2 (team max is 2), 4 (deadline is 11:59 PM IST), 5 (no old projects), 6 (must deploy, with test credentials), 8 (Wispr is mandatory and 20% of the score).
- 3 is a question, so no decision.
- **7 is a refinement and must NOT be flagged.** This proves there are no false positives.
- Use friends' real first names or keep these.

## 5c. Meeting 2 script (live call on /live, ~60 s)
Akash on the laptop (Chrome, /live), the guest on his second phone or a friend on speaker near the mic. Speak clearly, one line each, a short pause between lines.
1. **Akash:** Okay, quick sync on the hackathon submission.
2. **Guest:** I think the demo video can be like five minutes, we have a lot to show. → **OBJECTION!** vs kickoff: video must be 2–3 minutes.
3. **Akash:** And the LinkedIn posts we can do by Monday, right? → **OBJECTION!** vs kickoff: LinkedIn links due by 1 Nov 11:59 PM IST.
4. **Guest:** Let's submit by 11 PM tonight to be safe. → **refinement** of 11:59 PM, NOT flagged (grey chip).
5. **Akash:** Decided: Priya owns the demo video, due 10:30 tonight. → **new decision** + action (owner Priya, due 10:30 PM), goes to the tray on End meeting.
6. **Akash:** Okay, ending the meeting. → no decision; tap End meeting.
Expected: 2 live objections (lines 2, 3), 1 refinement not flagged (4), 1 new decision (5); End meeting → tray with the action.

## 6. Demo video script (2:45, screen + voiceover)
0:00–0:12 Hook: "Decisions don't die in meetings, they die in the next meeting and in WhatsApp. This is OBJECTION!, the meeting agent that argues back, built entirely by voice."
0:12–0:25 Meeting 1 = memory: decision spine with today's real kickoff call ingested: speakers, quotes, timestamps.
0:25–1:00 Meeting 2 LIVE on /live: Akash + guest run the §5c script. Mid-call, red OBJECTION! cards pop up for "five-minute video" and "LinkedIn by Monday", each showing Sakshi's kickoff quote and [mm:ss] vs the new line. "Submit by 11 PM" gets a grey refinement chip. End meeting → the Priya action lands in the tray. "This is the browser's speech-to-text for the call; Wispr is how I talk to the app."
1:00–1:25 WhatsApp drift: paste the demo group export. Objections for team of 3, "tomorrow morning", old projects, no deploy, Wispr optional; "submit by midnight" not flagged. Keep old by tap, "keep the kickoff rule" by voice, Share to WhatsApp.
1:25–1:45 Wispr debrief: hold Fn, a messy debrief with a self-correction, struck through. Reasoning trail: search_memory → verify_conflict → refinement. Clarifying question answered by voice.
1:45–2:05 Confirm → ledger card + Notion log "filed". Reminder Send now email arrives at Priya's +alias; Priya's weekly digest (scheduled Mondays).
2:05–2:25 Eval page: precision/recall, refinements not flagged, agent-vs-fallback rate.
2:25–2:45 Built by voice: Wispr word count + clip of dictating to Claude Code. Close: "Say it in a meeting, a chat or a debrief, and never lose a decision again."

## 7. Spoken prompts (dictate via Wispr into Claude Code, in order)
1. "Okay, so we're starting a brand new project called Objection. It's a Next.js 15 app with the App Router, TypeScript and Tailwind, deploying on Vercel. Set it up in this folder, add a dot env example with GEMINI_API_KEY, SUPABASE_URL, SUPABASE_SERVICE_KEY, NOTION_TOKEN, NOTION_DB_ID, RESEND_API_KEY, RESEND_FROM, CRON_SECRET and DEMO_PASSWORD, and never put real keys in the code. Run it once to check it starts."
2. "Now the look. I don't want this to look like a default AI app — no purple gradients, no generic cards. Make it feel like a courtroom ledger or an old newspaper: only two colours, warm paper and stamp red, with near-black ink text, one serif font, Fraunces, and one mono font, JetBrains Mono, for quotes. Nothing else. Put it in a design tokens file and the Tailwind config, and make a masthead that says OBJECTION! with the tagline 'the meeting agent that argues back.'"
3. "Add a simple login: username demo and the password from DEMO_PASSWORD, set a cookie, protect every page except login and the reminders API. Then set up Supabase Postgres with tables for meetings, utterances with speaker and time, decisions with topic key, quote, speaker, time, status and an embedding column using pgvector, actions with owner, due date and status, objections with verdict, agent trace steps, a reminders log, a digest log, a Notion log, and people with name and email. Give me the SQL as a migration and a small db helper."
4. "Ingestion. I'll paste three kinds of input. One: transcripts like square bracket minutes colon seconds, Speaker 1 colon, text, or just Name colon text. Two: WhatsApp chat exports, which look like square bracket 31 slash 10 slash 26 comma 2:05 pm square bracket Name colon message, or the Android format, date comma time dash Name colon message. The sender is the speaker, and skip system lines like 'messages are end-to-end encrypted' and media omitted. Three: a spoken debrief where the speaker is me. Auto-detect which one it is, turn it into utterances with speaker and time, and test it on a few lines from the kickoff transcript and a fake WhatsApp chat."
5. "Now the extraction step. Make an API route that calls Gemini with a strict JSON schema and returns a cleaned version of the text with self-corrections kept as pairs, what was said first and what it was corrected to, plus decisions and action items with owner, deadline resolved to a real date using the meeting date, the exact quote, the speaker and the time. Drop anything whose quote isn't in the source. Give each decision a topic key from this list: launch-date, deadline, team-size, pricing, scope, owner, budget, tech-stack, design, hiring, submission, tooling, meeting-cadence, client, other."
6. "Build the main screen. A big Debrief box as the hero — it's where Wispr Flow types — with a hint like 'hold Fn and just talk', plus a 'paste transcript or WhatsApp chat' tab. After submitting, show the cleaned text with my self-corrections struck through, then a Confirmation tray with every decision and action as a checkbox. Nothing is saved or sent anywhere until I tick and press Confirm."
7. "Let's deploy now. Help me push this to a new GitHub repo and deploy it to Vercel, and tell me exactly which environment variables to add. Then I'll test logging in on the live site."
8. "Now the agent. Use Gemini function calling with four tools and a hard limit of five steps. search_memory takes a topic and a query and looks for earlier active decisions with the same topic key in the last 14 days, then 90 days, then all time, and if there's still nothing, falls back to embedding similarity. verify_conflict does a separate, strict check of whether the new decision really contradicts the old one or just refines it. Rule: if the new one is a narrower deadline or a more specific value inside the old one, like 'by midnight' versus 'by 11:59 PM', it's a refinement, not a contradiction. ask_clarifying_question is for when the owner or date is ambiguous. queue_action only adds things to the tray. Save every step to the agent trace table. If anything errors or times out, fall back to a simple fixed path: extract, look up by key, classify. Mark which path ran. And if Gemini returns a 429, serve the cached responses for the demo inputs from a JSON file and label them cached."
9. "Show the agent's work. Add a Reasoning trail panel next to the tray that shows each tool call, what it searched, what it found and why it decided, step by step, in the ledger style. When the agent asks a clarifying question, show it as a question card I can answer by typing or with my voice, and continue the loop with my answer."
10. "When a decision contradicts, show a big red OBJECTION! stamp card in the tray, with then versus now: the earlier quote, who said it, which meeting or chat and when, and the new quote. Four verdict buttons: Overrule, which supersedes the old decision; Pivot, meaning it's an intentional change, which also supersedes it but labels it intentional; Keep old; and Flag for discussion. Also a small box where I can say the verdict, like 'pivot, the 28th stands', and Gemini maps it to a button and asks me to confirm. Then make the home page a decision spine timeline grouped by topic, superseded ones struck through with an OVERRULED or PIVOT stamp."
11. "Now the tracker. Make a Ledger page where every confirmed action is a card with owner, due date, status open, done or blocked, the source quote and a link to the meeting, and I can change status with one tap. Then add Notion: when I confirm, create a page in the Notion database from NOTION_DB_ID with these exact properties — Title, Owner, Due, Status, Source quote, Meeting and Objection link — and show a 'filed in Notion' stamp with the link. This is best effort: if Notion fails, still save to the ledger, and write every attempt, filed or failed with the reason, to a Notion log I can see."
12. "Reminders. Make an API route at api slash reminders that checks a CRON_SECRET header, finds open actions due in the next 24 hours that haven't been reminded, emails each owner at their email from the people table with Resend, and writes a row to the reminders log. Add one GitHub Actions workflow that calls it every hour with the secret, a Reminder log page, and a 'Send now' button that runs the same function."
13. "Weekly digest per person: a page at digest slash name showing what they own and when it's due, what changed this week — new, overruled and pivoted decisions — and open objections that involve them, with a short friendly Gemini summary on top and an 'Email this digest' button. Also add api slash digest, protected by CRON_SECRET, that emails every person their digest, and add a weekly Monday 9 AM IST schedule to the same GitHub Actions workflow, plus a Send digest now button and a digest log. Then redeploy."
14. "Seed data. Write a seed script that loads the real kickoff transcript from a file, dated today 31 October, with Speaker 2 as Sakshi, and pre-extracts its decisions as the memory, each with the exact quote and timestamp from the transcript: team size max two, submission by 11:59 PM IST today, LinkedIn posts by 1 November 11:59 PM, no old projects, you must pick one of the five statements, the project must be deployed with test credentials, a 2–3 minute video with voiceover, and Wispr Flow use is mandatory and 20 percent of the score. Also add two short earlier team meetings from last week so the timeline isn't empty. Don't seed the WhatsApp chat, I'll paste that live. Add people Priya, Rohan and me with emails akash plus priya, akash plus rohan and my own, at my Gmail. Make it safe to run twice. And make sure the paste box also accepts plain Name colon text from Slack or Google Chat."
15. "Now an eval page to prove it works. Ten labelled snippets: three that really contradict earlier decisions, two that are refinements and must not be flagged, and five normal ones with known actions, including two from WhatsApp. Run them through the real pipeline and show precision and recall for action extraction and conflict detection, which path ran, agent or fallback, and the failures. Then run it and tighten the prompts until the refinements stop getting flagged — but don't change the labels."
16. "Small one: on every confirmed decision and objection add a 'Share to WhatsApp' button that opens a wa dot me link with the text filled in, so I just tap send."
17. "Add voice Q&A over memory: a box where I can ask 'what did we decide about pricing?' and it answers with the timeline of decisions on that topic, with quotes and dates, using search_memory."
18. "Add a Decision debt score in the masthead: the share of decisions in the last seven days that were contradicted without anyone giving a verdict, shown as a little gauge with last week's number for comparison, and clicking it lists them."
19. "Design pass. Go through every page: empty states, loading states that say things like 'checking the record', stamps animating in slightly, good spacing at laptop size, and a decent layout on a phone. Keep the newspaper feel."
10b. "Now a live meeting mode. Make a page at slash live that uses the browser Web Speech API in Chrome, continuous with interim results, English India. Show interim text in grey and final sentences with a speaker chip I can tap to switch between me and Guest, plus a timer. Every ten seconds or every two new final sentences, debounced and never more than one request at a time, post just the new lines to api slash live-check. On the server, first skip the chunk without calling Gemini if it has no decision-like words like deadline, team, submit, video, deploy, must, let's, decided, by a time, or numbers. Otherwise make one Gemini call that extracts candidate decisions with a topic key and compares each against the stored active decisions for those keys, which you pass in the prompt with their quotes, speakers and timestamps, using the same refinement rule. Return contradicts, refines or new. For contradicts, pop a red OBJECTION! card live with the earlier quote, the speaker, the meeting and the timestamp versus the new line; refinements get a small grey not-flagged chip. Use the cached responses on a 429. Add an End meeting button that saves the transcript as meeting 2 and runs the normal extraction and agent into the confirmation tray. If the mic doesn't work, show a paste-transcript fallback. Test it with the meeting 2 lines in the plan."
20. "Write a README with what Objection does, the seven must-builds mapped to features, the architecture, how the agent loop and fallback work, how to run it, the demo login, the live meeting mode with a note that it uses the browser's speech recognition, not Wispr, and a section on how I built it entirely by voice with Wispr Flow. Redeploy, then walk through the whole demo on the live URL with me and fix anything broken."
