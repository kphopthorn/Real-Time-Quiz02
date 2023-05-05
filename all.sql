CREATE SOURCE CONNECTOR `postgres-source` WITH(
    "connector.class"='io.confluent.connect.jdbc.JdbcSourceConnector',
    "connection.url"='jdbc:postgresql://postgres:5432/root?user=root&password=secret',
    "mode"='incrementing',
    "incrementing.column.name"='food_id',
    "topic.prefix"='',
    "table.whitelist"='food',
    "key"='food_id');


CREATE SINK CONNECTOR `elasticsearch-sinkfood` WITH(
    "connector.class"='io.confluent.connect.elasticsearch.ElasticsearchSinkConnector',
    "connection.url"='http://elasticsearch:9200',
    "tasks.max"= '1',
    "topics"= 'topic3_1',
    "type.name"= 'changes',
    "value.converter"='io.confluent.connect.avro.AvroConverter',
    "value.converter.schema.registry.url"='http://schema-registry:8081',
    "key.ignore"= 'true');


SET 'auto.offset.reset' = 'earliest';
