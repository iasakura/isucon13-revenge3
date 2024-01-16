#!/usr/bin/env bash

set -eu

if test -f /home/isucon/env.sh; then
    . /home/isucon/env.sh
fi


ISUCON_DB_HOST=${ISUCON13_MYSQL_DIALCONFIG_ADDRESS:-127.0.0.1}
ISUCON_DB_PORT=${ISUCON13_MYSQL_DIALCONFIG_PORT:-3306}
ISUCON_DB_USER=isucon
ISUCON_DB_PASSWORD=isucon
ISUCON_DB_NAME=${ISUCON13_MYSQL_DIALCONFIG_DATABASE:-isupipe}

indices=(
    'ALTER TABLE `users` ADD INDEX `users_index` (`name`);'
    'ALTER TABLE `themes` ADD INDEX `themes_index` (`user_id`);'
    'ALTER TABLE `tags` ADD INDEX `tags_index` (`name`);'
    'ALTER TABLE `livestream_tags` ADD INDEX `livestream_tags_index1` (`tag_id`);'
    'ALTER TABLE `livestream_tags` ADD INDEX `livestream_tags_index2` (`livestream_id`);'
    'ALTER TABLE `livestreams` ADD INDEX `livestreams_index` (`user_id`);'
    'ALTER TABLE `livestream_viewers_history` ADD INDEX `livestream_viewers_history_index` (`livestream_id`, `user_id`);'
    'ALTER TABLE `livecomment_reports` ADD INDEX `livecomment_reports_index` (`livestream_id`);'
    'ALTER TABLE `livecomments` ADD INDEX `livecomments_index` (`livestream_id`);'
    'ALTER TABLE `ng_words` ADD INDEX `ng_words_index` (`livestream_id`, `user_id`);'
    'ALTER TABLE `reactions` ADD INDEX `reactions_index` (`livestream_id`, `created_at`);'
    'ALTER TABLE `icons` ADD INDEX `image_index` (`user_id`);'
)

for idx in "${indices[@]}"
do
    echo $idx | mysql -u"$ISUCON_DB_USER" \
        -p"$ISUCON_DB_PASSWORD" \
        --host "$ISUCON_DB_HOST" \
        --port "$ISUCON_DB_PORT" \
        "$ISUCON_DB_NAME" || echo exists
done