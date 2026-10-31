# PLAN — Product Space Agentic AI Hackathon, 31 Oct 2026
Written 31 Oct ~2:10 PM IST by Grok Bot (chair) after a 4-round council of Claude Code + Antigravity (agy). Build by Akash's voice only; nothing has been scaffolded.

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
Round 4 added novelty and end-user value: C4 got novelty 6/8 and end-user 7/8 (Claude/agy).
**Noise:** control moved >2 points every round (C1 −5, C2 −2.5, C3 −3.7), so the judges are noisy. Trust the ranking (v-next beat its control every round), not the absolute numbers. Target (>25 avg, no judge <22) **not reached**: Claude stays at 21. Its remaining critique is scope against the clock.
**Must-fixes applied:** R1 conflict engine front and centre (both judges); R2 cut infra bloat (pgvector, multiple trackers) and add LinkedIn (both); R3 real reminders, topic-key drift (both); R4 Vercel free cron is daily-only, so hourly runs go through GitHub Actions, and keep 'Send now' (both). Open (one judge): multi-speaker parsing must stay solid (prompt 4), schedule tightness (cut order in §4).
Process note: rounds 3–4 used fresh sessions and the same prompt for both judges. The compliance, novelty and end-user sections arrived after round 3 had run, so they are in the round-4 prompt only. Raw outputs are in council/round-N.md, and scores are in council/scores.csv.

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

## 2. Product spec — "OBJECTION!" (the meeting agent that argues back)
**One line:** talk for 30 seconds after any call; OBJECTION! turns your ramble into decisions and tasks, and objects — with receipts — when you contradict something the team already decided.

**End user.** Founder / PM / agency lead at a 5–30 person Indian startup with 10+ calls a week (Zoom, Meet, WhatsApp calls). Pain moment: "Wait, didn't we already agree launch is the 15th?" — nobody can find where; or a client call quietly reverses scope and devs build the old spec. Today: Notion/Docs notes, WhatsApp "MoM" messages, Otter/Fireflies summaries nobody rereads. Why switch: it remembers what was *decided*, not what was said, and capture costs 30 seconds of talking.

**Must-build coverage (statement 03):**
| Official must-build | How OBJECTION! does it | Demo-visible? |
|---|---|---|
| Transcript ingestion with speaker attribution | Paste Zoom/Meet/Wispr-Notetaker transcript; parser reads `[mm:ss] Speaker N:` and `Name:` formats; rename speakers once (Speaker 2 → Sakshi) | Yes |
| Extract decisions, actions, owners, deadlines | Gemini structured JSON; every item carries quote + speaker + timestamp citation; relative dates ("Thursday") resolved against meeting date | Yes |
| Conflicts with earlier decisions in memory | Each decision gets a topic key from a fixed taxonomy (~15 keys, new keys must be confirmed); fetch prior decisions with same key → Gemini classifies new / confirms / refines / **contradicts** with reason → red **Objection card**: then-vs-now quotes, who decided, Overrule / Keep old / Flag | **Hero** |
| Tasks in a tracker via integration | GitHub Issues REST (one repo, labels owner:/due:), links shown | Yes |
| Reminders before deadlines | GitHub Actions scheduled workflow (hourly, free) + Vercel daily cron backup → /api/reminders emails (Resend) actions due in 24h, writes Reminder log; "Send now" button | Yes (log) |
| Weekly digest per person | /digest/[person]: what you own, what changed, open objections; "Email this" | Yes |
| Confirmation before posting | Confirmation tray: nothing hits GitHub/email until ticked | Yes |

**Voice-first UX.** Home has one big "Debrief" box that Wispr types into (Fn held). Output shows the cleaned version with **self-corrections struck through** ("30th → 28th") so judges see messy speech → structure. Second input: paste transcript. Voice also for verdicts ("overrule it, Nov 28 stands").

**Design (anti-Claude-UI).** Courtroom ledger / newspaper: paper background (#F4EFE6), ink black, stamp red (#C0392B), serif display (e.g. "Fraunces"/"Playfair"), mono for quotes, rubber-stamp CONFIRMED / OVERRULED marks, vertical **decision spine** timeline with superseded decisions struck through. No purple gradients, no default shadcn cards.

**Wow moment (30 s).** Memory already holds the kickoff ("max team size is 2", "submission 11:59 PM"). Akash holds Fn: *"um so quick debrief, we're three of us now, Rohan's joining, and let's, uh, submit at like midnight—actually 11:45, and Priya owns the video."* → cleaned debrief, 2 actions, and two red **OBJECTION!** stamps: "Kickoff (Sakshi, 30:41) ruled team max = 2" and a refine-not-conflict note on 11:45 vs 11:59. Confirm → GitHub issue opens.

**Proof.** /eval page: 10 labelled snippets (3 real conflicts, 2 refinements that must NOT be flagged, 5 plain) → live precision/recall of extraction and conflict detection. Plus real issue links, reminder log, Wispr word count.

**Cut list.** Slack/Calendar/Linear, live call joining, multi-tenant auth (one demo team; login demo/demo), embeddings/pgvector, mobile layout polish.

**Novelty (honest).** Builds on the temporal-memory idea (Zep/Graphiti, arXiv 2501.13956) and meeting-recap research (Microsoft, PACM HCI 2025); new is conflict-at-capture from speech, objection-with-receipts UX, and a measured false-positive test. See council/research.md.

## 3. Architecture & stack (free, fast)
- **Next.js 15 (App Router) + TypeScript + Tailwind** custom theme → **Vercel** (Hobby, free; cron is daily-only on Hobby, so hourly reminders come from a GitHub Actions schedule).
- **Supabase** free Postgres (tables: meetings, utterances, decisions, actions, objections, reminders_log, people). Neon is the fallback.
- **LLM: Gemini 2.x Flash via Google AI Studio free API key** (Akash's personal Google). JSON mode / responseSchema. Fallback: Claude/OpenAI key if he has one. Model name: check AI Studio at setup.
- **GitHub Issues**: fine-grained PAT scoped to one new public repo `objection-demo-tasks`, stored only as a Vercel env var.
- **Resend** free (send to Akash's own email for the demo).
- Env vars: GEMINI_API_KEY, DATABASE_URL / SUPABASE keys, GITHUB_TOKEN, GITHUB_REPO, RESEND_API_KEY, DEMO_PASSWORD. Never paste keys in chat or commit them.
- Flow: input → /api/debrief (clean + extract, 1 call) → /api/conflicts (topic key lookup → classify, 1 call) → tray → /api/commit (DB + GitHub) ; cron /api/reminders ; pages /, /meetings/[id], /digest/[person], /eval, /login.

## 4. Hour-by-hour (IST) — start once Akash is back (~3:30 PM)
| Time | Do | Done when |
|---|---|---|
| 3:30–3:50 | LinkedIn post 1; create Supabase, AI Studio key, GitHub repo + PAT, Resend; Claude Code new folder | Keys in .env.local |
| 3:50–4:30 | Prompts 1–3: scaffold, theme tokens, schema, login | Themed shell on localhost |
| 4:30–5:30 | Prompts 4–6: transcript parser + debrief extraction + confirmation tray | Paste kickoff → items with citations |
| 5:30–6:00 | Prompts 7–8: GitHub push + first Vercel deploy | Real issue created from prod |
| 6:00–7:15 | Prompts 9–11: topic keys, memory, conflict classifier, Objection card, decision spine | Wow moment works |
| 7:15–7:45 | Dinner; LinkedIn post 2 (Wispr clip + learning) | Posted |
| 7:45–8:45 | Prompts 12–14: reminders cron + log, digest page, self-correction trace | Cron row in log |
| 8:45–9:45 | Prompts 15–16: eval page + seed data (3 earlier meetings) | P/R numbers live |
| 9:45–10:30 | Prompts 17–19: design polish, empty states, voice verdicts, README | Looks non-generic |
| 10:30–11:00 | Record 2–3 min video (script §6), upload to Drive (link sharing) | Link works logged-out |
| 11:00–11:30 | Wispr usage screenshot (real), fill form, submit; buffer | Submitted ≤11:30 |
| 1 Nov | LinkedIn post 3 + submit post links by 11:59 PM | — |
If behind at 7:15: drop voice verdicts and digest email (keep digest page). Never drop: Objection card, tray, GitHub, deploy.

## 5. LinkedIn posts (drafts — Akash posts them himself)
**Post 1 (now, after kickoff):**
"Today I'm building an AI product without typing a single prompt. 🎙️
I'm at the #AgenticAI Hackathon by @Product Space x @Wispr Flow, and I'm taking on the Meeting-to-Execution problem.
Why? Because the costliest bug in a startup isn't in the code — it's the decision everyone forgot. 'Didn't we agree launch was the 15th?' 
So I'm building OBJECTION! — you talk for 30 seconds after a call, it turns that into tasks, and it *objects* when you contradict something your team already decided, with the receipts.
Every line will be dictated with Wispr Flow into Claude Code. 10 hours. Let's see. 👇 What's a decision your team lost?"

**Post 2 (while building, with 20–30 s screen clip of Wispr dictating into Claude Code + the first red Objection card):**
"5 hours in, ~X,XXX words spoken, 0 typed. 
What I've learned: speaking prompts makes me explain *why*, not just *what* — and the AI's output got noticeably better. 
Also: real speech is messy. 'Submit at midnight — actually 11:45' broke my first version. Now the app shows your self-corrections struck through. 
Clip below: my own hackathon kickoff call is the app's memory, and it just objected to me. @Product Space @Wispr Flow #BuildWithVoice"

**Post 3 (by 1 Nov, demo video):**
"Built in one day, entirely by voice: OBJECTION! 🔨
→ 30-second spoken debrief → decisions, owners, deadlines with quotes
→ cross-meeting memory that flags contradictions (measured: P/R on my eval set = __/__)
→ confirm, then tasks land in GitHub; reminders + weekly digest per person
Wispr Flow count for the day: __ words. Biggest takeaway: when you speak, you think out loud — and AI builds what you meant, not what you typed.
Try it: <url> (demo/demo). Thanks @Product Space @Wispr Flow. What should it object to next?"

## 6. Demo video script (2:30, screen + voiceover)
0:00–0:15 Hook: "Every team loses decisions. Last week we agreed the launch date; today someone quietly moved it. This is OBJECTION!, the meeting agent that argues back — and I built it entirely by voice."
0:15–0:35 Memory: show decision spine with the real kickoff call ingested (speakers attributed, quotes + timestamps).
0:35–1:10 Wow: hold Fn, speak the messy debrief live. Cleaned text with struck self-corrections → actions → red OBJECTION! "Kickoff ruled max team = 2". Click Keep old / Overrule.
1:10–1:30 Confirmation tray → Confirm → GitHub issue opens with source quote.
1:30–1:50 Reminder log (cron-sent) + Priya's weekly digest.
1:50–2:10 Eval page: precision/recall, incl. refinements correctly NOT flagged. "It's not a summarizer: it's memory plus judgement."
2:10–2:30 How built: Wispr word count, clip of dictating to Claude Code. Stack in one line. Close: "Talk for 30 seconds. Never lose a decision again."

## 7. Spoken prompts (dictate via Wispr into Claude Code, in order)
1. "Okay, so we're starting a brand new project called Objection. It's a Next.js 15 app with the App Router, TypeScript and Tailwind, and it'll deploy on Vercel. Set up the project in this folder, add a dot env example file with GEMINI_API_KEY, DATABASE_URL, GITHUB_TOKEN, GITHUB_REPO, RESEND_API_KEY and DEMO_PASSWORD, and don't put any real keys in the code. Run it once to make sure it starts."
2. "Now the look. I really don't want this to look like a default AI app — no purple gradients, no generic cards. Make it feel like a courtroom ledger or an old newspaper: warm paper background, ink black text, one stamp red accent, a serif display font like Fraunces for headings and a mono font for quotes. Put these in a small design tokens file and in the Tailwind config, and build a layout with a masthead that says OBJECTION! and a tagline, 'the meeting agent that argues back.'"
3. "Add a really simple login: one password from the DEMO_PASSWORD env var, username demo, set a cookie, and protect every page except the login page and the cron route. Then set up the database with Supabase Postgres — tables for meetings, utterances with speaker and timestamp, decisions with topic key, quote, speaker, timestamp and a status like active or superseded, actions with owner, due date and status, objections, people, and a reminders log. Give me the SQL as a migration file and a db helper."
4. "Next, transcript ingestion. I'll paste transcripts that look like this: square bracket minutes colon seconds, then Speaker 1 colon, then the text — or just Name colon text. Write a parser that turns that into utterances with speaker and time, and a screen where after pasting I can rename speakers, like Speaker 2 is Sakshi. Add the meeting date field too. Test the parser with a couple of lines from the kickoff transcript."
5. "Now the main AI step. Make an API route that takes either a transcript or a messy spoken debrief, plus the meeting date, and calls Gemini with a strict JSON schema. It should return a cleaned version of the text where self-corrections are kept as pairs — what I said first and what I corrected it to — and a list of decisions and action items, each with owner, deadline resolved to an actual date, the exact quote, the speaker and the timestamp. If the model can't find a quote in the original text, drop that item. Also pick a topic key for each decision from a fixed list I'll give: launch-date, deadline, team-size, pricing, scope, owner, budget, tech-stack, design, hiring, submission, tooling, meeting-cadence, client, other — and if none fits, propose a new one and mark it as needing confirmation."
6. "Build the Debrief screen. One big text box that's the hero of the page — it's where Wispr Flow types — with a hint like 'hold Fn and just talk.' When I submit, show the cleaned text with my self-corrections struck through and the corrected version next to it, then a Confirmation tray listing every decision and action with checkboxes. Nothing gets saved or posted until I tick and hit Confirm."
7. "Hook up GitHub. When I confirm, save everything to the database and create a GitHub issue for each ticked action in the repo from GITHUB_REPO, with labels for the owner and due date and the source quote and meeting in the body. Show the issue links with a stamped 'FILED' mark. Handle errors nicely if the token's wrong."
8. "Let's deploy now. Walk me through pushing this to a new GitHub repo and deploying to Vercel, and tell me exactly which env vars to add in the Vercel dashboard. Then I'll test creating an issue from the live site."
9. "Now the part that makes this special: memory and conflicts. After extraction, for each new decision, look up earlier active decisions with the same topic key, max twenty, and send them with the new one to Gemini to classify it as new, confirms, refines or contradicts, with a one-line reason. Be strict — a refinement or a more specific date is not a contradiction, and different events aren't contradictions either."
10. "When something contradicts, show a big red Objection card in the tray — a stamp that says OBJECTION! — with a then versus now layout: the earlier quote, who said it, which meeting and when, and the new quote. Give three buttons: Overrule, which marks the old decision superseded; Keep old, which drops the new one; and Flag for discussion. Store the verdict."
11. "Make the home page a decision spine: a vertical timeline of every decision grouped by topic, newest on top, superseded ones struck through with an OVERRULED stamp and a link to what replaced them, and clicking one shows its quote and meeting."
12. "Reminders. Add a cron route at api slash reminders, protected by a CRON_SECRET, that finds open actions due in the next 24 hours that haven't been reminded, emails the owner using Resend — for the demo send everything to my email from an env var — and writes a row to the reminders log. Vercel's free plan only runs cron once a day, so add a daily cron in vercel dot json, and also a GitHub Actions workflow on a schedule every hour that calls the route with the secret. Add a Reminder log page, and a 'send now' button that runs the same function."
13. "Weekly digest per person: a page at digest slash the person's name that shows what they own and when it's due, what changed this week — new and overruled decisions — and any open objections that involve them, written as a short friendly summary by Gemini on top, and an 'Email this digest' button."
14. "Seed data. Write a seed script that loads the real kickoff transcript I'll paste into a file, from today, 31 October, with Speaker 2 as Sakshi, plus three short fake earlier team meetings from last week with a launch date, a pricing decision and an owner, so there's history to object to. Make it safe to run twice."
15. "Now an eval page so I can prove it works. Create ten small labelled test snippets: three that really contradict earlier decisions, two that are refinements and must not be flagged, and five normal ones with known action items. Run them through the same pipeline and show precision and recall for action extraction and for conflict detection, plus which ones failed and why."
16. "Run the eval, show me the failures, and let's tighten the prompts until the refinement cases stop getting flagged. Don't change the test labels to make it pass."
17. "Design pass. Go through every page and make it feel finished: empty states, loading states that say things like 'checking the record,' the stamps animating in slightly, good spacing, and make sure it looks right at laptop size. Keep the newspaper feel, no generic dashboard look."
18. "Let me say my verdict by voice too: in the objection card add a small box where I can type or dictate something like 'overrule it, the twenty-eighth stands' and Gemini maps it to one of the three buttons and asks me to confirm."
19. "Write a README with what Objection does, the must-build list mapped to features, the architecture, how to run it, the demo login, and a section on how I built it entirely by voice with Wispr Flow. Then redeploy and run through the whole demo flow on the live URL with me and fix anything broken."
