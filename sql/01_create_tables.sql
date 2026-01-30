DROP TABLE IF EXISTS marketplace_orders;

CREATE TABLE marketplace_orders (
    InvoiceNo TEXT,
    StockCode TEXT,
    Description TEXT,
    Quantity INTEGER,
    InvoiceDate TEXT,
    UnitPrice REAL,
    CustomerID TEXT,
    Country TEXT,
    revenue REAL,
    order_date TEXT,
    month TEXT
);
