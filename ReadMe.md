
```markdown
# 📚 Bookstore Database Project

A MySQL-based database system developed to manage and organize data for a bookstore. This project is part of our coursework for **Database Design & Programming with SQL** and covers all stages of a database project — from design to implementation, testing, and export.

---

## 📌 Overview

This project simulates the role of a database administrator tasked with designing, implementing, and managing a relational database for a bookstore. It includes tables and relationships that store key information about books, authors, customers, orders, shipping, and more.

---

## ⚙️ Tools and Technologies Used

- **MySQL** – for building and managing the database
- **MySQL Workbench** – for GUI-based development and exporting data
- **Draw.io** – for ERD (Entity Relationship Diagram) design
- **Git & GitHub** – for version control and collaboration

---

## 📁 Project Structure

```bash
bookstore-db-project/
├── bookstore_export.sql     # Exported database dump from MySQL Server
├── README.md                # Project documentation
└── erd/bookstore-ersAssignment.svg          # Entity Relationship Diagram (ERD)
```

---

## 🧱 Key Tables Created

| Table Name          | Description |
|---------------------|-------------|
| `book`              | Stores all books in the bookstore |
| `author`            | List of all authors |
| `book_author`       | Many-to-many mapping between books and authors |
| `book_language`     | Available languages for books |
| `publisher`         | Book publishers |
| `customer`          | Bookstore customers |
| `address`           | List of all physical addresses |
| `country`           | Countries for addresses |
| `customer_address`  | Customer to address mapping |
| `address_status`    | Address status (current, old) |
| `cust_order`        | Orders placed by customers |
| `order_line`        | Books included in each order |
| `shipping_method`   | Possible shipping options |
| `order_status`      | Status of the order (pending, shipped, delivered) |
| `order_history`     | History of changes in order status |

---

## 🔐 User Management

We applied basic **user access control** using MySQL GRANT statements to manage roles and restrict access to sensitive data as part of the project scope.

---

## 🧪 Testing and Sample Queries

We tested the database using multiple queries to:
- Retrieve customers by country
- Get order summaries
- Track book orders and status updates
- Join multiple tables for insights (e.g., `book`, `author`, `order_line`, `cust_order`)

---

## 📤 Export Instructions

The full database was exported using MySQL Workbench GUI and saved as `bookstore_export.sql`. This file can be imported into any MySQL-compatible system.

---

## 📌 How to Run

1. Clone this repository:
```bash
git clone https://github.com/your-username/bookstore-db-project.git
```

2. Open MySQL Workbench or CLI.

3. Run the SQL dump:
```sql
SOURCE path/to/bookstore_export.sql;
```

---

## 👥 Contributors

- **Gideon Kiprotich** (Team Lead)
- **Hope Tshofe**
- **Carey Mwaura Wangare**

---

## 📆 Deadline

> **Submission Deadline:** April 13, 2025, 11:59 PM EAT

---

## 📎 Notes

- All development was done using the MySQL Workbench GUI (not CLI).
- The ERD was generated based on the relational design.
- Export warnings due to version mismatch were noted, but dump was successful.

---

## 📸 ERD Preview

![ERD Diagram](./erd/bookstore-erdAssignment.svg)

---

## 📬 Contact

For any questions, email [giddyprotio@gmail.com](mailto:giddyprotio@gmail.com)
```


