CREATE TABLE AlternateEmails (
    AlternateEmailID     INT,
    CustomerID           INT,
    EmailAddress         VARCHAR(64)
);

CREATE TABLE ConversationMessages (
    ConversationID   INT,
    SupportAgent     VARCHAR(32),
    MessageSender    VARCHAR(32),
    Message          TEXT,
    Timestamp        DATETIME
);

CREATE TABLE Conversations (
    ConversationID   INT,
    CustomerID       INT
);

CREATE TABLE Customer (
    CustomerID           INT,
    FirstName            VARCHAR(32),
    LastName             VARCHAR(32),
    PrimaryEmailAddress  VARCHAR(64),
    PhoneNumber          VARCHAR(32)
);

CREATE TABLE Orders (
    OrderID        INT,
    CustomerID     INT,
    PaymentStatus  VARCHAR(32),
    OrderTotal     DECIMAL,
    OrderDate      DATETIME
);
