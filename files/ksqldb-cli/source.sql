CREATE SOURCE CONNECTOR `postgres-source` WITH(
    "connector.class"='io.confluent.connect.jdbc.JdbcSourceConnector',
    "connection.url"='jdbc:postgresql://postgres:5432/root?user=root&password=secret',
    "mode"='incrementing',
    "incrementing.column.name"='food_id',
    "topic.prefix"='',
    "table.whitelist"='food',
    "key"='food_id');

SET 'auto.offset.reset' = 'earliest';
