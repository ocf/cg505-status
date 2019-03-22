---
title: General NFS outage
date: 2019-03-22 00:20:00
resolved: false
resolvedWhen: 2019-03-11 12:30:00
# Possible severity levels: down, disrupted, notice
severity: disrupted
affected:
  - SSH Login
  - Webhosting
section: issue
---

*Update* - We've had to restart our public SSH server as we try to resolve this issue. Traffic seems to be stabilizing, and we will continue to monitor the situation. {{< track "2019-03-22 02:30:00" >}}

*Investigating* - We've noticed slowness on our ssh server ssh.ocf.berkeley.edu, and slow response times for webhosting. We're investigating. {{< track "2019-03-22 00:20:00" >}}
