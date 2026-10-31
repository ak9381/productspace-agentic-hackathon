# Council round 6: OBJECTION! v5 revised, 4 judges (31 Oct ~2:20 PM IST)
Prompt: r6-prompt.txt (v5 with bounded 4-tool agent loop + deterministic fallback, ledger-as-tracker + Notion, ruthless core frozen by 7:30 PM). Raw: r6-agy.md, r6-grok.md, r6-meta.md; r6-claude.md = PENDING. An earlier v5 draft was judged by agy only as round "6a" (r6a-prompt.txt / r6a-agy.md: 18/30, 79/100).

| Judge | U/I/B | /30 | /100 | Novelty /8 | End-user /8 | MB not "yes" | Biggest weakness |
|---|---|---|---|---|---|---|---|
| Claude Code | PENDING | – | – | – | – | – | – |
| agy | 7/6/6 | 19 | 81 | 6 | 5 | MB4, MB5 partial | Notion + cron + Resend plumbing burns ~3 h for no points |
| Meta AI | 8/6/7 | 21 | 82 | 6 | 6 | none | Only fits if frozen at 7:30 with a one-DB Notion schema |
| Grok | 6/4/3 | 13 | 48 | 5 | 5 | MB1, MB3, MB4, MB6 partial | Agent + Notion overbuilt; misses where decisions die (between meetings) |
| **Avg (3)** | | **17.7** | **70.3** | 5.7 | 5.3 | | |

Movement vs round 5: agy +1, Meta AI 0, Grok −2. Grok's swing is noise-sized and the opposite direction to the others. Target (>25, no judge <22) still not met.

## Must-fixes applied in plan.md v5
1. **WhatsApp chat-export parser moves into the frozen core** (agy r5, Meta AI r6, Grok r6): it's where Indian startups lose decisions, and each WhatsApp line carries its sender, which covers speaker attribution (MB1).
2. Optional: a "Share to WhatsApp" wa.me link for a confirmed decision or objection (no API; the user taps send).
3. Kept despite single-judge objections: agent loop (with deterministic fallback), ledger + Notion (one DB, fixed schema, internal token), real reminders + Send now. Faking these would lose must-build credit.
4. Cut: speaker rename UI (Meta AI) → auto-guess from names; rename only as a stretch.
