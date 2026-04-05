--Patrick Murray, 4/5/26, Lab 7

DROP TABLE IF EXISTS Accounts;

CREATE TABLE Accounts (
  account_id INT PRIMARY KEY,
  owner TEXT NOT NULL,
  balance INT NOT NULL CHECK (balance >= 0)
);

INSERT INTO Accounts (account_id, owner, balance) VALUES
(1, 'Ava', 500),
(2, 'Ben', 300),
(3, 'Cara', 200);

--Query B

select * from Accounts;


BEGIN;

UPDATE Accounts
SET balance = balance -100
WHERE account_id = 1;
UPDATE Accounts
SET balance = balance + 100
WHERE account_id = 2;

COMMIT;


select * from Accounts;

--Reset
BEGIN;

UPDATE Accounts
SET balance = balance +100
WHERE account_id = 1;
UPDATE Accounts
SET balance = balance - 100
WHERE account_id = 2;

COMMIT;
--Query C

SELECT * FROM Accounts;

UPDATE Accounts
SET balance = balance +100
WHERE account_id = 1;

Rollback;

SELECT * FROM Accounts;


