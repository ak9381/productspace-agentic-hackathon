# Council round 4

## Scores

| Candidate | Claude /30 | agy /30 | Avg /30 | Claude /100 | agy /100 | Avg /100 |
|---|---|---|---|---|---|---|
| C3 | 19 | 20 | 19.5 | 75 | 82 | 78.5 |
| C4 | 21 | 25 | 23.0 | 82 | 91 | 86.5 |

## Prompt (identical to both judges, fresh session)

````
You are a harsh 3-persona judging council: (a) the TARGET USER of the product, (b) a seed-stage VC in India, (c) an experienced operator/PM who has shipped hackathon winners. Do not use tools or read files; answer from this prompt only. Be blunt.

EVENT: Product Space x Wispr Flow "Agentic AI Hackathon", online, India, Sat 31 Oct 2026. ~500 participants. Build starts ~1:30 PM IST, submission closes 11:59 PM IST today (~9.5 hours left). Builder: Akash, SOLO, competent developer, builds entirely by DICTATING prompts via Wispr Flow (voice-to-text) into Claude Code / Antigravity. Stack must deploy free and fast (e.g. Next.js on Vercel, or Render) with an LLM API (Gemini/Claude/OpenAI). Submission: deployed URL + test login, 2–3 min voiceover video, Wispr words-spoken screenshot. Must pick one of 5 official statements; no old projects.
RULE: the product's main input must be natural speech captured via Wispr Flow (Wispr types into the app's text box; the agent must turn fillers, digressions, self-corrections into clean structured output).
OFFICIAL RUBRIC /100: Wispr Flow usage (how voice was used to build AND use the product) 20; Prototype quality & UX 20 (judges said they are BORED of generic Claude-looking UIs); AI integration 20 (must be genuinely useful, not a chat box bolted on); Problem understanding 15 (cover the official must-build list); LinkedIn content & engagement 15; Innovation & creativity 10 (beyond one-prompt-one-response).
KILL RULES: not demoable live by deadline, no measurable proof it works, depends on blocked/paid-gated tools. Anything not buildable by 11:59 PM is PLAN and gets no credit.
Also judge "does each module actually help?" — feature bloat on paper is not rewarded.

ROUND 4 — score each candidate below (one is a control from an earlier round; score it on its own merits, independently).

OFFICIAL STATEMENT 03 must-build: transcript ingestion with speaker attribution; extraction of decisions, action items, owners, deadlines; detection of conflicts with earlier decisions stored in memory; creation of tasks in a tracker through an integration; reminders before deadlines; weekly digest per person; a confirmation step before anything gets posted. "Cross-meeting memory and conflict detection are what make this a real system rather than a transcript summarizer."


END-USER PERSPECTIVE (for C3/C4): Who: founder/PM/agency lead at a 5–30 person Indian startup running 10+ calls a week across Zoom/Meet/WhatsApp calls. Moment of pain: Thursday standup, someone says "wait, didn't we already agree the launch was the 15th?" and nobody can find where, or a client call quietly reverses a scope decision and the dev team builds the old spec. Today: scattered Google Docs/Notion notes, WhatsApp 'MoM' messages, Otter/Fireflies summaries nobody re-reads, memory. Why switch: it's the only tool that remembers what you DECIDED (not what was said) and interrupts you when you contradict it, and capture costs 30 seconds of talking right after the call.

COMPLIANCE vs SUBMISSION GUIDELINES (chair's check, judges please verify):
| Check | C3/C4 | A Media | B Tutor | D Finance | E Career |
| Voice-first main input | Yes: Debrief box via Wispr is the hero | Weak (URL/upload) | Yes (spoken reasoning) | Weak (CSV/PDF) | Partial (mock interview) |
| Deployable free by 11:59 PM | Yes (Vercel+Supabase+Gemini) | Risky (video) | Yes but 7 subsystems | Risky (PDF parsing) | Risky (JD scraping) |
| Test credentials | demo/demo | - | - | - | - |
| 2–3 min video shows value | Yes, 30s wow | Weak w/o video cutting | Yes | Partial | Partial |
| Brand-new (no old project) | Yes; Akash's past domain is fitness, unrelated | Yes | Yes | Yes | Yes |
| Non-generic UI | Courtroom-ledger theme | - | - | - | - |
| AI genuinely useful (not chat box) | Yes: memory + contradiction verdicts | Yes | Yes | Yes | Partial |

NOVELTY / PRIOR ART: meeting summary + action items is done (Microsoft "Summaries, Highlights, and Action Items", PACM HCI 2025; Otter/Fireflies/Granola). Temporal memory that invalidates contradicted facts exists as infra (Zep/Graphiti, arXiv 2501.13956) and an OSS dev tool "verbatim" does extraction+reconciliation+push to GitHub. LLM disfluency removal is known (STIL 2024). What is NOT common: conflict raised at capture time from a spoken 30-second debrief, framed as an "Objection" with both quotes and a human verdict, plus a live precision/recall panel with refinement-not-conflict false-positive tests.

CONTROL C3. "OBJECTION!" v3 — same product as C2, de-risked and with distribution built in. Changes vs C2: (1) NO pgvector/embeddings: each decision gets an LLM-normalised topic key (e.g. "launch-date", "team-size") + entity; conflict check = fetch prior decisions with same/near key (SQL ILIKE + Gemini picks matches from max 20 candidates) then Gemini judges contradiction vs refinement and explains why, with both quotes. (2) Storage: Supabase free Postgres (or Neon), 4 tables: meetings, decisions, actions, people. (3) Tracker: GitHub Issues ONLY (real API, labels for owner/due, issue links rendered). (4) Reminders: a "Due soon" rail + "Send reminder now" button (Resend email) for the live demo, plus a single Vercel Cron route that calls the same function daily. (5) Weekly digest = a per-person page (/digest/priya) and the same content emailed on click. (6) LinkedIn engine: every Objection card has "Share as image" (html-to-image PNG in the courtroom style) — Akash's 3 posts use these cards plus a time-lapse of building by voice and the Wispr word count; post 1 goes out at 2 PM. (7) Build order fixed: spine first (paste transcript → extract → confirmation tray → GitHub issue) by 5 PM; conflict + seeded memory by 7 PM; Debrief voice box + eval panel by 9 PM; theme polish, digest, reminders, video by 11:30 PM. Theme is applied from hour 1 via a tiny design token file (serif display font, paper background, ink red stamp), not saved for last. (8) Eval panel: 10 labelled snippets incl. 3 deliberate conflicts, 2 refinements that are NOT conflicts (false-positive test), shows precision/recall computed live. Everything else as C2.

C4. "OBJECTION!" v4 — C3 plus these fixes: (1) REAL reminders: Vercel Cron hourly hits /api/reminders, which emails (Resend) every open action due within 24h that has not been reminded, and writes a row to a visible "Reminder log" (time sent, owner, task); demo seeds one action due tomorrow so the log shows a genuine cron-sent reminder before recording, plus the "Send now" button. (2) Topic-key drift fix: a fixed seed taxonomy of ~15 topic keys (launch-date, pricing, scope, owner, budget, team-size, tech-stack, deadline, hiring, design, ...) is passed into the extraction prompt; the model must pick one or propose a new key which the user confirms in the confirmation tray (so keys never drift silently). (3) "You corrected yourself" trace: the cleaned debrief shows struck-through self-corrections ("30th → 28th") so judges see messy speech becoming structure. (4) Schedule: digest page + reminders moved to 6–7:30 PM (before the eval panel), video recorded 10:30 PM, buffer 11–11:30 PM. (5) Proof in the README and video: eval panel numbers + Wispr word count + real GitHub issue links + reminder log. Everything else as C3.


For EACH candidate: User /10, Investor /10, Business /10, Total /30; Hackathon /100 broken down by the official rubric (20/20/20/15/15/10); feasibility solo in remaining time (1-10); Indian demo appeal (1-10); top 3 risks; biggest weakness; one change that would raise the /30 most. Explicitly list any must-build items from the official statement that are missing or only faked. Say which modules do NOT help and should be cut. ALSO score each candidate 1-10 on NOVELTY (vs the prior art given) and 1-10 on END-USER VALUE (would the described user switch?), and verify or dispute the compliance table. Then a ranking table and your concrete critique of the build plan and stack.
END WITH a fenced ```json block: {"scores":[{"candidate":"ID","user":n,"investor":n,"business":n,"total30":n,"hack100":n,"feasibility":n,"india_appeal":n,"novelty":n,"enduser":n,"weakness":"..."}]}

````

## Raw answer: claude

# COUNCIL — ROUND 4

Two candidates: **C3** (control, "OBJECTION!" v3) and **C4** ("OBJECTION!" v4 = C3 + fixes). I'll score each independently, then rank.

A blunt framing up front: these are the same product. C4 is C3 with the three holes that would get you knifed in rubric closed. So the interesting question isn't "is this good" — it's "do C4's fixes actually move points, or are they polish?" My answer: two of them move real points, one is cosmetic.

---

## CONTROL C3 — "OBJECTION!" v3

### Panel scores
- **User /10 — 7.** The target user (Indian founder/PM, 10+ calls/week) genuinely has this pain and C3 addresses the *right* one: "what did we DECIDE," not "what was said." The 30-second debrief is a believable habit. Loses points because reminders are a fake ("Send reminder now" button + a cron route that exists but isn't proven to fire), and that's the feature that creates the daily retention loop. Capture + objection is a wow; without a reminder they trust, they won't switch off WhatsApp MoM.
- **Investor /10 — 6.** Seed VC in India: the wedge is sharp and the "memory of decisions + interrupts you" positioning is a real story. But prior art is thick (Otter/Fireflies/Granola + Zep/Graphiti + "verbatim"), the moat is a prompt, and "paste a transcript then also re-narrate it by voice" is a workflow tax a VC will poke immediately. Fundable-sounding, not yet defensible.
- **Business /10 — 6.** Clear buyer, clear pain, cheap to run. But the capture step competes with zero-effort incumbents (Fireflies auto-joins the call). Asking a human to talk for 30s after every call is friction that the demo hides and the market won't.

**Total /30 = 19.**

### Hackathon /100 (official rubric)
- **Wispr Flow usage /20 → 15.** Used to build (time-lapse + word count) AND to use (Debrief box is the hero input). Strong. Not 18+ because C3 doesn't *show* the messy-speech→structure transformation on screen — it's claimed, not demonstrated. Judges score what they see.
- **Prototype quality & UX /20 → 15.** Courtroom-ledger theme applied from hour 1 is exactly the right answer to "bored of generic Claude UIs," and the "Objection" card is a genuine UX object. Risk: solo-by-voice theming can land as a janky skin. 15 assumes it reads as intentional.
- **AI integration /20 → 16.** Conflict-vs-refinement judgment with both quotes + a human verdict is real, non-trivial AI that isn't a chat box. The live precision/recall panel with false-positive tests is the single best credibility move in this whole bracket — most hackathon teams show zero eval.
- **Problem understanding /15 → 11.** Covers most of Statement 03, but see missing/faked list below — reminders and weekly digest are thin, and that costs here because the statement explicitly names them.
- **LinkedIn content & engagement /15 → 11.** "Share as image" courtroom cards + time-lapse + word count is a *better than average* content engine, and post 1 at 2 PM is disciplined. But 15% of the grade is engagement, which is outside your control and can't be manufactured in 9 hours. Realistic 10-12.
- **Innovation & creativity /10 → 7.** "Conflict at capture time, framed as an Objection, with a human verdict" is a legitimately novel *framing* beyond one-prompt-one-response. Capped because the underlying mechanism (temporal contradiction detection) exists as infra.

**Hack /100 ≈ 75.**

### Feasibility solo (voice, ~9.5h) — **8.**
The build order is the best thing here. Spine by 5 PM, conflict by 7 PM, voice+eval by 9 PM, polish by 11:30 — that's a real plan with a shippable product at every checkpoint. Dropping pgvector for ILIKE+Gemini-picks-from-20 is exactly the right de-risk. The one soft spot: 11:30 PM video with zero buffer is where solo builds die.

### Indian demo appeal — **8.** The Thursday-standup/"didn't we agree the 15th?" moment is viscerally real for this audience, and WhatsApp-MoM pain is India-specific.

### Novelty — **6.** Framing is fresh; mechanism is not. The eval panel + false-positive test is the novel contribution judges will remember.
### End-user value — **6.** Would switch *if* they adopt the capture habit AND trust reminders. C3's reminders aren't trustworthy, so realistically they'd use it as a decision-search tool, not a daily driver.

### Must-build audit (Statement 03) — C3
- Transcript ingestion + speaker attribution — ✅ (paste transcript).
- Decisions/action items/owners/deadlines extraction — ✅.
- Conflict detection vs memory — ✅, the hero.
- Tasks in a tracker via integration — ✅ GitHub Issues, real API. Legit.
- **Reminders before deadlines — ⚠️ FAKED.** Button + an unproven cron route. No evidence it fires. This is a KILL-RULE-adjacent "no measurable proof it works."
- **Weekly digest per person — ⚠️ THIN.** A /digest/priya page + email-on-click exists but isn't shown to be scheduled or aggregating across meetings. Half-credit.
- Confirmation step before posting — ✅ confirmation tray. Good.

### Modules that don't help / cut
- **Resend "Send reminder now" button as the reminder story** — it's theater. Either make it real (C4 does) or cut the pretense and call it a notification.
- **Nothing else should be cut** — C3 is already lean. The eval panel looks like scope but it's your highest-ROI credibility module; keep it.

### Biggest weakness
Reminders and digest — the two features that create *daily* value and that Statement 03 explicitly demands — are the weakest, while effort pours into the (excellent) conflict engine. You nail the wow and fumble the retention loop, and the rubric notices.

### One change that raises /30 most
Make reminders real and visible (a logged, cron-fired email). That's +1 user, +1 business → **+2**. This is literally C4's fix #1.

---

## C4 — "OBJECTION!" v4

C3 plus: (1) real cron-fired reminders with a visible Reminder Log, (2) fixed seed taxonomy of ~15 topic keys to stop key-drift, (3) struck-through self-correction trace in the cleaned debrief, (4) earlier schedule with a real 11–11:30 buffer, (5) proof surfaced in README + video.

### Panel scores
- **User /10 — 8.** The Reminder Log that shows a genuine cron-sent email before recording converts the fake into a trustworthy daily loop. That's the difference between "neat demo" and "I'd actually run this." +1 over C3.
- **Investor /10 — 6.** Same story, same moat problem. The fixes are execution quality, not defensibility — a VC doesn't re-rate the business because your cron works. Flat vs C3. Honest 6.
- **Business /10 — 7.** Real reminders = real retention mechanic, which is the thing a business actually monetizes. +1.

**Total /30 = 21.**

### Hackathon /100 (official rubric)
- **Wispr Flow usage /20 → 18.** The struck-through self-correction trace ("30th → 28th") is the fix that matters most for *this* rubric line. It's the on-screen proof that Wispr fillers/digressions/self-corrections become clean structure — the exact thing the 20 points reward and the exact thing C3 only claimed. This alone is worth ~+3.
- **Prototype quality & UX /20 → 16.** Same theme; the self-correction trace and reminder log add legible, polished surfaces. +1.
- **AI integration /20 → 17.** The fixed taxonomy is a genuine engineering answer to the real failure mode of C3 (LLM invents a slightly different key each time → ILIKE misses → conflict never fires). This makes the hero feature *actually work* instead of working in the demo and silently failing on the 2nd real meeting. +1, and it's the most important invisible fix.
- **Problem understanding /15 → 13.** Reminders now real + log; digest moved earlier so it's more likely to ship complete. Closes the two soft spots from C3. +2.
- **LinkedIn /15 → 11.** Unchanged — same content engine, same uncontrollable engagement ceiling.
- **Innovation /10 → 7.** Unchanged — fixes are quality, not new ideas.

**Hack /100 ≈ 82.**

### Feasibility solo — **7.** Lower than C3 by one point, and this is the honest catch: C4 adds *more scope* (real cron, taxonomy confirmation UI, strike-through rendering, reminder log) in the *same* 9.5 hours, and buys the buffer by moving digest/reminders to 6–7:30 PM. The 11–11:30 buffer is the right instinct, but hourly cron that "writes a row before recording" has a real failure surface (Vercel cron timing on free tier isn't instant/guaranteed-to-the-minute; seeding an action "due tomorrow" and expecting the hourly job to have fired before 10:30 PM recording is a timing bet). You may end up manually invoking the route and calling it cron — which is fine for the demo but is a risk, not a certainty.

### Indian demo appeal — **8.** Same, slightly better because the reminder log makes the "it actually works" claim concrete.

### Novelty — **6.** Same as C3. Taxonomy + strike-through are good engineering, not new concepts.
### End-user value — **7.** The real reminder + key-drift fix is what tips the user from "search tool" to "would switch." +1 over C3.

### Must-build audit (Statement 03) — C4
- All of C3's ✅ items hold.
- **Reminders — now ✅ REAL** (cron → Resend → logged row), *contingent on the cron actually firing before recording*. If it fires: full credit. If you fake the row: back to ⚠️. Judges can't easily tell, but the KILL rule says "measurable proof" — the log IS the proof, so make it genuine.
- **Weekly digest — ✅-ish**, moved earlier so more likely complete; still verify it aggregates across ≥2 meetings, not just renders one.
- Everything else ✅.

**C4 has no outright-missing must-builds** if the cron fires. That's the main compliance difference from C3.

### Modules that don't help / cut
- **Taxonomy "propose a new key which the user confirms"** — keep the fixed 15 keys, but the *propose-new-key-and-confirm-in-tray* branch is scope you probably won't need in a demo and it complicates the confirmation UI under time pressure. Ship fixed-15 + "other," defer the propose-and-confirm flow. Cutting it de-risks your 7 feasibility back toward 8 with no rubric loss.
- **Hourly cron** — hourly is overkill and raises the timing-bet risk. A daily cron + the visible "Send now" that also writes the log row gives you the same proof with less that can go wrong. Don't let "real cron" become the thing that eats your buffer.

### Biggest weakness
Scope creep against a fixed clock. C4 is *correct* about what to fix but adds four things and funds the buffer by compressing the middle. The reminder-log-via-hourly-cron is the specific place where "make it real" risks colliding with "must be demoable by 11:59." The feature that proves honesty could be the feature that isn't ready.

### One change that raises /30 most
Guarantee the reminder proof without betting on cron timing: make the "Send now" button write the same reminder-log row via the *same* function the cron calls, and in the video narrate "this is the exact function Vercel Cron runs daily — here it is firing." You get the honesty + proof (+1 user, +1 business) **without** the timing risk. **+2**, and it de-risks feasibility.

---

## Compliance table — verified / disputed

| Check | My verdict |
|---|---|
| Voice-first main input (C3/C4: Debrief box) | **Verified.** Legitimately the hero input. Strongest in the field. |
| Deployable free by 11:59 (Vercel+Supabase+Gemini) | **Verified** for C3. **Disputed for C4** only on the *hourly-cron-fires-before-recording* assumption — deployable yes, but the "genuine cron-sent reminder in the log before recording" is a timing bet, not a guarantee. Fix per above. |
| Test credentials demo/demo | **Verified**, and C3/C4 are the ONLY candidates with any. Big edge. |
| 2–3 min video shows value (30s wow) | **Verified.** The Objection card is a genuine 30s wow. C4's strike-through trace makes the Wispr story land in-video, which the others lack. |
| Brand-new (fitness past, unrelated) | **Verified.** |
| Non-generic UI (courtroom-ledger) | **Verified in intent**, unproven in execution — risk that solo-voice theming reads as a skin, not a system. Applying tokens from hour 1 is the right hedge. |
| AI genuinely useful (memory + contradiction verdicts) | **Verified.** This is the clearest "not a chat box" in the bracket, and the eval panel is proof few others will have. |

One quibble with the table's framing: it lists C3/C4's reminders implicitly as fine. They are **not** equivalent — C3's reminder is faked, C4's is the fix. The table should distinguish them.

---

## RANKING

| Rank | Candidate | /30 | Hack/100 | Feasible | Novelty | End-user | One-line |
|---|---|---|---|---|---|---|
| 1 | **C4** | 21 | 82 | 7 | 6 | 7 | Closes the two faked must-builds; wins on the Wispr-proof trace. Watch scope. |
| 2 | **C3** | 19 | 75 | 8 | 6 | 6 | Cleaner plan, safer clock, but reminders faked and the messy-speech→structure story is told not shown. |

**C4 wins** — not because it's a better *idea* (identical) but because its three fixes map precisely onto the two rubric lines that C3 leaves on the table (Wispr Flow usage via the on-screen correction trace; Problem-understanding via real reminders) and onto the feature that silently breaks in C3 (key drift). The gap is ~7 hack points, which at ~500 participants is the difference between top-10 and top-3.

But C4's feasibility is genuinely lower, and that's not a rounding error — if the cron/taxonomy additions blow the clock, C4 *degrades into C3-minus-buffer*. So the real recommendation is **C4 with two cuts**: ship fixed-15 taxonomy + "other" (drop propose-and-confirm), and prove reminders via the shared function the cron calls rather than betting on hourly cron timing. That's C4's score with C3's safety.

---

## Critique of the build plan & stack

**What's right.** The hour-by-hour spine-first order is the single best decision in this bracket and the reason this is a demo, not a plan. Dropping pgvector for ILIKE + Gemini-picks-from-20 is correct — embeddings were never the hard part; *judging contradiction vs refinement* is, and you kept that. Theme-from-hour-1 via a token file is exactly how you avoid the "ran out of time to style it" death. GitHub Issues as the only tracker (real API, no paid gate) dodges a KILL rule cleanly. Having demo/demo credentials when nobody else does is free compliance points.

**What's fragile.**
1. **The eval panel's precision/recall is computed on *your own* 10 labelled snippets.** Judges may read that as grading your own homework. Mitigate: say so explicitly in the video ("these are 10 hand-labelled cases including 2 refinement false-positive traps"), and show one *live, unlabelled* conflict from the pasted transcript so it's not purely canned. The false-positive traps are your credibility — lead with them.
2. **The capture workflow has a logical seam:** paste a transcript AND re-narrate a 30s debrief by voice is two inputs for one meeting. For the *rubric* it's fine (voice is clearly the hero). For the *product* it's a tax. In the video, resolve it: the transcript is "the raw meeting," the debrief is "the human saying what actually got decided" — frame the debrief as the irreplaceable human-judgment layer, not a second transcription. That turns a seam into the pitch.
3. **Cron on Vercel free tier** (C4): daily is fine and documented; hourly-and-fires-before-10:30PM-recording is where you're trusting a scheduler you don't control. Route the proof through the shared function + "Send now" so the log row is deterministic.
4. **11:30 PM video (C3) / 10:30 PM (C4).** C4 is right to pull it earlier. For a solo voice build, video is where it all slips — record a rough cut by 9:30 as insurance, polish if time remains. A deployed-but-unrecorded product scores like a plan.

**Stack verdict.** Next.js on Vercel + Supabase/Neon Postgres + Gemini + Resend + GitHub Issues is the correct free-and-fast stack and has no paid gate that triggers a KILL rule. Gemini for the conflict judgment is fine; the one thing I'd pin is a **low-temperature, structured-output** call for extraction and a separate judgment call for conflict-vs-refinement — don't do both in one prompt, or the key-drift C4 worries about will be the least of it. Keep the two concerns separate and the whole system gets more legible, which the eval panel will reward.

```json
{"scores":[{"candidate":"C3","user":7,"investor":6,"business":6,"total30":19,"hack100":75,"feasibility":8,"india_appeal":8,"novelty":6,"enduser":6,"weakness":"Reminders faked and weekly digest thin — the two retention features Statement 03 demands are weakest, and the messy-speech-to-structure transformation is claimed but never shown on screen."},{"candidate":"C4","user":8,"investor":6,"business":7,"total30":21,"hack100":82,"feasibility":7,"india_appeal":8,"novelty":6,"enduser":7,"weakness":"Scope creep against a fixed clock: adds real cron, taxonomy-confirm UI, and strike-through trace while funding the buffer by compressing the middle; the hourly-cron reminder-log proof is a timing bet that could collide with the 11:59 deadline — route it through the shared 'Send now' function instead."}]}
```

## Raw answer: agy

### The Judging Council

*   **The Target User (Founder/PM at a 20-person Bengaluru Startup):** *"I live in WhatsApp chaos and messy Google Meet calls. If your tool adds another manual dashboard I have to maintain, I’m out. I want you to catch my co-founder quietly moving a launch date without telling engineering."*
*   **The Seed-Stage Indian VC:** *"Meeting summarizers are a dime a dozen; Granola and Otter own transcription. I want defensibility, enterprise pain, and zero API-budget burning. Show me workflow lock-in, not an academic paper disguised as a SaaS app."*
*   **The Operator / PM (Hackathon Winner):** *"It’s 1:56 PM. You have 10 hours left, solo, dictating via voice. Any feature that requires custom canvas rendering, unseeded cron jobs, or 5-table joins is a death wish. If it’s not recordable by 10:30 PM, it doesn't exist."*

---

### Candidate Evaluation: Control C3 ("OBJECTION!" v3)

#### 1. Scores & Metrics
*   **Target User:** `7/10`
*   **Indian VC:** `7/10`
*   **Operator / PM:** `6/10`
*   **Total Score:** **`20/30`**
*   **Official Hackathon Rubric (`82/100`):**
    *   Wispr Flow usage (20): `16/20` *(Voice debrief is front-and-center, but lacks visible visual proof of messy-speech-to-structured-data translation).*
    *   Prototype quality & UX (20): `17/20` *(Courtroom ledger theme breaks judge fatigue, but risky last-minute styling).*
    *   AI integration (20): `17/20` *(Two-stage LLM topic retrieval + conflict judge is pragmatic; avoids vector DB bloat).*
    *   Problem understanding (15): `12/15` *(Risks neglecting multi-speaker transcript ingestion in favor of the solo debrief).*
    *   LinkedIn content & engagement (15): `12/15` *(Planned posts, but `html-to-image` client rendering is a classic hackathon time-sink).*
    *   Innovation & creativity (10): `8/10` *(Metaphor of legal "Objections" with conflicting quotes is punchy).*
*   **Feasibility Solo (1-10):** `6/10` *(Backloading theme polish, digest, reminders, and video into the final 2.5 hours is a recipe for a missed deadline).*
*   **Indian Demo Appeal (1-10):** `8/10` *(Hits the relatable "client promised X on WhatsApp, dev team built Y" pain).*
*   **Novelty vs Prior Art (1-10):** `7/10` *(Decouples from generic summarizers by making conflict detection synchronous at capture).*
*   **End-User Value (1-10):** `7/10` *(Would switch if it saves Thursday sync arguments, but relies heavily on user discipline to debrief).*

#### 2. Deep Dive: Risks, Weaknesses & Must-Build Compliance
*   **Top 3 Risks:**
    1.  *Late-Night Collapse:* Scheduling theme, digest, reminders, and video recording after 9:00 PM means any bug in Supabase or Resend will kill the video submission.
    2.  *Topic-Key Drift Failure:* Unconstrained LLM-generated topic keys (`launch-date` vs `release_timeline` vs `go-live`) will fail SQL `ILIKE` matches completely, yielding false negatives on conflicts.
    3.  *Client-Side Rendering Glitches:* Using `html-to-image` on custom serif fonts on Vercel frequently produces blank or broken PNGs on mobile browsers.
*   **Biggest Weakness:** The 9:00 PM to 11:30 PM crunch. Leaving four core deliverables (theme polish, weekly digest, email reminders, demo video) to the final 150 minutes while coding via voice dictation is fatal.
*   **One Change to Raise /30:** Drop `html-to-image` entirely and constrain topic keys to a predefined enum inside the extraction prompt so conflict lookup is deterministic.
*   **Must-Build Audit (Official Statement 03):**
    *   *Transcript ingestion with speaker attribution:* **PARTIAL / AT RISK.** The focus is almost purely on the 30-second solo debrief box. A raw multi-speaker transcript paste parser is mentioned in the spine but risks being completely undercooked.
    *   *Weekly digest & Reminders:* Present, but reliant on "click to email" without visible delivery history.
*   **Modules to CUT (Does not help):**
    *   `html-to-image` card generator: Complete waste of developer time. Take native OS screenshots for LinkedIn.
    *   Interactive precision/recall calculator in the eval panel: Hardcode the test fixtures into a static test report tab. Calculating live precision/recall client-side wastes precious hours.

---

### Candidate Evaluation: C4 ("OBJECTION!" v4)

#### 1. Scores & Metrics
*   **Target User:** `8/10`
*   **Indian VC:** `8/10`
*   **Operator / PM:** `9/10`
*   **Total Score:** **`25/30`**
*   **Official Hackathon Rubric (`91/100`):**
    *   Wispr Flow usage (20): `19/20` *(The strikethrough "You corrected yourself" trace gives visceral, visual evidence of voice-input handling).*
    *   Prototype quality & UX (20): `18/20` *(Courtroom ledger + visible Reminder Log gives an authentic system feel, not a toy chat).*
    *   AI integration (20): `19/20` *(Constrained topic taxonomy guarantees SQL candidate retrieval; conflict vs refinement reasoning is rock solid).*
    *   Problem understanding (15): `14/15` *(Hits every must-build clause with explicit UI proof artifacts).*
    *   LinkedIn content & engagement (15): `13/15` *(High-leverage visuals: diff-strikes and courtroom contradiction cards).*
    *   Innovation & creativity (10): `8/10` *(Self-correction trace turns a voice handicap into a standout UX feature).*
*   **Feasibility Solo (1-10):** `8/10` *(Moving digest and reminders to 6:00 PM and locking video at 10:30 PM creates an essential safety buffer).*
*   **Indian Demo Appeal (1-10):** `9/10` *(Speaks directly to the chaotic reality of Indian startup comms where requirements change mid-sentence).*
*   **Novelty vs Prior Art (1-10):** `8/10` *(The explicit contrast between contradiction and refinement, backed by raw quote diffs, separates this from generic memory layers).*
*   **End-User Value (1-10):** `8/10` *(Immediate high utility: prevents costly sprint re-work caused by forgotten decisions).*

#### 2. Deep Dive: Risks, Weaknesses & Must-Build Compliance
*   **Top 3 Risks:**
    1.  *Vercel Cron Deployment Delays:* Free-tier Vercel Cron routes can take up to an hour to trigger or require custom headers that fail silently on live deployment.
    2.  *Over-indexing on Debrief over Full Transcript:* If judges test the app with a raw 45-minute Otter transcript and the parser expects a clean Wispr dictation, it will crash or truncate.
    3.  *Token Overflows on Gemini Free Tier:* Rapidly firing multi-turn conflict checks and extraction on long historical seed data could hit rate limits during the live demo recording.
*   **Biggest Weakness:** Ingestion handling of messy, multi-speaker Zoom/Meet transcripts. While the Wispr voice debrief is polished, the official statement explicitly mandates *transcript ingestion with speaker attribution*. If pasting a 3-speaker dialogue fails, judges will dock points.
*   **One Change to Raise /30:** Add a one-click "Load Sample Meet Transcript" button next to the debrief box so judges can immediately see speaker attribution (`[00:04:12] Rohan: ...`) without having to manually paste external files.
*   **Must-Build Audit (Official Statement 03):**
    *   *All 7 core items covered:* Transcript ingestion, extraction, conflict detection in cross-meeting memory, GitHub task creation, pre-deadline reminders, weekly digest, and confirmation tray.
    *   *Faked vs Real:* The visible "Reminder Log" bridges the gap between background crons and live demo proof without requiring the judge to wait 24 hours.
*   **Modules to CUT (Does not help):**
    *   User-proposed custom topic keys in confirmation tray: Keep it strictly to the 15 fixed taxonomy keys. Allowing dynamic user-defined keys introduces edge-case UI handling and database fragmentation right before submission.

---

### Compliance Table Verification & Reality Check

| Check | Chair Claim (C3/C4) | Council Reality & Verification Verdict |
| :--- | :--- | :--- |
| **Voice-first main input** | Yes (Debrief box via Wispr is hero) | **VERIFIED.** The "You corrected yourself" trace in C4 transforms this from an ordinary input field into the centerpiece of the product. |
| **Deployable free by 11:59 PM** | Yes (Vercel + Supabase + Gemini) | **DISPUTE / CAVEAT.** Vercel Cron on hobby tier only runs once a day, not hourly! *Fix:* Seed the DB with a pre-executed cron execution row and use the "Send Reminder Now" button for the video demo. |
| **Test credentials** | `demo/demo` | **VERIFIED.** Hardcode an auto-login bypass for `/demo` so judges don't get stuck on Supabase auth magic links. |
| **2–3 min video shows value** | Yes (30s wow) | **VERIFIED.** Hook in first 20s: Spoken debrief -> Strikethrough self-correction -> "OBJECTION! Launch date contradicts Oct 12 pact" -> GitHub issue created. |
| **Brand-new project** | Yes | **VERIFIED.** Distinct from past fitness projects. Clean repo commit history starting after 1:30 PM IST. |
| **Non-generic UI** | Courtroom-ledger theme | **VERIFIED.** Dark charcoal, parchment cream, and ink red stamps stand out instantly from ubiquitous shadcn/radix dashboards. |
| **AI genuinely useful** | Memory + contradiction verdicts | **VERIFIED.** Solves semantic drift and organizational amnesia rather than just regurgitating meeting notes. |

---

### Comparative Ranking Table

| Dimension | Control C3 | Candidate C4 (Winner) |
| :--- | :--- | :--- |
| **User Score (/10)** | 7 | **8** |
| **Investor Score (/10)** | 7 | **8** |
| **Business / Operator Score (/10)** | 6 | **9** |
| **Total Council Score (/30)** | **20** | **25** |
| **Official Rubric (/100)** | 82 | **91** |
| **Feasibility Solo (1-10)** | 6 | **8** |
| **Indian Demo Appeal (1-10)** | 8 | **9** |
| **Novelty (1-10)** | 7 | **8** |
| **End-User Value (1-10)** | 7 | **8** |
| **Execution Safety Margin** | Zero buffer; 11:30 PM panic | **1.5-hour safety buffer; video banked by 10:30 PM** |

---

### Concrete Critique of the Build Plan & Technical Stack

#### 1. The Stack: Traps & Workarounds
*   **Database:** Supabase Postgres free-tier is fine, but **do not use connection pooler strings with Prisma/Drizzle on Vercel Edge** under tight deadlines. Use plain `@supabase/supabase-js` with standard REST calls or simple SQL via `postgres-js`. It saves 45 minutes of serverless connection timeout debugging.
*   **Cron Trap:** Vercel Hobby accounts **do not support hourly crons** (they are restricted to once daily). Do not bet the farm on hourly cron triggers. Trigger `/api/reminders` on page load or via a seeded test button, and display the static "cron execution log" to prove the backend capability.
*   **LLM Choice:** Gemini 1.5 Flash is ideal here for zero cost, massive context, and sub-2-second JSON structured outputs. Set `response_schema` directly in the SDK to eliminate JSON parsing crashes.

#### 2. Schedule Execution Critique (C4)
*   **1:30 PM – 5:00 PM (The Spine):** Must include a tabbed input: Tab 1 = "Wispr Voice Debrief", Tab 2 = "Paste Raw Transcript". Extracting speaker names (`Priya:`, `Akash:`) must work out-of-the-box to satisfy Official Statement 03.
*   **5:00 PM – 7:30 PM (Memory, Taxonomy & Digest):** The 15-key fixed taxonomy is the single best architectural choice in C4. It guarantees SQL `ILIKE` matches without embedding infrastructure. Move the `/digest/[user]` view here.
*   **7:30 PM – 9:00 PM (Objection Engine & Trace):** Implement the strikethrough self-correction visual. It requires a simple LLM diff: `original_transcript` vs `normalized_statement` showing corrected tokens.
*   **9:00 PM – 10:30 PM (Buffer, Verification & Video):** Stop writing code at 10:00 PM. Record the video with a screen recorder, speaking naturally with Wispr Flow. Show real GitHub Issues opening in another tab. 
*   **10:30 PM – 11:59 PM:** Buffer for Vercel deployment cache busting, LinkedIn post publishing, and submission form upload.

---

```json
{
  "scores": [
    {
      "candidate": "C3",
      "user": 7,
      "investor": 7,
      "business": 6,
      "total30": 20,
      "hack100": 82,
      "feasibility": 6,
      "india_appeal": 8,
      "novelty": 7,
      "enduser": 7,
      "weakness": "Backloaded schedule leaves styling, digest, reminders, and video to the final 2.5 hours; open-ended topic keys cause silent SQL search misses."
    },
    {
      "candidate": "C4",
      "user": 8,
      "investor": 8,
      "business": 9,
      "total30": 25,
      "hack100": 91,
      "feasibility": 8,
      "india_appeal": 9,
      "novelty": 8,
      "enduser": 8,
      "weakness": "Relies on Vercel cron which is restricted on free tier, and risks under-indexing on multi-speaker transcript parsing in favor of the solo debrief."
    }
  ]
}
```

## Chair's synthesis (round 4)
- Must-fix from both judges: the reminder cron. Vercel Hobby cron runs only once a day, so hourly runs move to a GitHub Actions schedule with a daily Vercel backup, and "Send now" uses the same function. Applied in plan.md.
- Single-judge points: multi-speaker parsing (prompt 4), schedule compression (cut order in plan §4).
- Control C3 dropped 3.7 points between rounds 3 and 4, so the judges are noisy. Stopped after round 4 as instructed. Target >25 avg was not reached (23.0; Claude 21).
