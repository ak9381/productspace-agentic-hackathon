# Product Space x Wispr Agentic AI Hackathon: working context

Context store for Akash K Raju's build at The Product Space Agentic AI Hackathon (online, 31 Oct 2026). It keeps the rules, problem statements, plan and every LLM council round, so the next round or the next agent starts with full context.

## Layout
| Path | What |
|---|---|
| `instructions.md` | How the bot works for this event (scope, guardrails) |
| `rules.md` | Event rules, scoring (Wispr 20, prototype/UX 20, AI 20, problem 15, LinkedIn 15, innovation 10) |
| `problem-statements.md` | The 5 problem statements |
| `kickoff-notes.md` | Cleaned notes from the kickoff (raw captions are not published) |
| `checklist.md` | Setup and submission checklist |
| `plan.md` | Chosen track and build plan (when written) |
| `github-audit.md` | What earlier work validates each track (patterns only, no reuse) |
| `council/round-N.md` | Each council round: candidates, judge scores, what changed |
| `council/rN-prompt.txt`, `rN-cands.txt` | Exact prompt and candidate list for each round |
| `council/claude/`, `council/agy/` | Judge answers (Claude Code, Antigravity) |
| `council/scores.csv` | Every score: date, round, candidate, judge, user/investor/business (/30), hack fit (/100), weakness |
| `sync.sh` | Re-copy from the working folder, scrub, secret-check, push |

## LLM council method (run the next round)
1. **Candidates.** One concept per problem statement (A–E), each with a voice-first core loop.
2. **Ask.** Send the same prompt to every judge (here: Claude Code CLI and Antigravity `agy`; web Claude, Gemini, Grok, Meta AI also work). Each judge scores every candidate: User /10 + Investor /10 + Business /10 = /30, plus a hackathon-fit score /100 against the official rubric, and names the biggest weakness.
3. **Record.** Save raw answers under `council/<judge>/rN.md`, append rows to `scores.csv`, and write `round-N.md` with per-judge scores and the average.
4. **Update.** Fix each weakness the judges named, drop the weakest candidates, and write `r(N+1)-cands.txt`.
5. **Re-ask** with the updated candidates and the previous round's feedback. Repeat for 4 rounds; pick the winner on the average and on how stable it stayed across rounds.
6. Run `./sync.sh` after each round.

Never paste API keys, passwords or codes into prompts or files here. This repo is public.
