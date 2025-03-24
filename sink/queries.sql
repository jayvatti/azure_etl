-- query 1: List the names of support agents who have messaged at least one customer with a failed payment.
WITH ConversationWithAgent AS (
    SELECT c.CustomerID, cm.SupportAgent
    FROM [dbo].[ConversationMessages] cm
    JOIN [dbo].[Conversations] c
        ON cm.ConversationID = c.ConversationID
    WHERE cm.SupportAgent != 'NA'
)
SELECT DISTINCT SupportAgent
FROM ConversationWithAgent ca
JOIN [dbo].[Orders] o ON ca.CustomerID = o.CustomerID
WHERE o.PaymentStatus = 'Failed';


-- query 2: List the customer id, name, and all email addresses for those customers who do not have consistent
-- email addresses across source systems
SELECT 
    cust.CustomerID, 
    (cust.FirstName + ' ' + cust.LastName) AS Name, 
    cust.PrimaryEmailAddress,
    alt.EmailAddress AS AlternateEmailAddress
FROM [dbo].[Customer] cust
JOIN [dbo].[AlternateEmails] alt 
    ON cust.CustomerID = alt.CustomerID
WHERE cust.PrimaryEmailAddress != alt.EmailAddress
ORDER BY cust.CustomerID;
