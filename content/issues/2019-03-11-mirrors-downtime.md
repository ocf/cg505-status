---
title: Mirrors transfer downtime
date: 2019-03-11 01:20:00
resolved: true
resolvedWhen: 2019-03-11 12:30:00
# Possible severity levels: down, disrupted, notice
severity: down
affected:
  - Mirrors
section: issue
---

*Resolved* - After some configuration fixes, all mirrors are correctly syncing. {{< track "2019-03-11 12:30:00" >}}

*Update* - After more investigation, it seems some mirrors are out of date, and not syncing correctly. {{< track "2019-03-11 10:25:00" >}}

*Resolved* - After updating IP address entries on the new mirrors server, traffic seems to have stabilized. {{< track "2019-03-11 02:36:00" >}}

*Investigating* - After transferring our mirrors service to a new server, connections from certain networks outside Berkeley seem to be blocked. {{< track "2019-03-11 01:20:00" >}}
