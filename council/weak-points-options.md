# Weak points: options research (31 Oct 2026, ~2:45 PM IST)
Context: OBJECTION! on Cloudflare Workers (free plan) + Supabase + Gemini + Resend; solo, voice-built with Claude Code; core freeze 7:00 PM IST. Research only — plan.md not edited.

## Two corrections found while checking docs (fix in plan.md)
1. **Cloudflare cron weekdays: 1 = Sunday** (Quartz style, 1–7 = Sun–Sat). The plan's `30 3 * * 1` would fire on **Sunday**. Use `30 3 * * MON`.
2. **Worker size limit is 64 MiB** on Free per the current Limits page (the plan's "3 MB" note is outdated). The real Free limits that matter: **10 ms CPU per request and per cron run**, 50 subrequests/request, **5 cron triggers per account** (shared across all Workers).

## A. Tracker integration
| Option | Setup | Demo impact | Workers reliability | Judges see a real tracker? |
|---|---|---|---|---|
| **GitHub Issues** (REST, fine-grained PAT: one repo, Issues read/write) | ~10 min: create repo, token, labels | Good: a real issue with labels (owner, due), body quote, link back; judges know GitHub | Excellent: plain `fetch` + JSON, no SDK | Yes for dev teams; weaker for founders/ops (round 5 Meta called it a "fake tracker" for non-engineering decisions) |
| **Notion** (current) | ~10 min: integration + DB + share | Strong: a clean table/board view with Owner, Due, Status | Good with `fetch: fetch.bind(globalThis)` or raw fetch; ~3 req/s limit | Yes, and fits the Indian startup/PM persona best |
| **Linear** (GraphQL, personal API key, free plan) | ~10–15 min: workspace, team id, key | Very strong: polished issue with assignee + due date; PM judges respect it | Good: single GraphQL `fetch` (`issueCreate`) | Yes, a "real" tracker; assignees must be Linear users (demo: map to Akash, owner in title/label) |
| **Jira** (REST v3, API token, Basic auth) | 20–30 min: site, project, issue types, ADF body format | Medium: heavy UI | OK via fetch, but ADF description + fields are fiddly | Yes (enterprise), but overkill and slow to set up |
| **Trello** (REST, key + token) | ~10 min | Medium: a card on a board | Excellent: simple fetch | Lightweight; reads as "to-do board", less a tracker |
| **Google Tasks / Sheets** | 20–40 min: OAuth or service account, JWT signing on Workers | Low–medium | Riskier: Google auth on Workers needs WebCrypto JWT signing | Sheets reads as a spreadsheet, not a tracker |

**Two trackers behind one adapter?** Only if the second is trivial. An adapter interface (`createTask(task) → {url, id}`) costs ~10 min and is good design; a second live target adds ~20–25 min of setup + testing + a second failure mode, and the rubric gives no extra points for two. Worth it **only after 7:00 PM freeze if green**, or skip.

**Recommendation:** **Primary: Notion** (keep — best persona fit, already in the plan, visible log). **Optional: GitHub Issues** behind the same adapter (~20 min, fetch only, most reliable on Workers) as the tracker for dev-team projects, picked per project (projects.tracker = notion|github). Linear is the best "impressive" alternative if Akash already has a Linear workspace (swap for Notion, not add). Avoid Jira and Google Tasks/Sheets today.

## B. Making reminders convincing live (without faking)
Facts checked:
- **Cloudflare Cron Triggers:** minimum interval **1 minute** (`* * * * *`); 5 per account on Free; UTC; 10 ms CPU per run on Free (I/O wait doesn't count); trigger changes can take **up to 15 min to propagate**, so set the schedule before the demo, not during.
- **Durable Object alarms:** available on **Free (SQLite-backed DOs only)**; one alarm per object, millisecond granularity, usually fires within ms but can be delayed up to ~1 min; each setAlarm = 1 row written; 100k requests/day free. Needs a DO class + migration in wrangler and the custom worker export — ~30–45 min with OpenNext, moderate risk.
- **Resend `scheduled_at`:** natural language ("in 2 min") or ISO 8601, up to 30 days ahead; updatable/cancelable via PATCH/cancel; shows as "scheduled" in the Resend dashboard; not for SMTP. Free: 100 emails/day, 10 req/s.

| Option | Effort | Demo strength | Risk |
|---|---|---|---|
| 1. **Every-minute cron** (`* * * * *`) running `runReminders()` with rule "due within the reminder window"; demo task due in ~3 min | ~10 min (one cron line) | Real: the email lands on its own while you talk | Low. Uses 1 of 5 triggers; up to ~60 s jitter; must be deployed ≥15 min before recording |
| 2. **Resend `scheduled_at`** at confirm time: schedule the reminder for `due − lead` (demo lead = 2 min, real = 24 h); store the Resend id; cancel/PATCH if the due date changes | ~20 min | Real and visible: log shows "scheduled 10:32:00 → sent 10:32:04"; Resend dashboard shows it | Low–medium: must cancel on edit; 30-day cap (fine) |
| 3. **Durable Object alarm** per task | 30–45 min | Precise to the second | Medium: DO + OpenNext custom worker + migrations under time pressure |
| 4. **Demo clock / time-travel** (per-project "simulated now" offset, clearly labelled DEMO CLOCK) | ~15 min | Shows the 24 h rule against real data | Judges may see it as staged; use only as a labelled extra |
| 5. **Telegram bot** (BotFather token, `sendMessage` via fetch) | ~15 min | High: phone buzzes on camera | Low; need the chat id; people.telegram_chat_id |
| 6. **Slack incoming webhook / Google Chat webhook** | ~10 min each | Medium–high: message appears in a channel | Low; one URL secret; Slack needs a workspace |
| 7. **Browser push** (Web Push + VAPID on Workers) | 45+ min | Medium | High: VAPID signing on Workers, permissions; skip |
| 8. **Calendar .ics invite** (attach VEVENT with VALARM to the confirm email) | ~20 min | Medium: shows in calendar with its own alarm | Low–medium: client-dependent parsing |
| 9. **On-screen outbox / reminder log** (scheduled_for, sent_at, channel, status, provider id; live-refresh) | ~15 min | Essential: the proof judges can read | Low |

**Recommendation (reminders):** do **1 + 9** in the core (~25 min total): an every-minute cron replaces the hourly one (it's still a real scheduler; idempotent via reminders_log), plus an outbox page showing scheduled vs sent times. In the demo, confirm "Priya: video due in 3 min" (lead time = 2 min for demo-project tasks, 24 h default, shown in the UI), keep talking, and the email arrives + the outbox flips to SENT. Add **2 (Resend scheduled_at)** only if time allows, as a second, independent proof. **Optional channel: Telegram** (~15 min) for the on-camera phone buzz. Skip DO alarms and browser push today.

## Weekly digest
- Cron `30 3 * * MON` (Mon 9:00 AM IST) → `runDigests()` (fix the weekday bug above). Same outbox/log rows (type = digest).
- **Demo proof:** "Send digest now" button + the outbox row; optionally schedule it via Resend `scheduled_at: "in 1 min"` to show a scheduled → sent digest without waiting for Monday. ~10 min extra.
- Keep the digest per person from the people table (+alias inboxes) and show one inbox on camera.

## Short recommendation
| Item | Do | Minutes | Risk |
|---|---|---|---|
| Tracker | Notion primary (keep) + tracker adapter interface | 10 | Low |
| Tracker optional | GitHub Issues behind adapter (per project), after freeze | 20 | Low |
| Reminders | Every-minute cron + lead-time rule + outbox page | 25 | Low (deploy ≥15 min before recording) |
| Reminders optional | Resend scheduled_at as second proof; Telegram buzz | 20 / 15 | Low–medium |
| Digest | Fix cron to `MON`; Send now + outbox row; optional scheduled_at "in 1 min" | 5 / 10 | Low |
| Skip | Jira, Google Tasks/Sheets, DO alarms, browser push | — | — |
Cron budget (5 per account on Free): `* * * * *` reminders + `30 3 * * MON` digest = 2.

Sources: Cloudflare Workers limits, cron triggers and Durable Objects pricing/limits/storage docs; Resend schedule-email, send-email and quota docs (checked 31 Oct 2026). Tracker comparison is from API knowledge (not re-verified today); check token scopes at setup.
