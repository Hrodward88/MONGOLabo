Alter table C
add Categories_category_id INT;



ALTER TABLE films_clean2
ADD column old_hdd2_category_id INT;

alter table films_clean2
drop foreign key films_clean2_ibfk_1;


ALTER TABLE films_clean
ADD CONSTRAINT fk_old_hdd2_category_id
FOREIGN KEY (old_hdd2_category_id)
REFERENCES blockbuster.old_hdd2 (category_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;



UPDATE films_clean AS f
JOIN blockbuster.old_hdd2 AS o ON f.old_hdd2_category_id = o.category_id
SET f.old_hdd2_category_id = o.category_id
WHERE f.old_hdd2_category_id IS NULL;


UPDATE films_clean AS f
SET old_hdd2_category_id = (
  SELECT o.category_id
  FROM blockbuster.old_hdd2 AS o
  WHERE f.old_hdd2_category_id = o.category_id
)
WHERE f.old_hdd2_category_id IS NULL;