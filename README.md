# Goal
I'd like to find a way to pull data from Postgres and dump it to a common schema in solr

# Set up

### Steps to run
#### Step 1
Run the docker set-up using compose with command below:

```
docker compsose up -d
```

You'll need a `.env` file with the values of the variables found in the [compose file](./compose.yaml).

#### Step 2 - Configure Postgres Connector for Debezium
Register the debezium connector for Postgres with curl (config is in [postgres.json](./cdc_connectors/postgres.json)):

```
curl -X POST --location "http://localhost:8083/connectors" -H "Content-Type: application/json" -H "Accept: application/json" -d @cdc_connectors/postgres.json
```

#### Step 3 - Observe the CDC entries
You can checkout the CDC entries by inspecting the Kafka otpics. I used `kafkacat` (aka `kcat`). I set up two tables in the script [dump.sql](./database/scripts/dump.sql). You'll find topics like . The command below will read to the end using `kafkacat`.

**List Topics**

```
kafkacat    -b localhost:9029 \         # broker address
            -L \                        # List mode
            | grep topic                # Filter on topic keyword
```

**Display Messages for topic**
```
kafkacat -b localhost:9092 \            # broker address
         -t academic.public.schools \   # topic
         -C \                           # Consumer flag
         -o-3 \                         # Read last three messages
         -c3                            # End after reading 3 messages

```