-- RESET
DROP DATABASE IF EXISTS FoodSystem;
CREATE DATABASE FoodSystem;
USE FoodSystem;

-- TABLE
CREATE TABLE Restaurants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_name VARCHAR(255),
    district VARCHAR(50),
    rating FLOAT
);

-- DATA
INSERT INTO Restaurants (restaurant_name, district, rating) VALUES
('Quan A', 'Quận 1', 2.5),
('Quan B', 'Quận 1', 4.5),
('Quan C', 'Quận 3', 4.7),
('Quan D', 'Quận 3', 3.0),
('Quan E', 'Quận 5', 5.0);

-- =========================
-- PHÂN TÍCH LỖI
-- =========================
-- Query sử dụng cả OR và AND nhưng không có ngoặc
-- Trong SQL: AND có độ ưu tiên cao hơn OR
-- => Câu lệnh bị hiểu thành:
--    district = 'Quận 1'
--    OR (district = 'Quận 3' AND rating > 4.0)
-- => Toàn bộ Quận 1 không bị lọc theo rating
-- => Xuất hiện quán rating thấp (2-3 sao)

-- =========================
-- QUERY SAI (đã comment)
-- =========================
/*
SELECT restaurant_name, district, rating
FROM Restaurants
WHERE district = 'Quận 1'
   OR district = 'Quận 3'
   AND rating > 4.0;
*/

-- =========================
-- QUERY ĐÚNG
-- =========================
-- Ép đúng logic bằng ngoặc
SELECT restaurant_name, district, rating
FROM Restaurants
WHERE (district = 'Quận 1' OR district = 'Quận 3')
  AND rating > 4.0;