SET 'auto.offset.reset' = 'earliest';


CREATE SINK CONNECTOR `elasticsearch-sinkfood3_1` WITH(
    "connector.class"='io.confluent.connect.elasticsearch.ElasticsearchSinkConnector',
    "connection.url"='http://elasticsearch:9200',
    "tasks.max"= '1',
    "topics"= 'topic3_1',
    "type.name"= 'changes',
    "value.converter"='io.confluent.connect.avro.AvroConverter',
    "value.converter.schema.registry.url"='http://schema-registry:8081',
    "key.ignore"= 'true',
    "partitions"='2');


CREATE SINK CONNECTOR `elasticsearch-sinkfood3_2` WITH(
    "connector.class"='io.confluent.connect.elasticsearch.ElasticsearchSinkConnector',
    "connection.url"='http://elasticsearch:9200',
    "tasks.max"= '1',
    "topics"= 'topic3_2',
    "type.name"= 'changes',
    "value.converter"='io.confluent.connect.avro.AvroConverter',
    "value.converter.schema.registry.url"='http://schema-registry:8081',
    "key.ignore"= 'true',
    "partitions"='2');


CREATE SINK CONNECTOR `elasticsearch-sinkfood3_3` WITH(
    "connector.class"='io.confluent.connect.elasticsearch.ElasticsearchSinkConnector',
    "connection.url"='http://elasticsearch:9200',
    "tasks.max"= '1',
    "topics"= 'topic3_3',
    "type.name"= 'changes',
    "value.converter"='io.confluent.connect.avro.AvroConverter',
    "value.converter.schema.registry.url"='http://schema-registry:8081',
    "key.ignore"= 'true',
    "partitions"='2');
