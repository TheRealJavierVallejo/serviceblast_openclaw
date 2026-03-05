# Heartbeat Instructions

This file runs automatically every 30 minutes. Follow these instructions exactly.

## What to Do on Each Heartbeat

1. **Check the time.** If it is between 8:00 AM and 8:30 AM Florida time (EST/EDT):
   - Pull a morning summary from GoHighLevel if the GHL skill is available
   - Include: new leads since yesterday, appointments booked today, open opportunities in pipeline
   - Send the summary to the owner via Telegram
   - Sign off with: "Good morning! Here's your daily snapshot — Blast 🦈"

2. **If it is Monday between 8:00 AM and 9:00 AM:**
   - Send a full weekly summary including: total leads this week, total jobs booked, pipeline value, top performing source
   - Sign off with: "Weekly report ready — Blast 🦈"

3. **If no action is needed:**
   - Reply HEARTBEAT_OK and do nothing else

## Important Rules
- Do NOT repeat tasks from previous heartbeats
- Do NOT send duplicate messages
- If GHL skill is not yet connected, skip the data pull and reply HEARTBEAT_OK
- Keep all Telegram messages short and scannable
