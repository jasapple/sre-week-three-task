# SRE Week Three Task

## Reduction in toil in ticketing system proposals

Current Engineers have brought up a concern of excessive ticket alerts from internal monitoring which had made finding relavent information for a recent outage more difficult. Due to this, the following proposals are to address this concern and increase operator time to finding relevaent information within current alerting procedures.

1. Splunk
    - Utilizing Splunks log aggregation capabilities, we can centralize all alerts to be captured as logs and then aggregated based on factors such as: alert message, zone, kubernetes namespace, priority
    - Can utilze Splunk to autoremediate alerts by granting access to scale resources accordingly

2. ELK Stack
    - Using Kibana and ElastiSearch to aggregate alerts
    - Similar to Splunk, this can allow for a centralized repository of alerts which can be filtered based on the alert's message contents, origination zone, kubernetes namespace, and priority

3. Prometheus Alerts
    - Implement a prometheus endpoint to monitor alert messages
        - aggregate on message contents
        - able to filter by zone