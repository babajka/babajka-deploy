List current state: `crontab -l`

Edit cronjobs: `crontab -e`

### Production configuration

`6,36 * * * * /home/wir-prod/deployed/analytics/babajka-analytics --secretPath=/home/wir-prod/secret-production.json --env=production`

`15 5,17 * * * /home/wir-prod/deployed/analytics/babajka-analytics --secretPath=/home/wir-prod/secret-production.json --env=production --enableSlack`

### Staging configuration

`3,33 * * * * /home/wir-dev/deployed/analytics/babajka-analytics --secretPath=/home/wir-dev/secret-staging.json --env=staging`

`14 5,17 * * * /home/wir-dev/deployed/analytics/babajka-analytics --secretPath=/home/wir-dev/secret-staging.json --env=staging --enableSlack`
