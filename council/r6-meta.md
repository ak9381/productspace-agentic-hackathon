USER: 8/10
INVESTOR: 6/10
BUSINESS: 7/10
TOTAL30: 21
HACK100: 82 (wispr 18/20, ux 16/20, ai 17/20, problem 12/15, linkedin 11/15, innovation 8/10)
NOVELTY: 6/8
ENDUSER: 6/8
MB1 transcript+speakers: yes — reason paste [mm:ss] Speaker N: + Wispr 30s debrief + filler/self-correction cleaning + optional speaker rename
MB2 decisions/actions/owners/deadlines: yes — reason Gemini JSON with owner, resolved date, exact quote, speaker, timestamp, unquotable dropped
MB3 conflict detection w/ memory: yes — reason topic-key taxonomy + widening 14d/90d/all + embedding fallback + verify_conflict second check + then-vs-now OBJECTION card
MB4 tracker integration: yes — reason ledger IS tracker + one real external: Notion database pages via official API, meets statement
MB5 reminders: yes — reason GitHub Actions hourly /api/reminders + Resend emails due <24h + Reminder log + Send-now
MB6 weekly digest per person: yes — reason /digest/[person] with owned tasks, changes, open objections
MB7 confirmation step: yes — reason confirmation tray, queue_action only queues, nothing posts to Notion/emails until ticked
AGENTIC_CRITIQUE: This is a real agent, not a prompt chain. You have bounded loop, 4 tools with state (search_memory -> verify_conflict -> ask_clarifying -> queue_action), memory retrieval with widening window + embedding fallback, and a hard stop + deterministic fallback. Judgement lives in verify_conflict and Pivot vs Contradicts classification. Risk: 5 steps is still 2 LLM calls on critical path; if Gemini tool-calling misfires under 9h pressure, your trace panel will show empty loop and judges will call it fake.
PROBLEM_CRITIQUE: You actually get why decisions get lost: not transcription, but cross-meeting silent reversal without owner acknowledgment. The kickoff "max team 2" vs "we're three now" is perfect Indian-team example. You miss the real source though: decisions die in WhatsApp, not Zoom. You bury WhatsApp export as stretch. Founder pain is also "who said yes?" - your owner disambiguation via voice Q&A helps, but only if you demo it in hero flow, not as optional rename.
BIGGEST_WEAKNESS: Core fits in 9h only if you freeze at 7:30 and Notion integration is one DB with fixed schema; if you chase voice Q&A and decision-debt score before deploy + login + eval, you will miss submission.
ONE_CHANGE: Make WhatsApp chat-export parser part of frozen core ingestion and cut speaker rename, so OBJECTION triggers on the actual channel where Indian startups lose decisions.
