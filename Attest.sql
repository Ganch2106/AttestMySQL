DELIMITER //
CREATE PROCEDURE seconds_to_DT(seconds INT)
BEGIN
    DECLARE days INT DEFAULT 0;
    DECLARE hours INT DEFAULT 0;
    DECLARE minutes INT DEFAULT 0;

    -- Расчет дней
    SET days = seconds / 86400;
    SET seconds = seconds % 86400;

    -- Расчет часов
    SET hours = seconds / 3600;
    SET seconds = seconds % 3600;

    -- Расчет минут
    SET minutes = seconds / 60;
    SET seconds = seconds % 60;

    -- Формирование строки с учетом только четных значений
    SELECT CONCAT(
        IF(days % 2 = 0 AND days > 0, CONCAT(days, ' days '), ''),
        IF(hours % 2 = 0 AND hours > 0, CONCAT(hours, ' hours '), ''),
        IF(minutes % 2 = 0 AND minutes > 0, CONCAT(minutes, ' minutes '), ''),
        IF(seconds % 2 = 0 AND seconds > 0, CONCAT(seconds, ' seconds'), '')
    ) AS date_time;
END //
DELIMITER ;

-- Пример вызова процедуры
CALL seconds_to_DT(86400);
