# Stage 3: Reading meetings, chats and my voice
**Time:** 4:30 to 5:00 PM IST (plan.md prompts 4, 5 and 6)

## Say this
Read plan.md section 2 for details if anything is unclear. Now the input side. Before anything is pasted or spoken, show a project picker where I choose or create a project, and name the meeting automatically, like Hackathon submission number two, with the date and time in IST, and let me edit that name. Other projects must never be compared with each other, which is why this matters.
I'll give the app three kinds of input. Meeting transcripts, where each line has a time in brackets and a speaker name. WhatsApp chat exports, in both the iPhone and the Android format, where the sender is the speaker, and system lines and media omitted lines are skipped. Plain Name colon text pasted from Slack or Google Chat. And a spoken debrief, typed by Wispr, where the speaker is me. Detect which one it is and turn it into utterances with speaker and time.
Then the extraction route: call Gemini with a strict JSON schema and get back decisions and action items, each with owner, a real deadline date, the exact quote, the speaker and the time, plus a topic from the fixed topic list in the plan. Drop anything whose quote is not really in the text. If I correct myself while talking, keep both versions so the screen can strike the first one through.
The main screen has a big debrief box as the hero, saying hold Fn and just talk, plus a paste tab, and then a confirmation tray where every item is a checkbox. Nothing is saved or sent anywhere until I tick it and press confirm. That's must build seven.

## Verify
- The build passes.
- Run the parser on five lines of the kickoff transcript and the demo WhatsApp export, and print speakers and times.
- Make one real extraction call on the kickoff sample and confirm every item has a quote found in the source.
- Load the main screen and confirm the tray shows checkboxes and nothing is written to the database before confirm.

## Commit and push when green
