# Real-Time-Quiz02
1. ภพธร แก้ววิชิต 6420412005
2. อัจฉราพร ไทยลาวัลย์ 6420412011
3. ศุภิสรา อุดมลาภ 6420412013
4. นภพล เสริมชาติเจริญกาล 6420412014

## Installation and Setup

1.
```sh
docker-compose up
```

2. Open KsqlDB.
```sh
docker-compose exec ksqldb-cli  ksql http://ksqldb-server:8088
```

3. Run Source connector (postgres-source).
```sh
RUN SCRIPT '/etc/sql/source.sql';
```

4. Run ipynb file first cell for Create table in PostgresDB. 
5. Run second cell for insert data to table.

6. Run create_stream1.sql to read data from postgres at topic 1.

```sh
RUN SCRIPT '/etc/sql/create_stream1.sql';
```

7. Open another terminal and run clean_stream.sql to send cleaned data to topic 2.
```sh
RUN SCRIPT '/etc/sql/clean_stream.sql';
```

8. Run SINK connector (elasticsearch-sink).
```sh
RUN SCRIPT '/etc/sql/sink.sql';
```

9. Question 1: What is the average number of calories participants guessed for the chicken piadina?

Answer query:
```sh
create table stream3 with( KAFKA_TOPIC='topic3_1',value_format='AVRO') AS 
SELECT gender as sex ,avg(calories_chicken) as avg_cal
FROM clean_data
GROUP BY gender
EMIT CHANGES;
```

10. Question 2: What is the most common breakfast option chosen by female participants who work part-time?

Answer query:
```sh
CREATE TABLE stream4 WITH (KAFKA_TOPIC='topic3_2', VALUE_FORMAT='AVRO')
AS SELECT COUNT(*) AS count, breakfast
FROM clean_data
WHERE gender = 'Female' AND employment = 'Part-Time'
GROUP BY breakfast
EMIT CHANGES;
```

11. Question 3: What is the most common comfort food reason for each gender?

Answer query:
```sh
CREATE TABLE stream5 WITH (KAFKA_TOPIC='topic3_3', VALUE_FORMAT='AVRO') AS
SELECT gender, comfort_food_ _coded_1, COUNT(*) AS count
FROM clean_data
WINDOW TUMBLING (SIZE 1 HOUR) 
WHERE comfort_food_ _coded_1 IS NOT NULL
GROUP BY gender, comfort_food_reasons_coded_1;
```

12. Check output in NoSQLDB elasticsearch.
```sh
docker-compose exec elasticsearch \
  curl -XGET 'localhost:9200/<replace with topic name>/_search?format=json&pretty'
```

