
# SQL Overview — Concepts & Cheat Sheet

A single-file SQL reference script covering core to intermediate concepts, built around a sample `employee` table. Useful as a quick-revision cheat sheet or interview prep guide.

---

## 📂 What's Inside

| Section | Topics Covered |
|---|---|
| **DDL & DML** | `CREATE`, `DROP`, `ALTER` (add/drop/rename column, rename table, change data type), `INSERT`, `UPDATE`, `DELETE` |
| **Operators** | `AND`, `OR`, `IN`, `BETWEEN`, `LIKE` (pattern matching) |
| **Sorting & Limiting** | `ORDER BY`, `LIMIT` |
| **Aggregate Functions** | `COUNT`, `SUM`, `AVG`, `MIN`, `MAX` |
| **GROUP BY / HAVING** | Dept-wise aggregation, filtering grouped results |
| **Subqueries** | Single-row, multi-row, and correlated subqueries |
| **Date Functions** | `CURRENT_DATE`, `DATEDIFF`, `EXTRACT` (year/month/day/quarter/week/dow/doy), `TO_CHAR`, `DATE_TRUNC`, `ADD_MONTHS`, `MONTHS_BETWEEN`, `TO_DATE` |
| **String Functions** | `UPPER/LOWER/INITCAP`, `SUBSTR`, `SPLIT_PART`, `POSITION`, `INSTR`, `CONCAT`, `RPAD/LPAD`, `TRIM` variants, `REPLACE` |
| **Regex Functions** | `REGEXP_REPLACE`, `REGEXP_SUBSTR`, `REGEXP_COUNT`, `REGEXP_LIKE` — includes email, date, and pattern-matching examples |
| **Window Functions** | `ROW_NUMBER`, `RANK`, `DENSE_RANK`, `LAG`, `LEAD`, running totals, `PARTITION BY` |
| **CTE** | `WITH` clause for readable top-N queries |
| **EXISTS vs IN** | Performance comparison for small vs. large datasets |
| **Joins** | `INNER`, `LEFT`, `RIGHT`, `FULL OUTER`, `SELF`, `CROSS` joins |

---

## 🗃️ Sample Data

- **`employee`** — Emp_id, Emp_name, Dept, Sal, Age, DOJ, Curr_day, experience
- **`employees` / `department`** — used for join examples (FK: `dept_id`)
- **`selfemployees`** — Emp_id, Emp_name, Mang_id, used for self-join (manager hierarchy)

---

## Author

**Vishwa Bharath**
 — Senior SAS Developer & Data Analyst
[LinkedIn](https://linkedin.com/in/vishwa-bharath-87b1bb104) · [GitHub](https://github.com/vishwadata)
