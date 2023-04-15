SELECT "books".* FROM "books" AS "books" LEFT JOIN "books_x_tags" AS "books_x_tags" ON ("books"."id" = "books_x_tags"."book_id") LEFT JOIN "tags" AS "tags_any" ON (("books_x_tags"."tag_id" = "tags_any"."id") AND "tags_any"."name" = 'Tag 1') LEFT JOIN "books" AS "nextPart" ON ("books"."next_part" = "nextPart"."id") LEFT JOIN "books_x_tags" AS "nextPart_books_x_tags" ON ("nextPart"."id" = "nextPart_books_x_tags"."book_id") LEFT JOIN "tags" AS "nextPart_tags_any" ON (("nextPart_books_x_tags"."tag_id" = "nextPart_tags_any"."id") AND "nextPart_tags_any"."name" = 'Tag 3') GROUP BY "books"."id", "books"."id" HAVING ((COUNT("tags_any"."id") > 0) OR (COUNT("nextPart_tags_any"."id") > 0)) ORDER BY "books"."id" ASC;
START TRANSACTION;
INSERT INTO "tags" ("name", "is_global") VALUES ('Tag 5', 'y');
SELECT CURRVAL('tags_id_seq');
INSERT INTO "books_x_tags" ("book_id", "tag_id") VALUES (4, 4);
COMMIT;
SELECT "books".* FROM "books" AS "books" LEFT JOIN "books_x_tags" AS "books_x_tags" ON ("books"."id" = "books_x_tags"."book_id") LEFT JOIN "tags" AS "tags_any" ON (("books_x_tags"."tag_id" = "tags_any"."id") AND "tags_any"."name" = 'Tag 5') LEFT JOIN "books" AS "nextPart" ON ("books"."next_part" = "nextPart"."id") LEFT JOIN "books_x_tags" AS "nextPart_books_x_tags" ON ("nextPart"."id" = "nextPart_books_x_tags"."book_id") LEFT JOIN "tags" AS "nextPart_tags_any" ON (("nextPart_books_x_tags"."tag_id" = "nextPart_tags_any"."id") AND "nextPart_tags_any"."name" = 'Tag 3') GROUP BY "books"."id", "books"."id" HAVING ((COUNT("tags_any"."id") > 0) AND (COUNT("nextPart_tags_any"."id") > 0)) ORDER BY "books"."id" ASC;