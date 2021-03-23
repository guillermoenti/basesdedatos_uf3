/*CREATE TABLE videos (
	id_video INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	video VARCHAR(32) NOT NULL,
	views INT UNSIGNED DEFAULT 0
);

INSERT INTO videos (video)
VALUES ('visto_en_wallapop.mp4');*/

DELIMITER $$

CREATE PROCEDURE add_view (IN _idvideo INT UNSIGNED)
BEGIN
	UPDATE videos SET views=views+1 WHERE id_video=_idvideo;
	SELECT * FROM videos;
END$$

DELIMITER ;
